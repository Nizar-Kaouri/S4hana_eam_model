#!/usr/bin/env python3
"""Generate the migration mapping documentation of a migration-source product from modules/*/mapping.json.

Writes
  docs/mapping/<module>.md    description of the consumption views (the template the load program reads):
                              structures, keys, scope, fields with ECC source and S/4HANA target, source controls, gaps
  docs/MIGRATION_SEQUENCE.md  load order (levels) derived from sequence_after
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
RULE_TEXT = {"copy": "copy", "convert": "convert (load program)",
             "derive": "derived", "constant": "constant", "skip": "not migrated", "info": "information only",
             "scope": "scope flag"}


def cell(text):
    return str(text).replace("|", "\\|").replace("\n", " ")


def rule_text(rule):
    kind, _, arg = rule.partition(":")
    return RULE_TEXT.get(kind, kind) + (f": {arg}" if arg else "")


def module_doc(m, lib, status):
    rec = m["source_control"]
    lines = [f"# Migration interface: {m['module']}", "", status, "",
             f"- **Read by:** {m['target']['tool']}",
             f"- **Load after:** {', '.join(f'`{d}`' for d in m['sequence_after']) or '- (first level)'}",
             f"- **Business key:** {', '.join(f'`{k}`' for k in m['key']['business_key'])} · numbering **{m['key']['numbering']}**",
             f"- **Key rule:** {m['key']['note']}", ""]
    for t in m["target"].get("compatibility_notes", m["target"].get("todo_verify", [])):
        lines += [f"> {t}", ""]
    lines += ["The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, "
              "new numbers, ...) is up to the load program.", ""]
    for st in m["structures"]:
        lines += [f"## `{st['consumption_view']}`", "",
                  f"- Source: `{st['source_view']}`",
                  f"- Keys: {', '.join(f'`{k}`' for k in st['keys'])}",
                  f"- Scope: `{st['scope_filter'] or 'all rows'}`",
                  *([f"- Delivery mode: **{st['delivery_mode']}**", f"- Before posting: {st.get('preprocessing', '')}"] if st.get('delivery_mode') else []), "",
                  "| Element | Source (ECC) | Target (S/4HANA) | Rule |", "|---|---|---|---|"]
        for f in st["fields"]:
            lines.append(f"| `{f['element']}` | {cell(f['source'])} | {cell(f['target']) or '-'} | {cell(rule_text(f['rule']))} |")
        lines.append("")
    if m.get("not_migrated"):
        lines += ["## Not delivered", "", "| View | Element | Source | Reason |", "|---|---|---|---|"]
        lines += [f"| `{x['view']}` | `{x['element']}` | {cell(x['source'])} | {cell(rule_text(x['reason']))} |"
                  for x in m["not_migrated"]]
        lines.append("")
    lines += ["## Source controls", "", f"- Source count view: `{rec.get('source_count_view', '-')}`", "", "## Open gaps", ""]
    lines += [f"- {g}" for g in m["gaps"]] or ["None known."]
    result = "\n".join(lines) + "\n"
    return result.replace("ECC", "SAP source") if lib.get("native_table_sources") else result


def expected():
    lib = json.loads((ROOT / "library.json").read_text(encoding="utf-8"))
    if lib.get("kind") != "migration-source":
        return {}
    status = ("> Status: **draft-unverified** · tested release: "
              + lib.get("draft_tested_release", "none") + ". Nothing below has been run on a system.")
    if lib.get("phase") == "released":
        status = "> Version **" + lib["version"] + "**"
    mappings = {}
    for p in sorted((ROOT / "modules").glob("*/mapping.json")):
        m = json.loads(p.read_text(encoding="utf-8"))
        mappings[m["module"]] = m
    out = {DOCS / "mapping" / f"{n}.md": module_doc(m, lib, status) for n, m in mappings.items()}
    levels = vm.sequence_order(mappings)
    seq = ["# Migration sequence", "", status, "",
           "Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel; objects that "
           "refer to other objects load after them.", "",
           "| Level | Modules | Consumption views read by the load program |", "|---|---|---|"]
    for i, level in enumerate(levels, 1):
        views = [st["consumption_view"] for n in level for st in mappings[n]["structures"]]
        seq.append(f"| {i} | {', '.join(f'[`{n}`](mapping/{n}.md)' for n in level)} | {', '.join(f'`{v}`' for v in views)} |")
    if lib.get("native_table_sources"):
        seq[4] = "This groups the supplied native extraction drafts only. Pending dependencies remain listed in module metadata and mappings; this is not a complete business load plan. No load program is supplied."
        seq[6] = "| Level | Modules | Supplied native consumption views |"
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
