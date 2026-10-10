#!/usr/bin/env python3
"""Generate the migration mapping documentation of a migration-source product from modules/*/mapping.json.

Writes
  docs/mapping/<module>.md                 interface description of the consumption views the load program reads:
                                           structures, keys, scope, field mapping, maps, reconciliation, open gaps
  docs/MIGRATION_SEQUENCE.md               load order (levels) derived from sequence_after + the maps to prepare
  docs/mapping/templates/ZEMX_MAP_<NAME>.csv  upload templates for the mapping table (MAP_NAME,SOURCE_VALUE,
                                           TARGET_VALUE,MAP_COMMENT - one file per map)
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
RULE_TEXT = {"copy": "copy", "value_map": "value map", "key_map": "key map", "convert": "convert (load program)",
             "derive": "derived", "constant": "constant", "skip": "not migrated", "info": "information only",
             "scope": "scope flag"}


def cell(text):
    return str(text).replace("|", "\\|").replace("\n", " ")


def rule_text(rule):
    kind, _, arg = rule.partition(":")
    if kind in ("value_map", "key_map"):
        return f"{RULE_TEXT[kind]}: " + ", ".join(f"`{a.upper()}`" for a in arg.split("|"))
    return RULE_TEXT.get(kind, kind) + (f": {arg}" if arg else "")


def module_doc(m, lib, status):
    prefix = lib["prefix"]
    rec = m["reconciliation"]
    lines = [f"# Migration interface: {m['module']}", "", status, "",
             f"- **Read by:** {m['target']['tool']}",
             f"- **Load after:** {', '.join(f'`{d}`' for d in m['sequence_after']) or '- (first level)'}",
             f"- **Business key:** {', '.join(f'`{k}`' for k in m['key']['business_key'])} · numbering **{m['key']['numbering']}**",
             f"- **Key rule:** {m['key']['note']}", ""]
    for t in m["target"].get("todo_verify", []):
        lines += [f"> {t}", ""]
    lines += ["Values are delivered **translated**: every field marked *value map* / *key map* is looked up in the "
              f"mapping table `{prefix}MAP` (map name in capitals); without an entry the old value is delivered. "
              "`Legacy*` key fields carry the old key of the record.", ""]
    for st in m["structures"]:
        lines += [f"## `{st['consumption_view']}`", "",
                  f"- Source: `{st['source_view']}`",
                  f"- Keys: {', '.join(f'`{k}`' for k in st['keys'])}",
                  f"- Scope: `{st['scope_filter'] or 'all rows'}`", "",
                  "| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |", "|---|---|---|---|---|"]
        for f in st["fields"]:
            lines.append(f"| `{f['element']}` | {cell(f['source'])} | {cell(f['target']) or '-'} | {cell(rule_text(f['rule']))} | "
                         f"{'yes' if f['compare'] else ''} |")
        lines.append("")
    if m.get("not_migrated"):
        lines += ["## Not delivered", "", "| View | Element | Source | Reason |", "|---|---|---|---|"]
        lines += [f"| `{x['view']}` | `{x['element']}` | {cell(x['source'])} | {cell(rule_text(x['reason']))} |"
                  for x in m["not_migrated"]]
        lines.append("")
    lines += ["## Maps", ""]
    if m["value_maps"] or m["key_maps"]:
        lines += [f"- value map `{v.upper()}`" for v in m["value_maps"]]
        lines += [f"- key map `{k.upper()}`" + (" (from another migration)" if k in m.get("external_key_maps", []) else "")
                  for k in m["key_maps"]]
        if m.get("provides_key_maps"):
            lines += ["", "After loading this object, the key map(s) " + ", ".join(f"`{k.upper()}`" for k in m["provides_key_maps"])
                      + f" (old key, new key from the load log) must be written into `{prefix}MAP` on the ECC system "
                      "(by the load program via RFC or by uploading the load log) before the objects that use them are extracted."]
    else:
        lines.append("None.")
    lines += ["", "## Reconciliation", "",
              f"- Counts: `{rec['source_count_view']}` (ECC, translated values) vs `{rec['target_count_view'] or '-'}` "
              "(S/4HANA) per " + ", ".join(f"`{d['element']}`" for d in rec["dimensions"])]
    if rec.get("compare"):
        c = rec["compare"]
        lines.append(f"- Records and fields: `{c['source_view']}` vs `{c['target_view']}` on "
                     f"{', '.join(f'`{k}`' for k in c['key'])}; compared: {', '.join(f'`{x}`' for x in c['fields']) or '-'}")
    lines += ["", "```bash",
              f"python3 tools/mig_reconcile.py counts --module {m['module']} --source ecc_counts.csv --target s4_counts.csv"]
    if rec.get("compare"):
        lines.append(f"python3 tools/mig_reconcile.py records --module {m['module']} --source ecc_extract.csv --target s4_compare.csv")
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
    out = {DOCS / "mapping" / f"{n}.md": module_doc(m, lib, status) for n, m in mappings.items()}
    levels = vm.sequence_order(mappings)
    seq = ["# Migration sequence", "", status, "",
           "Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel. The "
           f"consumption views translate values with the mapping table `{lib['prefix']}MAP` on the ECC system: value maps "
           "are filled before the load; key maps of objects that get new numbers are written back after each level "
           "(load program via RFC or upload of the load log), before the next level is extracted.", "",
           "| Level | Modules | Consumption views read by the load program |", "|---|---|---|"]
    for i, level in enumerate(levels, 1):
        views = [st["consumption_view"] for n in level for st in mappings[n]["structures"]]
        seq.append(f"| {i} | {', '.join(f'[`{n}`](mapping/{n}.md)' for n in level)} | {', '.join(f'`{v}`' for v in views)} |")
    maps = sorted({("value map", v) for m in mappings.values() for v in m["value_maps"]}
                  | {("key map", k) for m in mappings.values() for k in m["key_maps"]}, key=lambda x: (x[0], x[1]))
    seq += ["", f"## Maps in `{lib['prefix']}MAP`", "",
            "| MAP_NAME | Kind | Filled by | Used by |", "|---|---|---|---|"]
    providers = {k: n for n, m in mappings.items() for k in m.get("provides_key_maps", [])}
    external = {k for m in mappings.values() for k in m.get("external_key_maps", [])}
    for kind, name in maps:
        users = sorted(n for n, m in mappings.items() if name in m[kind.replace(" ", "_") + "s"])
        by = ("customer (before the load)" if kind == "value map" else
              f"load program of `{providers[name]}`" if name in providers else
              "other migration" if name in external else "customer")
        seq.append(f"| `{name.upper()}` | {kind} | {by} | {', '.join(users)} |")
        out[DOCS / "mapping" / "templates" / f"{lib['prefix']}MAP_{name.upper()}.csv"] = \
            "MAP_NAME,SOURCE_VALUE,TARGET_VALUE,MAP_COMMENT\n"
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
