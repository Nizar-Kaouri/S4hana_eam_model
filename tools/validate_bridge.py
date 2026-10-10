#!/usr/bin/env python3
"""Structural checks for the bridge product (packages/bridge): cross-product link views.

  B1  bridges.json entries: requires_modules are qualified (product:module), exist, span >= 2 products;
      each entry has access_control or no_dcl_reason
  B2  every listed view has a source file (and DCL when declared); every source in src/ is listed
  B3  layer prefix and @VDM.viewType match; header has draft-unverified status, 'LINK VIEW',
      '// Purpose:' and '// Example:'; mandatory annotations present
  B4  references only to bridge objects or to module objects of the required modules (incl. their hard
      dependencies) - never to link views of other products
  B5  DCL: role name = file name, grants select on itself, inherited entity known (any product or SAP view)
  B6  names within the length budget (library.json max length minus reserve_prefix_chars)
  B7  TODO-VERIFY markers well-formed with unique ids
Usage: python3 tools/validate_bridge.py      (exit code 1 on any error)
"""
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import catalog  # noqa: E402

LAYERS = {"I_": "#BASIC", "R_": "#COMPOSITE", "C_": "#CONSUMPTION"}
MARKER_RE = re.compile(r"TODO-VERIFY\[(?P<risk>[HML])\]\s+(?P<id>[A-Z]+-[A-Z0-9]+):")


def strip_comments(text):
    text = re.sub(r"/\*.*?\*/", " ", text, flags=re.DOTALL)
    return re.sub(r"//[^\n]*", " ", text)


def main():
    cat = catalog.load_all()
    bridge = next((p for p in cat.values() if p.is_bridge), None)
    if not bridge:
        print("validate_bridge: no bridge product")
        return 0
    errors = []
    err = errors.append
    idx = catalog.owner_index(cat)
    rx = catalog.prefix_regex(cat)
    src = bridge.root / "src"
    pre = bridge.prefix
    listed = {}

    # B1
    for b in bridge.bridges:
        req = b.get("requires_modules", [])
        prods = set()
        for q in req:
            if ":" not in q:
                err(f"B1 {b['name']}: requirement '{q}' is not qualified as product:module")
                continue
            pn, mn = q.split(":", 1)
            if pn not in cat or cat[pn].is_bridge or mn not in cat[pn].modules:
                err(f"B1 {b['name']}: unknown module {q}")
            prods.add(pn)
        if len(prods) < 2:
            err(f"B1 {b['name']}: a bridge link must require modules of at least two products")
        if not b.get("access_control") and not b.get("no_dcl_reason"):
            err(f"B1 {b['name']}: needs access_control or no_dcl_reason")
        listed[b["name"].upper()] = b

    # B2
    for name, b in listed.items():
        if not (src / f"{name.lower()}.ddls.asddls").exists():
            err(f"B2 {b['name']}: missing src/{name.lower()}.ddls.asddls")
        if b.get("access_control") and not (src / f"{b['access_control'].lower()}.dcls.asdcls").exists():
            err(f"B2 {b['name']}: missing DCL src/{b['access_control'].lower()}.dcls.asdcls")
    for f in list(src.glob("*.ddls.asddls")) + list(src.glob("*.dcls.asdcls")):
        if f.name.split(".")[0].upper() not in listed:
            err(f"B2 src/{f.name} is not listed in bridges.json")

    limit = bridge.lib.get("max_object_name_length", {}).get("DDLS", 30) - bridge.lib.get("reserve_prefix_chars", 0)
    for name, b in listed.items():
        f = src / f"{name.lower()}.ddls.asddls"
        if not f.exists():
            continue
        text = f.read_text(encoding="utf-8")
        # B3
        layer = name[len(pre):len(pre) + 2]
        if not name.startswith(pre.upper()) or layer not in LAYERS:
            err(f"B3 {b['name']}: name must start with {pre}I_, {pre}R_ or {pre}C_")
        elif f"@VDM.viewType: {LAYERS[layer]}" not in text:
            err(f"B3 {b['name']}: expected @VDM.viewType: {LAYERS[layer]}")
        if layer == "C_" and not name.endswith("Q"):
            err(f"B3 {b['name']}: consumption views must end with 'Q'")
        if "draft-unverified" not in text.splitlines()[0]:
            err(f"B3 {b['name']}: first line must carry the draft-unverified status comment")
        for tag in ("LINK VIEW", "// Purpose: ", "// Example: ", "@AccessControl.authorizationCheck", "@Analytics",
                    "@ObjectModel", "@EndUserText.label"):
            if tag not in text:
                err(f"B3 {b['name']}: missing '{tag.strip()}'")
        # B4
        allowed = set()
        for q in b["requires_modules"]:
            pn, mn = q.split(":", 1)
            if pn in cat and mn in cat[pn].modules:
                allowed |= {(pn, m) for m in catalog.resolve_deps(cat[pn], [mn])}
        for ref in {m.group(0).upper() for m in rx.finditer(strip_comments(text))} - {name}:
            own = idx.get(ref)
            if own is None:
                err(f"B4 {b['name']}: references unknown object {ref}")
            elif own[1] == "bridge":
                continue
            elif own[1] == "link":
                err(f"B4 {b['name']}: references link view {ref} of product {own[0]} (only module objects allowed)")
            elif (own[0], own[2]) not in allowed:
                err(f"B4 {b['name']}: references {ref} of {own[0]}:{own[2]}, which is not among its required modules")
        # B6
        if len(name) > limit:
            err(f"B6 {b['name']}: {len(name)} characters > {limit}")

    # B5
    for f in src.glob("*.dcls.asdcls"):
        name = f.name.split(".")[0].upper()
        text = strip_comments(f.read_text(encoding="utf-8"))
        m = re.search(r"define\s+role\s+([\w/]+)\s*\{(.*)\}\s*$", text, re.DOTALL | re.IGNORECASE)
        if not m or m.group(1).upper() != name:
            err(f"B5 DCLS {name}: 'define role {name}' not found")
            continue
        g = re.search(r"grant\s+select\s+on\s+([\w/]+)", m.group(2), re.IGNORECASE)
        if not g or g.group(1).upper() != name:
            err(f"B5 DCLS {name}: must 'grant select on {name}'")
        for inh in re.findall(r"inheriting\s+conditions\s+from\s+entity\s+([\w/]+)", m.group(2), re.IGNORECASE):
            if rx.fullmatch(inh) and inh.upper() not in idx:
                err(f"B5 DCLS {name}: inherits from unknown entity {inh}")

    # B7
    seen = {}
    for f in sorted(src.glob("*")):
        for i, line in enumerate(f.read_text(encoding="utf-8", errors="ignore").splitlines(), 1):
            if "TODO-VERIFY[" in line:
                m = MARKER_RE.search(line)
                if not m:
                    err(f"B7 src/{f.name}:{i}: malformed TODO-VERIFY marker")
                elif m.group("id") in seen:
                    err(f"B7 duplicate TODO-VERIFY id {m.group('id')}")
                else:
                    seen[m.group("id")] = f"src/{f.name}:{i}"

    for e in errors:
        print("ERROR " + e)
    print(f"validate_bridge: {len(errors)} error(s), {len(listed)} bridge link(s), {len(seen)} TODO-VERIFY item(s)")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
