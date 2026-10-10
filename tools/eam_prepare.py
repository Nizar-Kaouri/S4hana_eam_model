#!/usr/bin/env python3
"""Prepare and reconcile EAM CSV exports with explicit cutover and cohort contracts.

Only reads exports and writes new files. Never connects to or posts into SAP.
"""
import argparse
import csv
import hashlib
import json
import sys
from datetime import datetime
from pathlib import Path

from mig_reconcile import InputError, Maps, read_csv, records, records_report, require


def date(value, label):
    try:
        return datetime.strptime(value, "%Y%m%d").date()
    except (ValueError, TypeError) as exc:
        raise InputError(f"{label}: expected a valid YYYYMMDD date, got {value!r}") from exc


def identity(row, columns):
    return tuple(row[c] for c in columns)


def unique(rows, columns, label):
    require(rows, columns, label)
    seen = set()
    for row in rows:
        key = identity(row, columns)
        if key in seen:
            raise InputError(f"{label}: duplicate key {key!r}")
        seen.add(key)
    return seen


def snapshot(rows, contract, cutover):
    """Select state before deletion filtering; reject ambiguous or unevaluated ECM.

    For interval mode overlapping effective states are errors. For state mode the
    greatest (valid-from, numeric counter) wins per identity. Change-number states
    require an explicit eligibility column supplied by an SAP effectivity evaluation.
    """
    at = date(cutover, "cutover")
    keys = contract["identity"]
    start, end = contract.get("valid_from"), contract.get("valid_to")
    counter = contract.get("counter")
    deletion = contract.get("deletion")
    change = contract.get("change_number")
    eligible = contract.get("eligibility")
    order_fields = contract.get("order_fields", [])
    exclusions = contract.get("exclude", {})
    columns = keys + [c for c in (start, end, counter, deletion, change, eligible) if c] + order_fields + list(exclusions)
    require(rows, columns, "snapshot")
    groups = {}
    for row in rows:
        if any(row[field] in values for field, values in exclusions.items()):
            continue
        if change and row[change] and not eligible:
            raise InputError("change-number state needs an explicit eligibility column from SAP effectivity evaluation")
        if eligible:
            verdict = row[eligible].upper()
            if verdict not in ("Y", "N"):
                raise InputError(f"eligibility must be Y or N, got {verdict!r}")
            if verdict == "N":
                continue
        begin = date(row[start], start) if start else date("00010101", "default")
        finish = date(row[end], end) if end else date("99991231", "default")
        if begin > finish:
            raise InputError(f"reversed interval for {identity(row, keys)!r}")
        if not begin <= at <= finish:
            continue
        version = row[counter] if counter else "0"
        if not version.isdigit():
            raise InputError(f"{counter}: expected an unsigned integer, got {version!r}")
        if any(not row[c].isdigit() for c in order_fields):
            raise InputError("snapshot order fields must contain unsigned integers")
        key, rank = identity(row, keys), (begin, *(int(row[c]) for c in order_fields), int(version))
        previous = groups.get(key)
        if previous:
            if contract.get("mode") == "interval":
                raise InputError(f"overlapping intervals for {key!r}; resolve in SAP")
            if previous[0] == rank:
                raise InputError(f"ambiguous state rank for {key!r}")
        if previous is None or rank > previous[0]:
            groups[key] = (rank, row)
    deleted_values = contract.get("deleted_values", ["X"])
    return [row for _, row in (groups[k] for k in sorted(groups))
            if not deletion or row[deletion] not in deleted_values]


def cohort(rows, parents, child_columns, parent_columns):
    if len(child_columns) != len(parent_columns) or not child_columns:
        raise InputError("cohort requires equal, nonempty child and parent key lists")
    require(rows, child_columns, "child")
    allowed = unique(parents, parent_columns, "parent cohort")
    return [r for r in rows if identity(r, child_columns) in allowed]


def join(rows, parents, child_columns, parent_columns, fields):
    """Many-to-one enrichment; reject orphan rows rather than silently losing them."""
    if len(child_columns) != len(parent_columns) or not child_columns:
        raise InputError("join requires equal, nonempty child and parent key lists")
    unique(parents, parent_columns, "join parent")
    require(rows, child_columns, "join child")
    require(parents, list(fields.values()), "join parent")
    lookup = {identity(r, parent_columns): r for r in parents}
    result = []
    for row in rows:
        key = identity(row, child_columns)
        if key not in lookup:
            raise InputError(f"orphan join key {key!r}")
        if set(fields) & set(row):
            raise InputError("join output aliases collide with existing columns")
        result.append({**row, **{alias: lookup[key][field] for alias, field in fields.items()}})
    return result


def aliases(rows, contract):
    fields = contract["fields"]
    require(rows, list(fields.values()), "alias input")
    return [{alias: row[column] for alias, column in fields.items()} for row in rows]


def closure(rows, roots, key_column, reference_column, root_column):
    """Follow nested service packages without dropping nested lines or accepting cycles."""
    require(rows, [key_column, reference_column], "nested package rows")
    require(roots, [root_column], "package roots")
    root_keys = {r[root_column] for r in roots}
    by_key = {}
    for row in rows:
        by_key.setdefault(row[key_column], []).append(row)
    done, active = set(), set()

    def visit(key, nested=False, depth=0):
        if depth > 500:
            raise InputError("package reference depth exceeds 500")
        if not key or not key.strip("0"):
            return
        if key in active:
            raise InputError(f"cyclic package reference {key!r}")
        if key in done:
            return
        if key not in by_key:
            if nested:
                raise InputError(f"missing nested package {key!r}; export its rows too")
            return  # Empty root packages may legitimately have no service lines.
        active.add(key)
        for row in by_key[key]:
            visit(row[reference_column], True, depth + 1)
        active.remove(key)
        done.add(key)

    for key in root_keys:
        visit(key)
    return [r for r in rows if r[key_column] in done]


def compare_structure(mapping, view, source, target, maps=None, translate=False, fields=None):
    matches = [s for s in mapping["structures"] if s["consumption_view"] == view]
    if not matches:
        raise InputError(f"unknown extraction structure {view}")
    structure = matches[0]
    selected = fields or [f["element"] for f in structure["fields"] if f["element"] not in structure["keys"]]
    available = {f["element"] for f in structure["fields"]}
    if set(selected) - available:
        raise InputError(f"unknown comparison fields: {sorted(set(selected) - available)}")
    contract = {"module": mapping["module"], "reconciliation": {"source_values": "source",
                "compare": {"key": structure["keys"], "fields": selected}}}
    return records_report(view, records(contract, source, target, maps or Maps(None), translate=translate))


def write_csv(path, rows, columns):
    with Path(path).open("w", encoding="utf-8-sig", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=columns, extrasaction="raise")
        writer.writeheader()
        writer.writerows(rows)


def raw_contract(schema):
    require(schema, ["FIELDNAME", "KEYFLAG"], "DDIC schema")
    unique(schema, ["FIELDNAME"], "DDIC schema")
    columns = [r["FIELDNAME"] for r in schema if r["FIELDNAME"] != "MANDT"]
    keys = [r["FIELDNAME"] for r in schema if r["KEYFLAG"] == "X" and r["FIELDNAME"] != "MANDT"]
    if not keys:
        raise InputError("DDIC schema has no non-client key; supply a verified comparison contract")
    return {"module": "raw table", "reconciliation": {"source_values": "source", "compare": {
        "key": keys, "fields": [c for c in columns if c not in keys]}}}


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("action", choices=["snapshot", "cohort", "join", "aliases", "compare", "compare-raw", "text-keys", "closure"])
    parser.add_argument("--input", required=True)
    parser.add_argument("--out", required=True)
    parser.add_argument("--contract")
    parser.add_argument("--cutover")
    parser.add_argument("--parent")
    parser.add_argument("--child-keys")
    parser.add_argument("--parent-keys")
    parser.add_argument("--target")
    parser.add_argument("--mapping")
    parser.add_argument("--view")
    parser.add_argument("--maps")
    parser.add_argument("--translate", action="store_true")
    parser.add_argument("--fields", help="explicit comma-separated comparison fields")
    parser.add_argument("--schema", help="DDIC field catalogue from the SAP table exporter")
    args = parser.parse_args(argv)
    try:
        input_path, output_path = Path(args.input).resolve(), Path(args.out).resolve()
        protected = [Path(p).resolve() for p in (args.input, args.parent, args.target, args.mapping, args.contract, args.schema) if p]
        if output_path in protected or Path(str(output_path) + ".audit.json") in protected:
            raise InputError("output must not overwrite an input")
        rows = read_csv(input_path, preserve_values=True)
        contract = json.loads(Path(args.contract).read_text(encoding="utf-8")) if args.contract else {}
        columns = rows.columns
        if args.action == "snapshot":
            if not args.cutover or not contract.get("identity"):
                raise InputError("snapshot needs --cutover and a contract with identity")
            result = snapshot(rows, contract, args.cutover)
        elif args.action in ("cohort", "join"):
            if not args.parent or not args.child_keys or not args.parent_keys:
                raise InputError("cohort/join needs --parent, --child-keys and --parent-keys")
            parents = read_csv(args.parent)
            child_keys, parent_keys = args.child_keys.split(","), args.parent_keys.split(",")
            if args.action == "cohort":
                result = cohort(rows, parents, child_keys, parent_keys)
            else:
                if len(child_keys) != len(parent_keys) or not contract.get("fields"):
                    raise InputError("join needs matching keys and contract.fields")
                result = join(rows, parents, child_keys, parent_keys, contract["fields"])
                columns = columns + list(contract["fields"])
        elif args.action == "aliases":
            if not contract.get("fields"):
                raise InputError("aliases needs contract.fields")
            result = aliases(rows, contract)
            columns = list(contract["fields"])
        elif args.action == "closure":
            if not args.parent or not all(c in contract for c in ("key", "reference", "root")):
                raise InputError("closure needs --parent and contract.key/reference/root")
            result = closure(rows, read_csv(args.parent), contract["key"], contract["reference"], contract["root"])
        elif args.action == "text-keys":
            keys = ["TextObject", "TextName", "TextID", "Language"]
            unique(rows, keys, "selected text index")
            for row in rows:
                if any(not row[c] or any(ch in row[c] for ch in "\t\r\n") for c in keys):
                    raise InputError("text keys must be populated and must not contain tabs or newlines")
                limits = {"TextObject": 10, "TextName": 70, "TextID": 4, "Language": 1}
                if any(len(row[c]) > limit for c, limit in limits.items()):
                    raise InputError("text key exceeds SAP text-key lengths; use a one-character internal language key")
            output_path.write_text("".join("\t".join(row[c] for c in keys) + "\n" for row in rows), encoding="utf-8")
            return 0
        elif args.action == "compare-raw":
            if not args.target or not args.schema:
                raise InputError("compare-raw needs --target and --schema")
            mapping = raw_contract(read_csv(args.schema))
            if contract:
                if not contract.get("key") or not contract.get("fields"):
                    raise InputError("raw comparison override needs key and fields")
                mapping["reconciliation"]["compare"] = contract
            report, ok = records_report("raw table", records(mapping, rows, read_csv(args.target, preserve_values=True),
                                       Maps(args.maps), translate=args.translate,
                                       exact_fields=contract.get("exact_fields", ["Text", "Format"])))
            output_path.write_text(report, encoding="utf-8")
            return 0 if ok else 1
        else:
            if not args.target or not args.mapping or not args.view:
                raise InputError("compare needs --target, --mapping and --view")
            mapping = json.loads(Path(args.mapping).read_text(encoding="utf-8"))
            report, ok = compare_structure(mapping, args.view, rows, read_csv(args.target),
                                           Maps(args.maps), args.translate,
                                           args.fields.split(",") if args.fields else None)
            output_path.write_text(report, encoding="utf-8")
            return 0 if ok else 1
        write_csv(output_path, result, columns)
        audit = {"action": args.action, "input": str(input_path), "input_sha256": hashlib.sha256(input_path.read_bytes()).hexdigest(),
                 "input_rows": len(rows), "output_rows": len(result), "cutover": args.cutover,
                 "contract": contract, "output_sha256": hashlib.sha256(output_path.read_bytes()).hexdigest(),
                 "related_inputs": {str(p): hashlib.sha256(p.read_bytes()).hexdigest() for p in protected if p != input_path}}
        Path(str(output_path) + ".audit.json").write_text(json.dumps(audit, indent=2) + "\n", encoding="utf-8")
        print(f"{args.action}: {len(rows)} input rows -> {len(result)} output rows; {output_path}")
        return 0
    except (InputError, OSError, ValueError, KeyError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
