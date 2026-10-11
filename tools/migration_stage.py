#!/usr/bin/env python3
"""Validate canonical exports and prepare customer staging TSVs without posting.

All SAP-native extraction and business eligibility remain customer adapter work.
"""
import argparse
import csv
import hashlib
import json
from pathlib import Path
from eam_prepare import unique
from migration_csv import CsvRows, InputError, read_csv, require


def validate(rows, contract):
    fields = contract['fields']
    aliases = [f['element'] for f in fields]
    if rows.columns != aliases:
        raise InputError('canonical CSV headers must match the contract and column order exactly')
    unique(rows, contract['keys'], 'staging cohort')
    contexts = set()
    for row in rows:
        for field in fields:
            value = row[field['element']]
            if any(c in value for c in '\t\r\n\0') or value.endswith(' '):
                raise InputError('staging values cannot contain tabs/newlines/NUL or trailing spaces')
            if len(value.encode('utf-16-le')) // 2 > field['length']:
                raise InputError(field['element'] + ': value exceeds staging field length')
            if field['element'] in contract['keys'] and not value:
                raise InputError('all staging keys must be nonempty')
        if len(row['SourceClient']) != 3 or not row['SourceClient'].isascii() or not row['SourceClient'].isdigit():
            raise InputError('SourceClient must have three ASCII digits')
        contexts.add(tuple(row[k] for k in ['SourceSystem', 'SourceClient', 'ExportBatch']))
    if len(contexts) > 1:
        raise InputError('each staging file must contain one source system/client/export batch')
    return rows


def normalize(rows, contract):
    fields = contract['fields']
    physical = [f['native'] for f in fields]
    require(rows, physical + ['MANDT'], 'physical staging export')
    if len({r['MANDT'] for r in rows}) > 1:
        raise InputError('physical export must contain a single staging client')
    if any(len(r['MANDT']) != 3 or not r['MANDT'].isascii() or not r['MANDT'].isdigit() for r in rows):
        raise InputError('physical staging MANDT must have three ASCII digits')
    result = CsvRows([{f['element']: r[f['native']] for f in fields} for r in rows], [f['element'] for f in fields])
    return validate(result, contract)


def prepare(source, contract, output, physical=False):
    rows = read_csv(source, preserve_values=True)
    rows = normalize(rows, contract) if physical else validate(rows, contract)
    if output.exists():
        raise InputError('output directory must be new; existing staging data is never overwritten')
    # Validate the entire file before publishing any output.
    output.mkdir(parents=True)
    fields = contract['fields']
    with (output/'canonical.csv').open('w', encoding='utf-8-sig', newline='') as f:
        w = csv.DictWriter(f, fieldnames=rows.columns);w.writeheader();w.writerows(rows)
    with (output/'stage.tsv').open('w', encoding='utf-8-sig', newline='') as f:
        w = csv.writer(f, delimiter='\t', lineterminator='\n', quotechar=None, quoting=csv.QUOTE_NONE)
        # A terminal marker preserves empty final CHAR values during GUI/SPLIT.
        w.writerows([[r[field['element']] for field in fields] + ['#MODUPORTER_END#'] for r in rows])
    audit = {'source_sha256': hashlib.sha256(source.read_bytes()).hexdigest(),
             'contract_sha256': hashlib.sha256(json.dumps(contract, sort_keys=True).encode('utf-8')).hexdigest(),
             'table': contract['table'], 'rows': len(rows),
             'SAP_runtime_verified': False, 'business_posting': False,
             'outputs': {name: hashlib.sha256((output/name).read_bytes()).hexdigest() for name in ['canonical.csv', 'stage.tsv']}}
    (output/'audit.json').write_text(json.dumps(audit, indent=2)+'\n', encoding='utf-8')
    return audit


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--contract', type=Path, required=True)
    parser.add_argument('--view', required=True)
    parser.add_argument('--input', type=Path, required=True)
    parser.add_argument('--out', type=Path, required=True)
    parser.add_argument('--physical', action='store_true', help='normalize a full-row export of the customer staging table')
    args = parser.parse_args()
    try:
        contracts = json.loads(args.contract.read_text(encoding='utf-8-sig'))
        if args.view not in contracts: raise InputError('unknown staging view')
        audit = prepare(args.input, contracts[args.view], args.out, args.physical)
        print(str(audit['rows']) + ' rows validated; no SAP posting performed')
        return 0
    except (InputError, OSError, ValueError, KeyError) as exc:
        print('staging error: ' + str(exc));return 2


if __name__ == '__main__': raise SystemExit(main())
