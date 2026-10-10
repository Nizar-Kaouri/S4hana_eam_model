#!/usr/bin/env python3
"""Checks of the migration mapping files (modules/<module>/mapping.json) of a migration-source product.

  X1  every module has a mapping.json whose 'module' equals the folder name
  X2  every field names a basic view of the module and an element of that view; every element of the module's
      basic views is mapped (complete field list); the rule kind is known and carries its argument
  X3  value_maps / key_maps list exactly the maps the field rules use
  X4  sequence_after names existing modules and the load sequence has no cycle; every key map a module uses is
      provided (provides_key_maps) by the module itself or by a module on an earlier load level, or is declared
      in external_key_maps (provided by another migration, e.g. fixed assets by the FI-AA migration)
  X5  reconciliation: the source count view is a composite view of the module with the listed dimensions and
      RecordCount; the target count view and the compare view exist in the paired S/4HANA product
      (library.json 'migration_pair') with the same dimensions / elements
  X6  key.numbering is keep | new | derived; scope.filter is set
Usage: python3 tools/validate_mapping.py --product <migration-source product>   (exit code 1 on any error)
"""
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import vdm_paths  # noqa: E402  (consumes --product)

ROOT = vdm_paths.PRODUCT_ROOT
RULES = {"copy": False, "value_map": True, "key_map": True, "convert": True, "derive": True, "constant": True,
         "skip": True, "info": False, "scope": False}
CONVERSIONS = {"material_number", "float_si_to_unit", "partner_to_business_partner"}
NUMBERING = {"keep", "new", "derived"}


def load_modules(root):
    return {json.loads(p.read_text(encoding="utf-8"))["name"]: json.loads(p.read_text(encoding="utf-8"))
            for p in sorted((root / "modules").glob("*/module.json"))}


def elements(root, view):
    """Element names of a view (aliases, or the bare name in a plain projection list)."""
    path = root / "src" / f"{view.lower()}.ddls.asddls"
    if not path.exists():
        return None, set()
    text = re.sub(r"//[^\n]*", " ", path.read_text(encoding="utf-8"))
    body = text[text.index("{") + 1:text.rindex("}")] if "{" in text else ""
    names = set(re.findall(r"\bas\s+(\w+)\s*(?:,|$)", body, re.MULTILINE))
    keys = set(re.findall(r"^\s*key\s+.*?\bas\s+(\w+)", body, re.MULTILINE))
    return keys, names


def sequence_order(mappings):
    """Topological load order (list of levels); raises ValueError on a cycle."""
    deps = {m: set(d["sequence_after"]) & set(mappings) for m, d in mappings.items()}
    levels, done = [], set()
    while len(done) < len(deps):
        level = sorted(m for m, d in deps.items() if m not in done and d <= done)
        if not level:
            raise ValueError("cycle among " + ", ".join(sorted(set(deps) - done)))
        levels.append(level)
        done |= set(level)
    return levels


def main():
    errors = []
    err = errors.append
    lib = json.loads((ROOT / "library.json").read_text(encoding="utf-8"))
    modules = load_modules(ROOT)
    pair_name = lib.get("migration_pair")
    pair_root = vdm_paths.PACKAGES / pair_name if pair_name else None
    pair_modules = load_modules(pair_root) if pair_root and pair_root.exists() else {}
    mappings = {}
    for name, mod in modules.items():
        f = ROOT / "modules" / name / "mapping.json"
        if not f.exists():
            err(f"X1 module {name}: missing mapping.json")
            continue
        m = json.loads(f.read_text(encoding="utf-8"))
        if m.get("module") != name:
            err(f"X1 module {name}: mapping.json says module '{m.get('module')}'")
        mappings[name] = m
        basic = mod["objects"].get("basic", [])
        composite = mod["objects"].get("composite", [])
        # X2
        mapped = {}
        used = {"value_map": set(), "key_map": set()}
        for fld in m.get("fields", []):
            v, el = fld.get("view"), fld.get("element")
            if v not in basic:
                err(f"X2 {name}: field {el} names view {v}, which is not a basic view of the module")
                continue
            _, names = elements(ROOT, v)
            if el not in names:
                err(f"X2 {name}: element {el} not found in {v}")
            mapped.setdefault(v, set()).add(el)
            kind, _, arg = fld.get("rule", "").partition(":")
            if kind not in RULES:
                err(f"X2 {name}: {v}.{el} has unknown rule '{fld.get('rule')}'")
            elif RULES[kind] and not arg:
                err(f"X2 {name}: {v}.{el} rule '{kind}' needs an argument")
            if kind == "convert" and arg not in CONVERSIONS:
                err(f"X2 {name}: {v}.{el} unknown conversion '{arg}' (known: {', '.join(sorted(CONVERSIONS))})")
            if kind in used:
                used[kind].update(arg.split("|"))
            if kind in ("copy", "value_map", "key_map", "convert") and not fld.get("target"):
                err(f"X2 {name}: {v}.{el} is migrated ({kind}) but has no target field")
        for v in basic:
            _, names = elements(ROOT, v)
            for el in sorted(names - mapped.get(v, set())):
                err(f"X2 {name}: element {v}.{el} is not in the mapping")
        # X3
        for kind, key in (("value_map", "value_maps"), ("key_map", "key_maps")):
            if set(m.get(key, [])) != used[kind]:
                err(f"X3 {name}: {key} {sorted(m.get(key, []))} != maps used by the fields {sorted(used[kind])}")
        # X6
        if m.get("key", {}).get("numbering") not in NUMBERING:
            err(f"X6 {name}: key.numbering must be one of {sorted(NUMBERING)}")
        if not m.get("scope", {}).get("filter"):
            err(f"X6 {name}: scope.filter is empty")
        # X5
        rec = m.get("reconciliation", {})
        scv = rec.get("source_count_view")
        dims = [d["element"] for d in rec.get("dimensions", [])]
        if scv not in composite:
            err(f"X5 {name}: source_count_view {scv} is not a composite view of the module")
        else:
            keys, names = elements(ROOT, scv)
            if set(dims) != keys or "RecordCount" not in names:
                err(f"X5 {name}: {scv} keys {sorted(keys)} / RecordCount do not match the dimensions {dims}")
        tcv = rec.get("target_count_view")
        if tcv:
            pm = pair_modules.get(name)
            if not pm or tcv not in pm["objects"].get("composite", []):
                err(f"X5 {name}: target_count_view {tcv} is not a composite view of {pair_name}:{name}")
            else:
                keys, names = elements(pair_root, tcv)
                if set(dims) != keys or "RecordCount" not in names:
                    err(f"X5 {name}: {tcv} keys {sorted(keys)} do not match the dimensions {dims}")
        cmp_ = rec.get("compare")
        if cmp_:
            if cmp_["source_view"] not in basic:
                err(f"X5 {name}: compare.source_view {cmp_['source_view']} is not a basic view of the module")
            pm = pair_modules.get(name)
            if not pm or cmp_["target_view"] not in pm["objects"].get("basic", []):
                err(f"X5 {name}: compare.target_view {cmp_['target_view']} is not a basic view of {pair_name}:{name}")
            else:
                _, src_names = elements(ROOT, cmp_["source_view"])
                tkeys, tnames = elements(pair_root, cmp_["target_view"])
                for el in cmp_["key"] + cmp_["fields"]:
                    if el not in src_names:
                        err(f"X5 {name}: compare element {el} not in {cmp_['source_view']}")
                    if el not in tnames:
                        err(f"X5 {name}: compare element {el} not in {cmp_['target_view']}")
                if set(cmp_["key"]) != tkeys:
                    err(f"X5 {name}: compare key {cmp_['key']} != keys of {cmp_['target_view']} {sorted(tkeys)}")
            if cmp_.get("key_map") and cmp_["key_map"] not in used["key_map"]:
                err(f"X5 {name}: compare.key_map {cmp_['key_map']} is not used by any field")
    # X4
    for name, m in mappings.items():
        for dep in m.get("sequence_after", []):
            if dep not in modules:
                err(f"X4 {name}: sequence_after names unknown module {dep}")
    try:
        levels = sequence_order(mappings)
    except ValueError as exc:
        err(f"X4 load sequence: {exc}")
        levels = []
    level_of = {n: i for i, lv in enumerate(levels) for n in lv}
    provider = {}
    for name, m in mappings.items():
        for k in m.get("provides_key_maps", []):
            if k in provider:
                err(f"X4 key map {k} provided by {provider[k]} and {name}")
            provider[k] = name
    for name, m in mappings.items():
        for k in m.get("key_maps", []):
            if k in m.get("external_key_maps", []):
                continue
            p = provider.get(k)
            if p is None:
                err(f"X4 {name}: key map {k} is provided by no module (add it to external_key_maps if another migration provides it)")
            elif p != name and level_of and level_of.get(p, 0) >= level_of.get(name, 0):
                err(f"X4 {name}: uses key map {k} of {p}, which does not load earlier")
    for e in errors:
        print("ERROR " + e)
    fields = sum(len(m.get("fields", [])) for m in mappings.values())
    print(f"validate_mapping: {len(errors)} error(s), {len(mappings)} mapping(s), {fields} field(s), "
          f"{len(levels)} load level(s)")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
