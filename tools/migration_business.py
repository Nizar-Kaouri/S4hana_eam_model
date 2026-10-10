#!/usr/bin/env python3
"""Explicit cutover selection and Decimal business totals for migration CSVs.

These operations require a customer-approved field contract. They do not establish
SAP posting eligibility, extract historic stock, translate currency or post data.
"""
import argparse
import json
from decimal import Decimal, InvalidOperation, localcontext
from pathlib import Path

from eam_prepare import date, unique, write_csv
from mig_reconcile import CsvRows, InputError, read_csv, require


def open_items(exports, contract, cutover):
    at = date(cutover, 'cutover')
    if not exports or not contract.get('key'):
        raise InputError('open item selection needs exports and a business key')
    columns = exports[0].columns
    if any(e.columns != columns for e in exports):
        raise InputError('open and cleared exports must have identical aliases and column order')
    rows = CsvRows([row for export in exports for row in export], columns)
    unique(rows, contract['key'], 'combined open and cleared items')
    posting, clearing = contract['posting_date'], contract['clearing_date']
    require(rows, [posting, clearing], 'open items')
    selected = []
    for row in rows:
        posted = date(row[posting], posting)
        cleared = None if row[clearing] in ('', '00000000') else date(row[clearing], clearing)
        if posted <= at and (cleared is None or cleared > at):
            selected.append(row)
    return CsvRows(selected, columns)


def number(value, label):
    try:
        value = Decimal(value)
    except InvalidOperation as exc:
        raise InputError(f'{label}: expected an internal decimal number') from exc
    if not value.is_finite():
        raise InputError(f'{label}: nonfinite amount')
    if len(value.as_tuple().digits) > 128 or abs(value.as_tuple().exponent) > 128:
        raise InputError(f'{label}: decimal precision/scale exceeds 128')
    return value


def add_exact(left, right):
    exponent = min(left.as_tuple().exponent, right.as_tuple().exponent)
    digits = max(len(v.as_tuple().digits) + v.as_tuple().exponent - exponent for v in (left, right))
    with localcontext() as context:
        context.prec = max(1, digits + 1)
        return left + right


def totals(rows, contract):
    groups, metrics = contract['group_by'], contract['metrics']
    if not groups or not metrics or not contract.get('key'):
        raise InputError('totals need nonempty grouping, metrics and unique record keys')
    unique(rows, contract['key'], 'totals records')
    require(rows, groups, 'totals dimensions')
    result = {}
    for metric in metrics:
        field, dimension, basis = metric['field'], metric['dimension'], metric['basis']
        if dimension not in groups or basis not in ('signed', 'unsigned'):
            raise InputError('each metric needs its currency/unit grouping and an explicit sign basis')
        require(rows, [field, dimension], 'totals metric')
        if basis == 'unsigned':
            require(rows, [metric['sign_field']], 'unsigned sign')
            signs = {k: number(v, 'sign') for k, v in metric['signs'].items()}
            if any(v not in (Decimal(1), Decimal(-1)) for v in signs.values()):
                raise InputError('sign factors must be 1 or -1')
        for row in rows:
            if not row[dimension].strip():
                raise InputError('currency/unit dimension cannot be empty')
            value = number(row[field], field)
            if basis == 'unsigned':
                if value < 0 or row[metric['sign_field']] not in signs:
                    raise InputError('unsigned values must be nonnegative with a known sign code')
                if signs[row[metric['sign_field']]] == -1:
                    value = value.copy_negate()
            key = tuple(row[g] for g in groups) + (field,)
            result[key] = add_exact(result.get(key, Decimal(0)), value)
    return result


def compare_totals(source, target, contract):
    left, right = totals(source, contract), totals(target, contract)
    tolerance = number(contract.get('tolerance', '0'), 'tolerance')
    if tolerance < 0:
        raise InputError('tolerance must be nonnegative')
    # A missing group is a difference even if its numeric total is zero.
    differences = []
    for key in sorted(set(left) | set(right)):
        a, b = left.get(key, Decimal(0)), right.get(key, Decimal(0))
        difference = add_exact(b, a.copy_negate())
        if key not in left or key not in right or difference.copy_abs() > tolerance:
            differences.append({'group': list(key), 'source': str(a), 'target': str(b), 'difference': str(difference)})
    return differences


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__)
    ap.add_argument('action', choices=['open-items', 'totals'])
    ap.add_argument('--input', nargs='+', required=True)
    ap.add_argument('--target')
    ap.add_argument('--contract', required=True)
    ap.add_argument('--cutover')
    ap.add_argument('--out', required=True)
    args = ap.parse_args(argv)
    try:
        out = Path(args.out).resolve()
        inputs = [Path(p).resolve() for p in args.input + [args.contract] + ([args.target] if args.target else [])]
        if out in inputs or out.exists():
            raise InputError('choose a new output file; inputs and existing results are protected')
        contract = json.loads(Path(args.contract).read_text(encoding='utf-8'))
        exports = [read_csv(p, preserve_values=True) for p in args.input]
        if args.action == 'open-items':
            if not args.cutover:
                raise InputError('open-items needs --cutover')
            rows = open_items(exports, contract, args.cutover)
            write_csv(out, rows, rows.columns)
            return 0
        if len(exports) != 1 or not args.target:
            raise InputError('totals needs one source export and --target')
        differences = compare_totals(exports[0], read_csv(args.target, preserve_values=True), contract)
        out.write_text(json.dumps({'differences': differences, 'contract': contract}, indent=2) + '\n', encoding='utf-8')
        return 1 if differences else 0
    except (InputError, OSError, ValueError, KeyError) as exc:
        print(f'ERROR: {exc}')
        return 2


if __name__ == '__main__':
    raise SystemExit(main())
