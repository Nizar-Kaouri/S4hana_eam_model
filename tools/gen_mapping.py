#!/usr/bin/env python3
"""Generate the migration mapping documentation of a migration-source product from modules/*/mapping.json.

Writes
  docs/mapping/<module>.md                 field mapping, key / scope rules, reconciliation, open gaps
  docs/MIGRATION_SEQUENCE.md               load order (levels) derived from sequence_after
  docs/mapping/templates/<kind>_<map>.csv  empty value-map / key-map templates for the customer to fill
                                           (columns: source,target,comment - the format tools/mig_reconcile.py reads)
Usage: python3 tools/gen_mapping.py --product <product> [--check]
Products whose library.json kind is not 'migration-source' are skipped.
"""
import json
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import vdm_paths  # noqa: E402  (consumes --product)
import validate_mapping as vm  # noqa: E402

ROOT = vdm_paths.PRODUCT_ROOT
DOCS = ROOT / "docs"
RULE_TEXT = {"copy": "copy", "value_map": "value map", "key_map": "key map", "convert": "convert",
             "derive": "derive", "constant": "constant", "skip": "not migrated", "info": "information only",
             "scope": "scope filter"}


def cell(text):
    return str(text).replace("|", "\\|").replace("\n", " ")


def rule_text(rule):
    kind, _, arg = rule.partition(":")
    return f"{RULE_TEXT.get(kind, kind)}" + (f": `{arg}`" if kind in ("value_map", "key_map", "convert", "constant")
                                             else (f": {arg}" if arg else ""))


def module_doc(m, status):
    rec = m["reconciliation"]
    lines = [f"# Mapping: {m['module']}", "", status, "",
             f"- **Target:** {m['target']['tool']} - migration object *{m['target']['migration_object']}*",
             f"- **Load after:** {', '.join(f'`{d}`' for d in m['sequence_after']) or '- (first level)'}",
             f"- **Business key:** {', '.join(f'`{k}`' for k in m['key']['business_key'])} · numbering **{m['key']['numbering']}**",
             f"- **Key rule:** {m['key']['note']}",
             f"- **Scope filter:** `{m['scope']['filter']}`" + (f" - {m['scope']['note']}" if m['scope'].get('note') else ""),
             ""]
    for t in m["target"].get("todo_verify", []):
        lines += [f"> {t}", ""]
    lines += ["## Fields", "", "| View | Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |", "|---|---|---|---|---|---|"]
    for f in m["fields"]:
        lines.append(f"| `{f['view']}` | `{f['element']}` | {cell(f['source'])} | {cell(f['target']) or '-'} | "
                     f"{cell(rule_text(f['rule']))} | {'yes' if f['compare'] else ''} |")
    lines += ["", "## Value maps and key maps", ""]
    if m["value_maps"] or m["key_maps"]:
        lines += ["Templates: `docs/mapping/templates/` (columns `source,target,comment`). An empty map means "
                  "\"same value on S/4HANA\".", ""]
        lines += [f"- value map `{v}`" for v in m["value_maps"]]
        lines += [f"- key map `{k}`" + (" (from another migration)" if k in m.get("external_key_maps", []) else "")
                  for k in m["key_maps"]]
        if m.get("provides_key_maps"):
            lines += ["", "This object's load provides the key map(s) "
                      + ", ".join(f"`{k}`" for k in m["provides_key_maps"]) + " (old key, new key from the load log)."]
    else:
        lines.append("None.")
    lines += ["", "## Reconciliation", "",
              f"- Counts: `{rec['source_count_view']}` (ECC) vs `{rec['target_count_view'] or '-'}` (S/4HANA) per "
              + ", ".join(f"`{d['element']}`" + (f" (value map `{d['value_map']}`)" if d.get("value_map") else "")
                          for d in rec["dimensions"])]
    if rec.get("compare"):
        c = rec["compare"]
        lines.append(f"- Records and fields: `{c['source_view']}` vs `{c['target_view']}` on "
                     f"{', '.join(f'`{k}`' for k in c['key'])}" + (f" (key map `{c['key_map']}`)" if c.get("key_map") else "")
                     + f"; compared fields: {', '.join(f'`{x}`' for x in c['fields']) or '-'}")
    lines += ["", "```bash",
              f"python3 tools/mig_reconcile.py counts --module {m['module']} --source ecc_counts.csv --target s4_counts.csv --maps <folder>"]
    if rec.get("compare"):
        lines.append(f"python3 tools/mig_reconcile.py records --module {m['module']} --source ecc_extract.csv --target s4_compare.csv --maps <folder>")
    lines += ["```", "", "## Open gaps", ""]
    lines += [f"- {g}" for g in m["gaps"]] or ["None known."]
    return "\n".join(lines) + "\n"


def expected():
    lib = json.loads((ROOT / "library.json").read_text(encoding="utf-8"))
    if lib.get("kind") != "migration-source":
        return {}
    status = ("> Status: **draft-unverified** · tested release: "
              + lib.get("draft_tested_release", "none") + ". Nothing below has been run on a system.")
    mappings = {}
    for p in sorted((ROOT / "modules").glob("*/mapping.json")):
        m = json.loads(p.read_text(encoding="utf-8"))
        mappings[m["module"]] = m
    out = {DOCS / "mapping" / f"{n}.md": module_doc(m, status) for n, m in mappings.items()}
    levels = vm.sequence_order(mappings)
    seq = ["# Migration sequence", "", status, "",
           "Load order derived from `sequence_after` in the mapping files. Objects on the same level can be loaded "
           "in parallel; every level needs the key maps of the levels before it.", "",
           "| Level | Modules | Migration objects |", "|---|---|---|"]
    for i, level in enumerate(levels, 1):
        seq.append(f"| {i} | {', '.join(f'[`{n}`](mapping/{n}.md)' for n in level)} | "
                   f"{'; '.join(mappings[n]['target']['migration_object'] for n in level)} |")
    maps = sorted({("value_map", v) for m in mappings.values() for v in m["value_maps"]}
                  | {("key_map", k) for m in mappings.values() for k in m["key_maps"]})
    seq += ["", "## Maps to prepare before the load", "",
            "| Map | Kind | Used by |", "|---|---|---|"]
    for kind, name in maps:
        users = sorted(n for n, m in mappings.items() if name in m[kind + "s"])
        seq.append(f"| `{name}` | {kind.replace('_', ' ')} | {', '.join(users)} |")
        out[DOCS / "mapping" / "templates" / f"{kind}_{name}.csv"] = "source,target,comment\n"
    out[DOCS / "MIGRATION_SEQUENCE.md"] = "\n".join(seq) + "\n"
    return out


def main():
    check = "--check" in sys.argv
    exp = expected()
    folder = DOCS / "mapping"
    stale = [p for p in folder.rglob("*") if p.is_file() and p not in exp] if folder.exists() else []
    changed = [p for p, c in exp.items() if not p.exists() or p.read_text(encoding="utf-8") != c]
    if check:
        for p in changed + stale:
            print(f"out of date: {vdm_paths.rel(p)}")
        print(f"gen_mapping: {len(changed) + len(stale)} file(s) out of date, {len(exp)} expected")
        return 1 if changed or stale else 0
    for p in stale:
        p.unlink()
    for p in changed:
        p.parent.mkdir(parents=True, exist_ok=True)
        p.write_text(exp[p], encoding="utf-8")
    print(f"gen_mapping: {len(changed)} written, {len(stale)} removed, {len(exp)} total")
    return 0


if __name__ == "__main__":
    sys.exit(main())
