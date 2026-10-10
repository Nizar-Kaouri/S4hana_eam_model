#!/usr/bin/env python3
"""Build one customer ZIP from modules of several products, including cross-product bridge links.

Selection
  python3 build_bundle.py eam:equipment eam:maintenance_order fi_aa:fixed_asset
  python3 build_bundle.py --product-all eam --product-all fi_aa
  python3 build_bundle.py --all
What it does
  1. resolves hard dependencies inside each product;
  2. adds intra-product link views when all their modules are selected (same rule as build_package.py);
  3. adds bridge link views (packages/bridge) when all their qualified modules are selected;
  4. checks that every referenced library object is shipped (across all product prefixes);
  5. rewrites every product prefix to ONE target prefix and every product package to ONE target package,
     refuses name collisions and names that exceed the SAP length limit;
  6. writes an abapGit ZIP with BUILD_MANIFEST.json and a cross-product ACTIVATION_ORDER.txt.
Status: draft-unverified content (never activated on an SAP system).
"""
import argparse
import json
import os
import re
import sys
import zipfile
from datetime import datetime, timezone
from pathlib import Path

REPO = Path(__file__).resolve().parent
sys.path.insert(0, str(REPO / "tools"))
os.environ.setdefault("VDM_PRODUCT", "eam")  # build_package needs a product at import; its helpers take explicit roots
import build_package as bp  # noqa: E402
import catalog  # noqa: E402

TYPE_ORDER = {"DDLS": 0, "DCLS": 1, "DDLX": 2, "CLAS": 3}


class BundleError(Exception):
    pass


def parse_selection(args, cat):
    sel = {}
    if args.all:
        for p in cat.values():
            if not p.is_bridge:
                sel[p.name] = set(p.modules)
    for pn in args.product_all or []:
        if pn not in cat or cat[pn].is_bridge:
            raise BundleError(f"unknown product '{pn}'")
        sel.setdefault(pn, set()).update(cat[pn].modules)
    for q in args.modules:
        if ":" not in q:
            raise BundleError(f"qualify modules as product:module ('{q}')")
        pn, mn = q.split(":", 1)
        if pn not in cat or cat[pn].is_bridge or mn not in cat[pn].modules:
            raise BundleError(f"unknown module '{q}'")
        sel.setdefault(pn, set()).add(mn)
    if not sel:
        raise BundleError("nothing selected (use product:module, --product-all <product> or --all)")
    return sel


def collect(cat, sel, with_tests):
    """Return objects [(type, name, product, owner)], resolved modules {product: [..]}, bridge links in/out."""
    objects, resolved = [], {}
    for pn, mods in sorted(sel.items()):
        p = cat[pn]
        try:
            res, objs, _, _ = bp.select_objects(sorted(mods), p.modules, with_tests)
        except bp.BuildError as exc:
            raise BundleError(f"{pn}: {exc}") from exc
        resolved[pn] = res
        objects += [(t, n, pn, o) for t, n, o in objs]
    chosen = {f"{pn}:{m}" for pn, ms in resolved.items() for m in ms}
    bridge = next((p for p in cat.values() if p.is_bridge), None)
    b_in, b_out = [], []
    for b in (bridge.bridges if bridge else []):
        if set(b["requires_modules"]) <= chosen:
            b_in.append(b["name"])
            objects.append(("DDLS", b["name"], bridge.name, "bridge"))
            if b.get("access_control"):
                objects.append(("DCLS", b["access_control"], bridge.name, "bridge"))
        else:
            b_out.append(b["name"])
    return objects, resolved, sorted(b_in), sorted(b_out)


def refs_of(obj, cat, rx):
    t, n, pn, _ = obj
    main = bp.object_files(t, n, cat[pn].root)[0]
    text = bp.strip_comments(main.read_text(encoding="utf-8"), t)
    return {m.group(0).upper() for m in rx.finditer(text)} - {n.upper()}


def check_closure(objects, cat, rx):
    shipped = {n.upper() for _, n, _, _ in objects}
    missing = [f"{t} {n} ({pn}/{o}) references {r}"
               for (t, n, pn, o) in objects for r in sorted(refs_of((t, n, pn, o), cat, rx)) if r not in shipped]
    if missing:
        raise BundleError("dependency closure violated:\n  " + "\n  ".join(missing))


def activation_order(objects, cat, rx):
    by_key = {(t, n.upper()): (t, n, pn, o) for t, n, pn, o in objects}
    ddls = {n.upper() for t, n, _, _ in objects if t == "DDLS"}
    dcls = {n.upper() for t, n, _, _ in objects if t == "DCLS"}
    deps = {}
    for obj in objects:
        t, n = obj[0], obj[1].upper()
        d = set()
        for r in refs_of(obj, cat, rx):
            if r in ddls:
                d.add(("DDLS", r))
            if t == "DCLS" and r in dcls:
                d.add(("DCLS", r))
        if t in ("DCLS", "DDLX") and n in ddls:
            d.add(("DDLS", n))
        d.discard((t, n))
        deps[(t, n)] = d
    order, state = [], {}

    def visit(k):
        if state.get(k):
            return
        state[k] = "visiting"
        for dk in sorted(deps[k], key=lambda x: (TYPE_ORDER[x[0]], x[1])):
            visit(dk)
        state[k] = "done"
        order.append(by_key[k])

    for k in sorted(deps, key=lambda x: (TYPE_ORDER[x[0]], x[1])):
        visit(k)
    return order


def make_rewriter(cat, target_prefix, target_package):
    pk = "|".join(sorted((re.escape(p.package) for p in cat.values()), key=len, reverse=True))
    pk_re = re.compile(r"(?<![A-Za-z0-9_/#])(?:" + pk + r")(?![A-Za-z0-9_])", re.IGNORECASE)
    pre = "|".join(sorted((re.escape(p.prefix) for p in cat.values()), key=len, reverse=True))
    pre_re = re.compile(r"(?<![A-Za-z0-9_/#])(?:" + pre + r")", re.IGNORECASE)
    ph = "\x00PKG\x00"

    def case(sample, value):
        return value.lower() if sample.islower() else value

    def rewrite(text):
        text = pk_re.sub(lambda m: ph + ("l" if m.group(0).islower() else "u"), text)
        text = pre_re.sub(lambda m: case(m.group(0), target_prefix), text)
        return text.replace(ph + "l", target_package.lower()).replace(ph + "u", target_package)

    return rewrite


def target_name(name, cat, pn, target_prefix):
    return target_prefix + name[len(cat[pn].prefix):]


def build(selection_args, prefix, package, out=None, with_tests=False):
    cat = catalog.load_all()
    prefix, package = prefix.upper(), package.upper()
    try:
        bp.validate_target(prefix, package)
    except bp.BuildError as exc:
        raise BundleError(str(exc)) from exc
    sel = parse_selection(selection_args, cat)
    rx = catalog.prefix_regex(cat)
    objects, resolved, b_in, b_out = collect(cat, sel, with_tests)
    check_closure(objects, cat, rx)
    # target names: collisions and length
    seen, problems = {}, []
    limits = cat["eam"].lib.get("max_object_name_length", {})
    for t, n, pn, _ in objects:
        tn = target_name(n, cat, pn, prefix)
        key = (t, tn.upper())
        if key in seen and seen[key] != (pn, n):
            problems.append(f"name collision: {t} {tn} from {seen[key][0]}:{seen[key][1]} and {pn}:{n}")
        seen[key] = (pn, n)
        if len(tn) > limits.get(t, 30):
            problems.append(f"{t} {tn} ({len(tn)} > {limits.get(t, 30)})")
    if problems:
        raise BundleError("target names invalid:\n  " + "\n  ".join(problems))
    order = activation_order(objects, cat, rx)
    rewrite = make_rewriter(cat, prefix, package)
    out = Path(out) if out else REPO / "dist" / "bundle" / f"{bp.file_base(package)}_bundle.zip"
    out.parent.mkdir(parents=True, exist_ok=True)
    manifest = {
        "target_prefix": prefix, "target_package": package,
        "products": {pn: {"source_prefix": cat[pn].prefix, "modules": resolved[pn],
                          "auto_included_dependencies": sorted(set(resolved[pn]) - sel[pn]),
                          "module_status": {m: cat[pn].modules[m]["status"] for m in resolved[pn]}}
                     for pn in sorted(resolved)},
        "bridge_links_included": b_in, "bridge_links_skipped": b_out, "with_tests": with_tests,
        "objects": [{"type": t, "name": target_name(n, cat, pn, prefix), "product": pn, "owner": o} for t, n, pn, o in order],
        "built_at": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "warning": "Draft content - never activated on an SAP system unless module_status says otherwise.",
    }
    with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as zf:
        zf.writestr(".abapgit.xml", (cat["eam"].root / ".abapgit.xml").read_text(encoding="utf-8"))
        devc = (cat["eam"].root / "src" / "package.devc.xml").read_text(encoding="utf-8")
        zf.writestr("src/package.devc.xml", re.sub(r"<CTEXT>.*?</CTEXT>", "<CTEXT>S/4HANA CDS VDM bundle</CTEXT>", devc))
        for t, n, pn, _ in objects:
            base = bp.file_base(target_name(n, cat, pn, prefix))
            for path in bp.object_files(t, n, cat[pn].root):
                suffix = path.name[len(bp.file_base(n)):]
                zf.writestr(f"src/{base}{suffix}", rewrite(path.read_text(encoding="utf-8")))
        zf.writestr("BUILD_MANIFEST.json", json.dumps(manifest, indent=2) + "\n")
        zf.writestr("ACTIVATION_ORDER.txt", "\n".join(
            f"{i:4d}  {o['type']}  {o['name']}  ({o['product']}/{o['owner']})" for i, o in enumerate(manifest["objects"], 1)) + "\n")
    return out, manifest


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("modules", nargs="*", help="qualified modules product:module")
    ap.add_argument("--product-all", action="append", help="select every module of a product (repeatable)")
    ap.add_argument("--all", action="store_true", help="select every module of every product")
    ap.add_argument("--prefix", required=True, help="one target prefix for all products, e.g. ZACME_ or /ACME/")
    ap.add_argument("--package", required=True, help="one target package, e.g. ZACME_VDM")
    ap.add_argument("--out", help="output zip (default: dist/bundle/<package>_bundle.zip)")
    ap.add_argument("--with-tests", action="store_true", help="include ABAP Unit test classes")
    args = ap.parse_args(argv)
    try:
        out, m = build(args, args.prefix, args.package, args.out, args.with_tests)
    except BundleError as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 1
    print(f"wrote {out}")
    for pn, info in m["products"].items():
        extra = f" (auto-included: {', '.join(info['auto_included_dependencies'])})" if info["auto_included_dependencies"] else ""
        print(f"  {pn:<7} {', '.join(info['modules'])}{extra}")
    print(f"  bridges : {', '.join(m['bridge_links_included']) or '-'}")
    print(f"  objects : {len(m['objects'])}  prefix {m['target_prefix']}  package {m['target_package']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
