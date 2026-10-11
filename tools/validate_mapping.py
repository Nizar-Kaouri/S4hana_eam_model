#!/usr/bin/env python3
"""Checks of the migration mapping files (modules/<module>/mapping.json) of a migration-source product.

The consumption views (<P>C_*Mig) are the template the customer's load program reads (values unchanged from ECC);
mapping.json documents them.

  X1  every module with consumption views has a mapping.json whose 'module' equals the folder name
  X2  every structure names a consumption view of the module and its source view; the consumption view selects from
      the source view and has exactly the documented elements and keys; every element of the source view is either
      delivered or listed in not_migrated with its reason; rule kinds are known and carry their argument
  X4  sequence_after names existing modules and the load sequence has no cycle
  X5  source control: the count view counts the main consumption view by its listed dimensions
  X6  key.numbering is keep | new | derived; the consumption view applies the documented scope filter
Usage: python3 tools/validate_mapping.py --product <migration-source product>   (exit code 1 on any error)
"""
import json
import re
import sys
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import vdm_paths  # noqa: E402  (consumes --product)

ROOT = vdm_paths.PRODUCT_ROOT
RULES = {"copy": False, "convert": True, "derive": True, "constant": True, "skip": True, "info": False, "scope": False}
CONVERSIONS = {"float_si_to_unit"}
NUMBERING = {"keep", "new", "derived"}


def load_modules(root):
    out = {}
    for p in sorted((root / "modules").glob("*/module.json")):
        m = json.loads(p.read_text(encoding="utf-8"))
        out[m["name"]] = m
    return out


def source_text(root, view):
    path = root / "src" / f"{view.lower()}.ddls.asddls"
    return re.sub(r"//[^\n]*", " ", path.read_text(encoding="utf-8")) if path.exists() else ""


def elements(root, view):
    """(keys, all element names) of a view."""
    text = source_text(root, view)
    if "{" not in text:
        return set(), set()
    # Later UNION branches repeat the projection; their FROM aliases are not elements.
    text = re.split(r"\bunion\s+(?:all\s+)?select\b", text, maxsplit=1, flags=re.IGNORECASE)[0]
    body = text[text.index("{") + 1:text.rindex("}")]
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


def norm(s):
    return re.sub(r"\s+", " ", s or "").strip()


def main():
    errors = []
    err = errors.append
    lib = json.loads((ROOT / "library.json").read_text(encoding="utf-8"))
    modules = load_modules(ROOT)
    mappings = {}
    for name, mod in modules.items():
        consumption = mod["objects"].get("consumption", [])
        f = ROOT / "modules" / name / "mapping.json"
        if not consumption:
            continue
        if not f.exists():
            err(f"X1 module {name}: missing mapping.json")
            continue
        m = json.loads(f.read_text(encoding="utf-8"))
        if m.get("module") != name:
            err(f"X1 module {name}: mapping.json says module '{m.get('module')}'")
        mappings[name] = m
        own = set(mod["objects"].get("basic", []) + mod["objects"].get("composite", []))
        allowed_sources = set(own)
        for dep in mod.get("hard_dependencies", []):
            if dep in modules:
                allowed_sources |= set(modules[dep]["objects"].get("basic", []) + modules[dep]["objects"].get("composite", []))
        documented = set()
        for st in m.get("structures", []):
            cv, sv = st.get("consumption_view"), st.get("source_view")
            documented.add(cv)
            if cv not in consumption:
                err(f"X2 {name}: {cv} is not a consumption view of the module")
                continue
            if sv not in allowed_sources:
                err(f"X2 {name}: source view {sv} of {cv} is not a basic / composite view of the module or its dependencies")
            text = source_text(ROOT, cv)
            if not re.search(r"\bselect\s+from\s+" + re.escape(sv) + r"\s+as\s+src\b", text, re.IGNORECASE):
                err(f"X2 {name}: {cv} does not select from {sv} as src")
            ckeys, cnames = elements(ROOT, cv)
            doc = {fl["element"] for fl in st.get("fields", [])}
            extra = cnames - doc
            if extra:
                err(f"X2 {name}: {cv} delivers undocumented elements {sorted(extra)}")
            for e in sorted(doc - cnames):
                err(f"X2 {name}: documented element {e} not delivered by {cv}")
            if set(st.get("keys", [])) != ckeys:
                err(f"X2 {name}: keys {st.get('keys')} != keys of {cv} {sorted(ckeys)}")
            for fl in st.get("fields", []):
                el = fl["element"]
                kind, _, arg = fl.get("rule", "").partition(":")
                if kind not in RULES:
                    err(f"X2 {name}: {cv}.{el} unknown rule '{fl.get('rule')}'")
                    continue
                if RULES[kind] and not arg:
                    err(f"X2 {name}: {cv}.{el} rule '{kind}' needs an argument")
                if kind == "convert" and arg not in CONVERSIONS:
                    err(f"X2 {name}: {cv}.{el} unknown conversion '{arg}'")
            # X6 scope filter applied
            scope = norm(st.get("scope_filter"))
            where = re.search(r"\}\s*where\s+(.*?)\s*(group\s+by|$)", text, re.DOTALL | re.IGNORECASE)
            if scope and (not where or norm(where.group(1)) != scope):
                err(f"X6 {name}: {cv} does not apply the scope filter '{scope}'")
            # completeness of the source view
            _, snames = elements(ROOT, sv)
            nm = {x["element"] for x in m.get("not_migrated", []) if x["view"] == sv}
            for e in sorted(snames - doc - nm):
                err(f"X2 {name}: element {sv}.{e} is neither delivered by {cv} nor listed in not_migrated")
        for cv in consumption:
            if cv not in documented and not cv.endswith("MigCount"):
                err(f"X2 {name}: consumption view {cv} has no structure in mapping.json")
        if m.get("key", {}).get("numbering") not in NUMBERING:
            err(f"X6 {name}: key.numbering must be one of {sorted(NUMBERING)}")
        # X5
        rec = m.get("source_control", {})
        scv = rec.get("source_count_view")
        dims = [d["element"] for d in rec.get("dimensions", [])]
        if scv not in consumption:
            err(f"X5 {name}: source_count_view {scv} is not a consumption view of the module")
        else:
            keys, names = elements(ROOT, scv)
            if set(dims) != keys or "RecordCount" not in names:
                err(f"X5 {name}: {scv} keys {sorted(keys)} / RecordCount do not match the dimensions {dims}")
            if not re.search(r"select\s+from\s+" + re.escape(m.get("main_structure", "")) + r"\b", source_text(ROOT, scv)):
                err(f"X5 {name}: {scv} does not count the main structure {m.get('main_structure')}")
    # X4
    for name, m in mappings.items():
        for dep in m.get("sequence_after", []):
            if dep not in mappings:
                err(f"X4 {name}: sequence_after names unknown module {dep}")
    try:
        levels = sequence_order(mappings)
    except ValueError as exc:
        err(f"X4 load sequence: {exc}")
        levels = []
    for e in errors:
        print("ERROR " + e)
    fields = sum(len(st["fields"]) for m in mappings.values() for st in m.get("structures", []))
    structs = sum(len(m.get("structures", [])) for m in mappings.values())
    print(f"validate_mapping: {len(errors)} error(s), {len(mappings)} mapping(s), {structs} structure(s), "
          f"{fields} delivered field(s), {len(levels)} load level(s)")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
