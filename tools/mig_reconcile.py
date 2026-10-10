#!/usr/bin/env python3
"""Reconcile a migration: compare exports of the ECC consumption views with exports of the S/4HANA views.

Two checks, both driven by modules/<module>/mapping.json of the migration-source product:

  counts   ECC count view (<P>C_*MigCount) vs S/4HANA count view, per dimension combination.
  records  ECC consumption view (<P>C_*Mig) vs S/4HANA compare view, record by record on the business key and
           field by field for the compared fields. Reports records missing on S/4HANA, extra records on S/4HANA
           and field differences.

The consumption views deliver the values as stored in ECC. If the load program changed values (e.g. new plant
codes or new numbers), give the tool those old -> new lists as CSV files in a folder (--maps, used with --translate):
value_map_<name>.csv / key_map_<name>.csv with the columns source,target[,comment], where <name> is the element
name in lower case (e.g. value_map_maintenanceplanningplant.csv). Exports are CSV files with a header row of
element names (comma or semicolon separated).

  python3 tools/mig_reconcile.py counts  --module equipment --source ecc_counts.csv  --target s4_counts.csv
  python3 tools/mig_reconcile.py records --module equipment --source ecc_extract.csv --target s4_compare.csv \
          [--strip-zeros] [--out report.md]

Exit code: 0 = no differences, 1 = differences found, 2 = usage / input error.
"""
import argparse
import csv
import json
import io
from decimal import Decimal, InvalidOperation
import re
import sys
from collections import Counter
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
DEFAULT_PRODUCT = "eam_mig_ecc"
MAX_EXAMPLES = 20


class InputError(Exception):
    pass


def load_mapping(product, module):
    p = REPO / "packages" / product / "modules" / module / "mapping.json"
    if not p.exists():
        raise InputError(f"no mapping for {product}:{module} ({p})")
    return json.loads(p.read_text(encoding="utf-8"))


class CsvRows(list):
    def __init__(self, rows, columns):
        super().__init__(rows)
        self.columns = columns


def read_csv(path, preserve_values=False):
    path = Path(path)
    try:
        text = path.read_text(encoding="utf-8-sig")
    except (OSError, UnicodeError) as exc:
        raise InputError(f"cannot read CSV {path}: {exc}") from exc
    if not text.strip():
        raise InputError(f"{path}: CSV header is required, even for an empty export")
    try:
        dialect = csv.Sniffer().sniff(text.splitlines()[0], delimiters=",;\t")
    except csv.Error:
        dialect = csv.excel
    # A header cannot establish whether body values contain escaped quotes.
    # Infer only the separator; SAP/our exports use standard doubled quotes.
    reader = csv.DictReader(io.StringIO(text, newline=""), delimiter=dialect.delimiter,
                            quotechar='"', doublequote=True, strict=True)
    try:
        columns = [c.strip() for c in (reader.fieldnames or [])]
        if not columns or any(not c for c in columns) or len(set(columns)) != len(columns):
            raise InputError(f"{path}: empty or duplicate column names")
        reader.fieldnames = columns
        rows = []
        for r in reader:
            if None in r or any(v is None for v in r.values()):
                raise InputError(f"{path}: row {reader.line_num} has the wrong number of fields")
            rows.append({k: v if preserve_values else v.strip() for k, v in r.items()})
    except csv.Error as exc:
        raise InputError(f"{path}: malformed CSV: {exc}") from exc
    return CsvRows(rows, columns)


class Maps:
    def __init__(self, folder):
        self.folder = Path(folder) if folder else None
        if self.folder and not self.folder.is_dir():
            raise InputError(f"mapping folder does not exist: {self.folder}")
        self.cache = {}

    def get(self, kind, name):
        key = (kind, name)
        if key not in self.cache:
            table = {}
            f = self.folder / f"{kind}_{name}.csv" if self.folder else None
            if f and f.exists():
                for r in read_csv(f):
                    if "source" not in r or "target" not in r:
                        raise InputError(f"{f}: columns source,target expected")
                    if r["source"] in table and table[r["source"]] != r["target"]:
                        raise InputError(f"{f}: source value '{r['source']}' mapped twice")
                    table[r["source"]] = r["target"]
            self.cache[key] = table
        return self.cache[key]

    def translate(self, element, value):
        """Old -> new value from value_map_<element>.csv or key_map_<element>.csv (element in lower case)."""
        for kind in ("value_map", "key_map"):
            table = self.get(kind, element.lower())
            if value in table:
                return table[value]
        return value

    def apply(self, rule, value):
        kind, _, arg = (rule or "").partition(":")
        if kind not in ("value_map", "key_map") or not arg:
            return value
        for name in arg.split("|"):
            table = self.get(kind, name)
            if value in table:
                return table[value]
        return value


def normalize(value, strip_zeros):
    value = (value or "").strip()
    if strip_zeros and value.isdigit():
        value = value.lstrip("0") or "0"
    return value


def require(rows, columns, label):
    available = rows.columns if isinstance(rows, CsvRows) else (rows[0].keys() if rows else columns)
    if missing := [c for c in columns if c not in available]:
        raise InputError(f"{label}: columns missing: {', '.join(missing)}")


SCOPE_RE = re.compile(r"^\s*(\w+)\s*=\s*'([^']*)'\s*$")


def scope_filter(expr):
    """'A = '' and B = 'X'' -> predicate; None if the expression is not a simple AND of equalities."""
    conds = []
    for part in re.split(r"\s+and\s+", expr.strip(), flags=re.IGNORECASE):
        m = SCOPE_RE.match(part)
        if not m:
            return None
        conds.append((m.group(1), m.group(2)))
    return lambda r: all(r.get(c, "") == v for c, v in conds)


# ----------------------------------------------------------------------------- counts

def translated(mapping, force=False):
    """Maps are applied only on request (--translate) or when the mapping says the source still needs them."""
    return force or mapping["reconciliation"].get("source_values") == "needs_maps"


def counts(mapping, source_rows, target_rows, maps, strip_zeros=False, translate=False):
    rec = mapping["reconciliation"]
    do_map = translated(mapping, translate)
    dims = [d["element"] for d in rec["dimensions"]]
    measure = rec.get("measure", "RecordCount")
    require(source_rows, dims + [measure], "source")
    require(target_rows, dims + [measure], "target")

    def total(rows, use):
        acc = Counter()
        for r in rows:
            key = tuple(normalize(maps.translate(d["element"], r[d["element"]]) if use and do_map else r[d["element"]],
                                  strip_zeros) for d in rec["dimensions"])
            try:
                value = Decimal(r[measure])
                if not value.is_finite() or value < 0 or value != value.to_integral_value():
                    raise InvalidOperation
                acc[key] += int(value)
            except (InvalidOperation, ValueError) as exc:
                raise InputError(f"{measure} must be a non-negative integer: {r[measure]!r}") from exc
        return acc

    src, tgt = total(source_rows, True), total(target_rows, False)
    diffs = [(k, src.get(k, 0), tgt.get(k, 0)) for k in sorted(set(src) | set(tgt)) if src.get(k, 0) != tgt.get(k, 0)]
    return {"dimensions": dims, "source_total": sum(src.values()), "target_total": sum(tgt.values()), "differences": diffs}


def counts_report(module, res):
    ok = not res["differences"]
    lines = [f"# Count reconciliation: {module}", "",
             f"- Source (ECC) total: **{res['source_total']}**", f"- Target (S/4HANA) total: **{res['target_total']}**",
             f"- Result: **{'OK - all counts match' if ok else str(len(res['differences'])) + ' difference(s)'}**", ""]
    if not ok:
        lines += ["| " + " | ".join(res["dimensions"]) + " | ECC | S/4HANA | Difference |",
                  "|" + "---|" * (len(res["dimensions"]) + 3)]
        for key, s, t in res["differences"]:
            lines.append("| " + " | ".join(k or "(empty)" for k in key) + f" | {s} | {t} | {t - s:+d} |")
    return "\n".join(lines) + "\n"


# ----------------------------------------------------------------------------- records

def records(mapping, source_rows, target_rows, maps, apply_scope=False, strip_zeros=False, translate=False, exact_fields=()):
    cmp_ = mapping["reconciliation"].get("compare")
    if not cmp_:
        raise InputError(f"module {mapping['module']} has no record comparison in its mapping")
    do_map = translated(mapping, translate)
    keys, fields = cmp_["key"], cmp_["fields"]
    require(source_rows, keys + fields, "source")
    require(target_rows, keys + fields, "target")
    notes = []
    scope = (mapping.get("scope") or {}).get("filter", "")
    if apply_scope and not scope:
        notes.append("no scope filter applied - the consumption view delivers the migration scope already")
    elif apply_scope:
        pred = scope_filter(scope)
        if pred is None:
            notes.append(f"scope filter not applied (not a simple condition): {scope}")
        else:
            before = len(source_rows)
            source_rows = [r for r in source_rows if pred(r)]
            notes.append(f"scope filter `{scope}` kept {len(source_rows)} of {before} source rows")

    def index(rows, use, label):
        out = {}
        for r in rows:
            k = tuple(normalize(maps.translate(e, r[e]) if use and do_map else r[e], strip_zeros) for e in keys)
            if k in out:
                raise InputError(f"{label}: duplicate business key {k!r}; reconciliation requires unique keys after translation and normalization")
            out[k] = r
        return out

    src, tgt = index(source_rows, True, "source"), index(target_rows, False, "target")
    missing = sorted(set(src) - set(tgt))
    extra = sorted(set(tgt) - set(src))
    mismatches = {f: [] for f in fields}
    for k in sorted(set(src) & set(tgt)):
        for f in fields:
            s = maps.translate(f, src[k][f]) if do_map else src[k][f]
            t = tgt[k][f]
            if f not in exact_fields:
                s, t = normalize(s, strip_zeros), normalize(t, strip_zeros)
            if s != t:
                mismatches[f].append((k, s, t))
    return {"key": keys, "source_records": len(src), "target_records": len(tgt), "matched": len(set(src) & set(tgt)),
            "missing": missing, "extra": extra, "mismatches": {f: v for f, v in mismatches.items() if v}, "notes": notes}


def records_report(module, res):
    n_mis = sum(len(v) for v in res["mismatches"].values())
    ok = not (res["missing"] or res["extra"] or n_mis)
    key = " / ".join(res["key"])
    lines = [f"# Record reconciliation: {module}", "",
             f"- Records ECC: **{res['source_records']}** · S/4HANA: **{res['target_records']}** · matched: **{res['matched']}**",
             f"- Missing on S/4HANA: **{len(res['missing'])}** · only on S/4HANA: **{len(res['extra'])}** · field differences: **{n_mis}**",
             f"- Result: **{'OK - complete and equal' if ok else 'DIFFERENCES FOUND'}**", ""]
    lines += [f"> {n}" for n in res["notes"]] + ([""] if res["notes"] else [])
    for title, items in (("Missing on S/4HANA", res["missing"]), ("Only on S/4HANA", res["extra"])):
        if items:
            lines += [f"## {title} ({len(items)})", "", f"| {key} |", "|---|"]
            lines += [f"| {' / '.join(k)} |" for k in items[:MAX_EXAMPLES]]
            if len(items) > MAX_EXAMPLES:
                lines.append(f"| ... {len(items) - MAX_EXAMPLES} more |")
            lines.append("")
    if res["mismatches"]:
        lines += ["## Field differences", "", "| Field | Count |", "|---|---|"]
        lines += [f"| {f} | {len(v)} |" for f, v in res["mismatches"].items()] + [""]
        for f, v in res["mismatches"].items():
            lines += [f"### {f}", "", f"| {key} | ECC (mapped) | S/4HANA |", "|---|---|---|"]
            lines += [f"| {' / '.join(k)} | {s or '(empty)'} | {t or '(empty)'} |" for k, s, t in v[:MAX_EXAMPLES]]
            if len(v) > MAX_EXAMPLES:
                lines.append(f"| ... {len(v) - MAX_EXAMPLES} more | | |")
            lines.append("")
    return "\n".join(lines).rstrip() + "\n", ok


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("check", choices=["counts", "records"])
    ap.add_argument("--module", required=True)
    ap.add_argument("--product", default=DEFAULT_PRODUCT, help=f"migration-source product (default {DEFAULT_PRODUCT})")
    ap.add_argument("--source", required=True, help="CSV export of the ECC view")
    ap.add_argument("--target", required=True, help="CSV export of the S/4HANA view")
    ap.add_argument("--maps", help="folder with value_map_*.csv / key_map_*.csv")
    ap.add_argument("--apply-scope", action="store_true", help="records: apply a simple scope filter (old-value exports only)")
    ap.add_argument("--translate", action="store_true", help="apply the maps from --maps to the source export (old values)")
    ap.add_argument("--strip-zeros", action="store_true", help="ignore leading zeros of numeric values (external formats)")
    ap.add_argument("--out", help="write the Markdown report to this file (default: stdout)")
    args = ap.parse_args(argv)
    try:
        mapping = load_mapping(args.product, args.module)
        maps = Maps(args.maps)
        src, tgt = read_csv(args.source), read_csv(args.target)
        if args.check == "counts":
            res = counts(mapping, src, tgt, maps, args.strip_zeros, args.translate)
            report, ok = counts_report(args.module, res), not res["differences"]
        else:
            report, ok = records_report(args.module, records(mapping, src, tgt, maps, args.apply_scope, args.strip_zeros,
                                                             args.translate))
    except InputError as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 2
    if args.out:
        Path(args.out).write_text(report, encoding="utf-8")
        print(f"{'OK' if ok else 'DIFFERENCES'} - report written to {args.out}")
    else:
        print(report, end="")
    return 0 if ok else 1


if __name__ == "__main__":
    sys.exit(main())
