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

sys.path.insert(0, str(Path(__file__).resolve().parent))
import vdm_paths  # noqa: E402  (consumes --product)

ROOT = vdm_paths.PRODUCT_ROOT
sys.path.insert(0, str(vdm_paths.REPO))
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
    lib = bp.load_library()
    links = bp.collect_link_views(modules)
    prefix = bp.load_library()["prefix"]
    bridges = {b["name"]: b["requires_modules"] for b in bp.load_bridge_links()}
    other = {}
    for prod in vdm_paths.products():
        lib_o = json.loads((vdm_paths.PACKAGES / prod / "library.json").read_text())
        if lib_o["prefix"] != prefix:
            other[lib_o["prefix"].upper()] = prod
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
            "requires": (links[name]["requires_modules"] if name in links else bridges.get(name, [])) if is_link else [],
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
            if not ref.upper().startswith(prefix.upper()) and ref not in nodes:
                ext = next((pr for pf, pr in other.items() if ref.upper().startswith(pf)), None)
                native = lib.get("native_table_sources", False)
                table = (native and ref.upper() in {t.upper() for mod in modules.values() for t in mod.get("sap_tables", [])}) or (lib.get("system") == "ecc" and ref.islower())
                sap.setdefault(ref, {"name": ref, "label": f"View of product {ext}" if ext else (
                                         ("Native SAP table (DDIC verification pending)" if native else "ECC table (read directly)") if table else "SAP released view"),
                                     "module": "sap", "layer": "sap",
                                     "kind": "product view" if ext else (("SAP table" if native else "ECC table") if table else "SAP view"),
                                     "batch": "-", "link": False, "requires": [], "purpose": "", "example": "", "keys": [],
                                     "params": [], "sources": [], "assocs": [],
                                     "dcl": (f"Shipped with product {ext} (packages/{ext})." if ext else
                                             ("Native SAP table; restrict and verify the extraction channel." if native else "SAP ECC table; no CDS access control on the source system.") if table else
                                             "Shipped by SAP (C1-released view assumed; see ACTIVATION_CHECKLIST.md)."),
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
            "meta": {"prefix": lib["prefix"], "package": lib["package"], "release": lib.get("target_release", ""),
                     "title": lib.get("map_title", f"{lib['prefix'].rstrip('_')} Model Map"),
                     "area": lib.get("map_area", lib.get("product_title", "")),
                     "initial": lib.get("map_initial", ""),
                     "ext_title": lib.get("map_external_title", "SAP released views"),
                     "ext_sub": lib.get("map_external_sub", "")}}


def render():
    model = collect()
    meta = model["meta"]
    data = json.dumps(model, separators=(",", ":")).replace("</", "<\\/")
    example = next((n["name"] for n in model["nodes"] if n["kind"] == "cube"), model["nodes"][0]["name"])
    html = TEMPLATE.read_text(encoding="utf-8")
    html = html.replace("__RELEASE__", bp.load_library().get("map_release", "SAP S/4HANA 2025"))
    for key, value in (("__TITLE__", meta["title"]), ("__AREA__", meta["area"]), ("__PREFIX__", meta["prefix"]),
                       ("__EXAMPLE__", example)):
        html = html.replace(key, value)
    return html.replace("/*__DATA__*/null", data)


def main():
    if not bp.load_modules() and not bp.load_bridge_links():
        # empty product: no map (the page needs at least one entity)
        if "--check" in sys.argv:
            if OUT.exists():
                print("docs/model_map.html exists but the product has no modules - delete it")
                sys.exit(1)
            return
        if OUT.exists():
            OUT.unlink()
        print("no modules - no model map")
        return
    html = render()
    if "--check" in sys.argv:
        if not OUT.exists() or OUT.read_text(encoding="utf-8") != html:
            print("docs/model_map.html is out of date - run python3 tools/gen_model_map.py")
            sys.exit(1)
        return
    OUT.write_text(html, encoding="utf-8")
    print(f"wrote {vdm_paths.rel(OUT)} ({len(html) // 1024} KB)")


if __name__ == "__main__":
    main()
