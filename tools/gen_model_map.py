#!/usr/bin/env python3
"""Generate docs/model_map.html: an interactive map of every entity in the library.

Reads the DDLS / DCLS sources and module.json files (same parsers as gen_docs.py) and writes a
self-contained HTML page (no external scripts) with
  1. a module map (hard dependencies, link views between modules) and
  2. an entity map: SAP released views -> basic -> composite -> consumption, one band per module,
     with data-source edges, associations on demand, and a detail panel per entity.
Usage: python3 tools/gen_model_map.py [--check]
"""
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))
sys.path.insert(0, str(ROOT / "tools"))
import build_package as bp  # noqa: E402
import gen_docs  # noqa: E402

OUT = ROOT / "docs" / "model_map.html"
TEMPLATE = Path(__file__).with_name("model_map_template.html")
MARKER = re.compile(r"TODO-VERIFY\[([HML])\]")


def kind_of(info, name):
    cat = info["category"]
    if info["kind"] == "hierarchy":
        return "hierarchy"
    if "analytical query" in cat:
        return "query"
    for key, label in (("#TEXT", "text"), ("#VALUE_HELP", "value help"), ("#CUBE", "cube"), ("#DIMENSION", "dimension")):
        if key in cat:
            return label
    return "view"


def collect():
    modules = bp.load_modules()
    links = bp.collect_link_views(modules)
    nodes, sap = {}, {}
    for p in sorted((ROOT / "src").glob("*.ddls.asddls")):
        text = p.read_text(encoding="utf-8")
        code = bp.strip_comments(text, "DDLS")
        m = re.search(r"define\s+(?:transient\s+)?(?:root\s+)?(?:view\s+entity|hierarchy|view)\s+([\w/]+)", code, re.I)
        name = m.group(1)
        info = gen_docs.parse_view(text)
        owner, layer, batch = gen_docs.owner_of(name, modules)
        is_link = layer == "link"
        if is_link:
            layer = {"I": "basic", "R": "composite", "C": "consumption"}[name.split("_")[1]]
        module = "link" if is_link else owner.strip("`")
        dcl_text, _ = gen_docs.dcl_info(name, modules)
        dcl_file = p.with_name(p.name.replace(".ddls.asddls", ".dcls.asdcls"))
        risks = MARKER.findall(text) + (MARKER.findall(dcl_file.read_text(encoding="utf-8")) if dcl_file.exists() else [])
        sources = [info["source"]] + info["joins"]
        nodes[name] = {
            "name": name, "label": info["label"], "module": module, "layer": layer, "kind": kind_of(info, name),
            "batch": batch, "link": is_link,
            "requires": links[name]["requires_modules"] if is_link else [],
            "purpose": gen_docs.header_field(text, "Purpose"),
            "example": gen_docs.header_field(text, "Example"),
            "keys": info["keys"], "params": [p_[0] for p_ in info["params"]],
            "sources": [s for s in sources if s and s != "-"],
            "assocs": [{"name": a, "target": t, "card": (c or "").strip()} for c, t, a in info["assocs"]],
            "dcl": re.sub(r"`", "", dcl_text),
            "risk": {r: risks.count(r) for r in "HML"},
            "file": f"src/{p.name}",
        }
    for n in list(nodes.values()):
        for ref in n["sources"] + [a["target"] for a in n["assocs"]]:
            if not ref.upper().startswith("ZEAM_") and ref not in nodes:
                sap.setdefault(ref, {"name": ref, "label": "SAP released view", "module": "sap", "layer": "sap",
                                     "kind": "SAP view", "batch": "-", "link": False, "requires": [], "purpose": "",
                                     "example": "", "keys": [], "params": [], "sources": [], "assocs": [],
                                     "dcl": "Shipped by SAP (C1-released view assumed; see ACTIVATION_CHECKLIST.md).",
                                     "risk": {"H": 0, "M": 0, "L": 0}, "file": "", "usedBy": []})
                sap[ref]["usedBy"].append(n["name"])
    mods = []
    for m in sorted(modules.values(), key=lambda x: (x.get("batch", 0), x["name"])):
        mods.append({"name": m["name"], "title": m["title"], "batch": m.get("batch"), "deps": m["hard_dependencies"],
                     "tags": m.get("tags", []), "status": m["status"]})
    link_list = [{"name": lk["name"], "requires": lk["requires_modules"]} for lk in links.values()]
    lib = bp.load_library()
    return {"nodes": list(nodes.values()) + sorted(sap.values(), key=lambda s: s["name"]),
            "modules": mods, "links": link_list,
            "meta": {"prefix": lib["prefix"], "package": lib["package"], "release": lib.get("target_release", "")}}


def render():
    data = json.dumps(collect(), separators=(",", ":")).replace("</", "<\\/")
    return TEMPLATE.read_text(encoding="utf-8").replace("/*__DATA__*/null", data)


def main():
    html = render()
    if "--check" in sys.argv:
        if not OUT.exists() or OUT.read_text(encoding="utf-8") != html:
            print("docs/model_map.html is out of date - run python3 tools/gen_model_map.py")
            sys.exit(1)
        return
    OUT.write_text(html, encoding="utf-8")
    print(f"wrote {OUT.relative_to(ROOT)} ({len(html) // 1024} KB)")


if __name__ == "__main__":
    main()
