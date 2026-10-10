#!/usr/bin/env python3
"""Check a candidate mapping against a customer's native DDIC field/key export.

This checks complete single-client table grain, not activation or posting support.
"""
import argparse
import json
from pathlib import Path
from mig_reconcile import InputError, read_csv, require


def check(mapping, view, schema):
    matches = [s for s in mapping['structures'] if s['consumption_view'] == view]
    if len(matches) != 1:
        raise InputError('view must identify exactly one mapping structure')
    require(schema, ['FIELDNAME', 'KEYFLAG', 'DATATYPE'], 'DDIC export')
    actual = {}
    for row in schema:
        field, flag = row['FIELDNAME'].strip().upper(), row['KEYFLAG'].strip().upper()
        if not field or field in actual or flag not in ('', 'X'):
            raise InputError('empty/duplicate DDIC fields or invalid key flags')
        actual[field] = row
    if not actual or not any(r['KEYFLAG'].strip().upper() == 'X' for r in actual.values()):
        raise InputError('DDIC export must contain fields and native key flags')
    structure, projected, tables = matches[0], {}, set()
    for field in structure['fields']:
        native = field['source'].split('-')
        if len(native) != 2 or not all(native):
            raise InputError('DDIC check requires direct TABLE-FIELD mappings')
        tables.add(native[0].upper());projected[field['element']] = native[1].upper()
    if len(tables) != 1 or len(projected) != len(structure['fields']) or len(set(projected.values())) != len(projected):
        raise InputError('DDIC check requires one table and unique aliases/native fields')
    # Only a typed MANDT is implicit because the helper reads the current client.
    implicit = {'MANDT'} if actual.get('MANDT', {}).get('DATATYPE', '').strip().upper() == 'CLNT' else set()
    actual_keys = {f for f, r in actual.items() if r['KEYFLAG'].strip().upper() == 'X'} - implicit
    try: declared = {projected[k] for k in structure['keys']}
    except KeyError as exc: raise InputError('declared key is not projected') from exc
    missing = sorted(set(projected.values()) - set(actual))
    omitted, extra = sorted(actual_keys - declared), sorted(declared - actual_keys)
    return {'view': view, 'table': next(iter(tables)), 'scope': 'current client only',
            'missing_fields': missing, 'omitted_native_keys': omitted,
            'non_native_declared_keys': extra, 'passed': not (missing or omitted or extra),
            'SAP_runtime_verified': False}


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--mapping', type=Path, required=True)
    parser.add_argument('--view', required=True)
    parser.add_argument('--schema', type=Path, required=True, help='TABLE.csv.fields.csv from the native helper')
    parser.add_argument('--out', type=Path, required=True)
    args = parser.parse_args()
    try:
        result = check(json.loads(args.mapping.read_text(encoding='utf-8-sig')), args.view, read_csv(args.schema))
        args.out.parent.mkdir(parents=True, exist_ok=True)
        args.out.write_text(json.dumps(result, indent=2) + '\n', encoding='utf-8')
        print('DDIC key/field check ' + ('PASS' if result['passed'] else 'FAIL'))
        return 0 if result['passed'] else 1
    except (InputError, OSError, ValueError, KeyError) as exc:
        print('DDIC check error: ' + str(exc));return 2


if __name__ == '__main__': raise SystemExit(main())
