#!/usr/bin/env python3
"""Generate docs/views/<View>.md for every DDLS from its source, DCL and module.json.

Inputs per view:
  - header comments  "// Purpose: ..." and "// Example: ..."  (required, checked by validate_repo M5)
  - define statement, data source, parameters, keys, associations (parsed from the DDL)
  - access control: inherited entity / unrestricted / no DCL by design (from the DCLS + module.json)
  - TODO-VERIFY ids found in the DDLS and its DCLS

Usage: python3 tools/gen_docs.py [--check]
"""
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import vdm_paths  # noqa: E402  (consumes --product)

ROOT = vdm_paths.PRODUCT_ROOT
sys.path.insert(0, str(vdm_paths.REPO))
import build_package as bp  # noqa: E402

DOCS = ROOT / "docs" / "views"
STATUS = ("> Status: **draft-unverified** · tested release: none (draft, 2025 assumed). "
          "Nothing below has been activated on a system.")
MARKER_RE = re.compile(r"TODO-VERIFY\[[HML]\]\s+([A-Z]+-[A-Z0-9]+):")
REF_RE = re.compile(r"\b([A-Z]{2,4}-[A-Z]?[0-9]{2,3})\b")


def header_field(text, field):
    out, active = [], False
    for line in text.splitlines():
        s = line.strip()
        if not s.startswith("//"):
            if s.startswith("@") or s.startswith("define"):
                break
            continue
        body = s[2:].strip()
        if body.startswith(field + ":"):
            out.append(body[len(field) + 1:].strip())
            active = True
        elif active and body and not re.match(r"^[A-Z][\w-]*(\[[HML]\])?[ :]", body):
            out.append(body)
        else:
            active = False
    return " ".join(out).strip()


def parse_view(text):
    code = bp.strip_comments(text, "DDLS")
    info = {}
    m = re.search(r"define\s+(transient\s+)?(root\s+)?(view\s+entity|hierarchy|view)\s+([\w/]+)", code, re.I)
    info["kind"] = ("transient view entity" if m.group(1) else m.group(3).lower()) if m else "?"
    info["label"] = (re.search(r"@EndUserText\.label\s*:\s*'([^']*)'", text) or [None, ""])[1]
    vdm = re.search(r"@VDM\.viewType\s*:\s*#(\w+)", text)
    info["vdm"] = vdm.group(1) if vdm else "-"
    cats = re.findall(r"@(?:Analytics|ObjectModel)\.dataCategory\s*:\s*#(\w+)", text)
    info["category"] = ", ".join(f"#{c}" for c in cats) or ("analytical query" if "analytical_query" in code else "-")
    src = re.search(r"\bas\s+(?:select\s+from|projection\s+on)\s+([\w/]+)", code, re.I)
    if not src:
        src = re.search(r"\bsource\s+([\w/]+)", code, re.I)
    info["source"] = src.group(1) if src else "-"
    info["joins"] = re.findall(r"\bjoin\s+([\w/]+)", code, re.I)
    info["params"] = re.findall(r"(P_\w+)\s*:\s*([\w.()]+)", code.split("as projection on")[0].split("as select")[0])
    info["keys"] = re.findall(r"^\s*key\s+(?:[\w]+\.)?(\w+)", code, re.M)
    info["assocs"] = re.findall(r"association\s+(?:of\s+[\w\s]+\s+)?(\[[^\]]*\]|to\s+(?:one|many)\b)?\s*(?:to\s+)?([\w/]+)\s+as\s+(\w+)", code, re.I)
    return info


def dcl_info(name, modules):
    p = ROOT / "src" / (bp.file_base(name) + ".dcls.asdcls")
    if not p.exists():
        for m in modules.values():
            reason = m.get("no_dcl_by_design", {}).get(name)
            if reason:
                return "No DCL by design: " + reason, ""
            for link in m.get("link_views", []):
                if link["name"] == name and link.get("no_dcl_reason"):
                    return "No DCL by design: " + link["no_dcl_reason"], ""
        return "**missing**", ""
    text = p.read_text(encoding="utf-8")
    inh = re.findall(r"inheriting\s+conditions\s+from\s+entity\s+([\w/]+)", bp.strip_comments(text, "DCLS"), re.I)
    if inh:
        return "Role inherits the conditions of " + " and ".join(f"`{e}`" for e in inh) + ".", text
    return "Role grants unrestricted read access (explicit `grant select on ...;`).", text


def owner_of(name, modules):
    for m in modules.values():
        objs = m.get("objects", {})
        for layer in ("basic", "composite", "consumption"):
            if name in objs.get(layer, []):
                return f"`{m['name']}`", layer, m.get("batch", "?")
    for m in modules.values():
        for link in m.get("link_views", []):
            if link["name"] == name:
                return "link: " + " + ".join(f"`{r}`" for r in link["requires_modules"]), "link", m.get("batch", "?")
    return "?", "?", "?"


def render(name, text, modules):
    info = parse_view(text)
    owner, layer, batch = owner_of(name, modules)
    dcl, dcl_text = dcl_info(name, modules)
    todo = sorted(set(MARKER_RE.findall(text) + MARKER_RE.findall(dcl_text)) |
                  {r for r in REF_RE.findall(text) if not r.startswith("TST")})
    lines = [f"# {name}", "", STATUS, "", "| | |", "|---|---|",
             f"| Description | {info['label']} |",
             f"| Module | {owner} |", f"| Batch | {batch} |",
             f"| Layer | {layer} (`@VDM.viewType: #{info['vdm']}`) |",
             f"| Kind | {info['kind']} |",
             f"| Data category | {info['category']} |",
             f"| Data source | `{info['source']}`" + "".join(f", join `{j}`" for j in info["joins"]) + " |",
             f"| Source file | `src/{bp.file_base(name)}.ddls.asddls` |", "",
             "## Purpose", "", header_field(text, "Purpose") or "_missing_", ""]
    if info["params"]:
        lines += ["## Parameters", ""] + [f"- `{p}` : `{t}`" for p, t in info["params"]] + [""]
    lines += ["## Keys", ""] + ([f"- `{k}`" for k in info["keys"]] or ["- none (transient / aggregated)"]) + [""]
    lines += ["## Associations defined here", ""]
    lines += [f"- `{a}` → `{t}` {c or ''}".rstrip() for c, t, a in info["assocs"]] or ["- none"]
    lines += ["", "## Access control", "", dcl, "",
              "## Example use case", "", header_field(text, "Example") or "_missing_", "",
              "## Open verification items", "",
              (", ".join(f"`{t}`" for t in todo) + " - see `BATCH_REPORT.md`.") if todo else "none", ""]
    return "\n".join(lines)


def expected():
    modules = bp.load_modules()
    out = {}
    rows = []
    for p in sorted((ROOT / "src").glob("*.ddls.asddls")):
        text = p.read_text(encoding="utf-8")
        m = re.search(r"define\s+(?:transient\s+)?(?:root\s+)?(?:view\s+entity|hierarchy|view)\s+([\w/]+)",
                      bp.strip_comments(text, "DDLS"), re.I)
        name = m.group(1) if m else p.name.split(".")[0].upper()
        out[DOCS / f"{name}.md"] = render(name, text, modules)
        owner, layer, batch = owner_of(name, modules)
        rows.append((str(batch), owner, layer, name))
    rows.sort(key=lambda r: (r[0], r[1], ["basic", "composite", "consumption", "link", "?"].index(r[2]), r[3]))
    index = ["# View documentation", "", STATUS, "",
             "_Generated by `tools/gen_docs.py` from the view sources. Do not edit by hand._", "",
             "| Batch | View | Module | Layer |", "|---|---|---|---|"]
    index += [f"| {b} | [{n}]({n}.md) | {o} | {l} |" for b, o, l, n in rows]
    out[DOCS / "README.md"] = "\n".join(index) + "\n"
    return out


def main():
    check = "--check" in sys.argv
    exp = expected()
    stale = [p for p, c in exp.items() if not p.exists() or p.read_text(encoding="utf-8") != c]
    orphans = [p for p in DOCS.glob("*.md") if p not in exp]
    if check:
        for p in stale + orphans:
            print("STALE " + vdm_paths.rel(str(p)))
        sys.exit(1 if stale or orphans else 0)
    DOCS.mkdir(parents=True, exist_ok=True)
    for p in stale:
        p.write_text(exp[p], encoding="utf-8")
    for p in orphans:
        p.unlink()
    print(f"gen_docs: {len(stale)} written, {len(orphans)} removed, {len(exp)} total")


if __name__ == "__main__":
    main()
