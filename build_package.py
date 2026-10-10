#!/usr/bin/env python3
"""Build a customer-specific abapGit ZIP from the ZEAM EAM/PM VDM library.

What it does
  1. Reads library.json (current prefix / package) and every modules/*/module.json.
  2. Resolves the selected modules plus all transitive hard dependencies.
  3. Adds link views only when *all* modules a link view requires are selected.
  4. Verifies that every ZEAM_ object referenced by a shipped source is shipped too
     (fails loudly if a module.json under-declares a dependency).
  5. Rewrites the package name and the object prefix (e.g. ZEAM_ -> ZACME_ or /ACME/),
     renames the files accordingly and checks object name lengths.
  6. Writes an abapGit-compatible ZIP (.abapgit.xml + /src) with a BUILD_MANIFEST.json
     and an ACTIVATION_ORDER.txt computed from the object references.

Examples
  python3 build_package.py --product eam --list
  python3 build_package.py --product eam equipment
  python3 build_package.py --product eam equipment functional_location --prefix ZACME_ --package ZACME_EAM
  python3 build_package.py --product eam --all --prefix /ACME/ --package /ACME/EAM_VDM --with-tests
  python3 build_package.py --product eam --all --activation-order

Status: the generated content is draft-unverified (never activated on an SAP system).
"""
import argparse
import io
import json
import re
import sys
import zipfile
from datetime import datetime, timezone
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent / "tools"))
import vdm_paths  # noqa: E402  (consumes --product)

ROOT = vdm_paths.PRODUCT_ROOT

# object type -> (source dir, list of file suffixes belonging to the object)
OBJECT_FILES = {
    "TABL": ("src", [".tabl.xml"]),
    "DDLS": ("src", [".ddls.asddls", ".ddls.xml"]),
    "DCLS": ("src", [".dcls.asdcls", ".dcls.xml"]),
    "DDLX": ("src", [".ddlx.asddlx", ".ddlx.xml"]),
    "CLAS": ("tests/abap", [".clas.abap", ".clas.xml", ".clas.testclasses.abap", ".clas.locals_imp.abap"]),
}
LAYER_KEYS = ("basic", "composite", "consumption")
TYPE_ORDER = {"TABL": 0, "DDLS": 1, "DCLS": 2, "DDLX": 3, "CLAS": 4}


class BuildError(Exception):
    pass


# --------------------------------------------------------------------------- loading

def load_library(root=ROOT):
    return json.loads((root / "library.json").read_text(encoding="utf-8"))


def load_modules(root=ROOT):
    modules = {}
    for path in sorted((root / "modules").glob("*/module.json")):
        data = json.loads(path.read_text(encoding="utf-8"))
        if data["name"] != path.parent.name:
            raise BuildError(f"{path}: name '{data['name']}' does not match folder '{path.parent.name}'")
        modules[data["name"]] = data
    return modules


def load_bridge_links(root=ROOT):
    """Cross-product link views of a bridge product (packages/bridge/bridges.json); [] for normal products."""
    f = root / "bridges.json"
    return json.loads(f.read_text(encoding="utf-8"))["bridge_links"] if f.exists() else []


def is_bridge(root=ROOT):
    return load_library(root).get("kind") == "bridge"


def collect_link_views(modules):
    """Union of link views declared by all modules; declarations must agree."""
    links = {}
    for mod in modules.values():
        for link in mod.get("link_views", []):
            req = sorted(link["requires_modules"])
            if mod["name"] not in req:
                raise BuildError(f"module {mod['name']} declares link view {link['name']} it is not part of")
            entry = {"name": link["name"], "requires_modules": req,
                     "access_control": link.get("access_control"), "no_dcl_reason": link.get("no_dcl_reason")}
            known = links.get(link["name"])
            if known and known != entry:
                raise BuildError(f"link view {link['name']} declared inconsistently across modules")
            links[link["name"]] = entry
    for link in links.values():
        for req in link["requires_modules"]:
            if req not in modules:
                raise BuildError(f"link view {link['name']} requires unknown module '{req}'")
    return links


# --------------------------------------------------------------------------- resolution

def resolve_modules(selected, modules):
    """Return selected modules plus transitive hard dependencies (dependency order)."""
    ordered, state = [], {}

    def visit(name, chain):
        if name not in modules:
            raise BuildError(f"unknown module '{name}'" + (f" (required by {chain[-1]})" if chain else ""))
        if state.get(name) == "done":
            return
        if state.get(name) == "visiting":
            raise BuildError("dependency cycle: " + " -> ".join(chain + [name]))
        state[name] = "visiting"
        for dep in modules[name].get("hard_dependencies", []):
            visit(dep, chain + [name])
        state[name] = "done"
        ordered.append(name)

    for name in selected:
        visit(name, [])
    return ordered


def module_objects(mod, with_tests):
    objs = mod.get("objects", {})
    out = [("TABL", n, mod["name"]) for n in objs.get("tables", [])]
    for layer in LAYER_KEYS:
        out += [("DDLS", n, mod["name"]) for n in objs.get(layer, [])]
    out += [("DCLS", n, mod["name"]) for n in objs.get("access_controls", [])]
    out += [("DDLX", n, mod["name"]) for n in objs.get("metadata_extensions", [])]
    if with_tests:
        out += [("CLAS", n, mod["name"]) for n in objs.get("tests", [])]
    return out


def select_objects(selected, modules, with_tests=False):
    resolved = resolve_modules(selected, modules)
    objects = []
    for name in resolved:
        objects += module_objects(modules[name], with_tests)
    links_included, links_skipped = [], []
    for link in collect_link_views(modules).values():
        if set(link["requires_modules"]) <= set(resolved):
            links_included.append(link["name"])
            objects.append(("DDLS", link["name"], "link"))
            if link.get("access_control"):
                objects.append(("DCLS", link["access_control"], "link"))
        else:
            links_skipped.append(link["name"])
    seen, unique = set(), []
    for obj in objects:
        key = (obj[0], obj[1].upper())
        if key not in seen:
            seen.add(key)
            unique.append(obj)
    return resolved, unique, sorted(links_included), sorted(links_skipped)


# --------------------------------------------------------------------------- files & references

def file_base(name):
    return name.lower().replace("/", "#")


def object_files(obj_type, name, root=ROOT):
    folder, suffixes = OBJECT_FILES[obj_type]
    files = []
    for suffix in suffixes:
        path = root / folder / (file_base(name) + suffix)
        if path.exists():
            files.append(path)
    if not files or not files[0].name.endswith(suffixes[0]):
        raise BuildError(f"{obj_type} {name}: main file {folder}/{file_base(name)}{suffixes[0]} not found")
    return files


def strip_comments(text, obj_type):
    text = re.sub(r"/\*.*?\*/", " ", text, flags=re.DOTALL)
    if obj_type == "CLAS":
        return "\n".join(line.split('"', 1)[0] if not line.lstrip().startswith("*") else ""
                         for line in text.splitlines())
    text = re.sub(r"//[^\n]*", " ", text)
    if obj_type == "DDLS":  # the SQL view name of a classic view is a name of the view itself, not a reference
        text = re.sub(r"@AbapCatalog\.sqlViewName\s*:\s*'[^']*'", " ", text, flags=re.IGNORECASE)
    return text


def prefix_pattern(prefix):
    return re.compile(r"(?<![A-Za-z0-9_/#])" + re.escape(prefix) + r"[A-Za-z0-9_]+", re.IGNORECASE)


def references(obj_type, name, prefix, root=ROOT):
    """Prefix-objects referenced by an object's main source (comments ignored)."""
    main = object_files(obj_type, name, root)[0]
    text = strip_comments(main.read_text(encoding="utf-8"), obj_type)
    refs = {m.group(0).upper() for m in prefix_pattern(prefix).finditer(text)}
    refs.discard(name.upper())
    return refs


def check_closure(objects, prefix, root=ROOT):
    shipped = {n.upper() for _, n, _ in objects}
    missing = []
    for obj_type, name, owner in objects:
        for ref in sorted(references(obj_type, name, prefix, root)):
            if ref not in shipped:
                missing.append(f"{obj_type} {name} ({owner}) references {ref}, which is not part of the selection")
    if missing:
        raise BuildError("dependency closure violated - fix hard_dependencies / link_views:\n  " + "\n  ".join(missing))


def activation_order(objects, prefix, root=ROOT):
    """Topological order: an object comes after every shipped object it references.

    A DCLS additionally comes after the DDLS it protects (same name); DDLX after its view."""
    by_key = {(t, n.upper()): (t, n, o) for t, n, o in objects}
    ddls_names = {n.upper() for t, n, _ in objects if t == "DDLS"}
    dcls_names = {n.upper() for t, n, _ in objects if t == "DCLS"}
    tabl_names = {n.upper() for t, n, _ in objects if t == "TABL"}
    deps = {}
    for t, n, _ in objects:
        d = set()
        for ref in references(t, n, prefix, root):
            if ref in tabl_names:
                d.add(("TABL", ref))
            if ref in ddls_names:
                d.add(("DDLS", ref))
            if t == "DCLS" and ref in dcls_names:
                d.add(("DCLS", ref))  # inherited role must exist first
        if t in ("DCLS", "DDLX") and n.upper() in ddls_names:
            d.add(("DDLS", n.upper()))
        d.discard((t, n.upper()))
        deps[(t, n.upper())] = d
    ordered, state = [], {}

    def visit(key):
        if state.get(key) == "done":
            return
        if state.get(key) == "visiting":
            return  # self/back reference (e.g. text <-> dimension) - activated together
        state[key] = "visiting"
        for dep in sorted(deps[key], key=lambda k: (TYPE_ORDER[k[0]], k[1])):
            visit(dep)
        state[key] = "done"
        ordered.append(by_key[key])

    for key in sorted(deps, key=lambda k: (TYPE_ORDER[k[0]], k[1])):
        visit(key)
    return ordered


# --------------------------------------------------------------------------- rewriting

def validate_target(prefix, package):
    if not (re.fullmatch(r"[ZY][A-Z0-9]*_", prefix) or re.fullmatch(r"/[A-Z0-9_]{3,8}/", prefix)):
        raise BuildError(f"invalid prefix '{prefix}': use a customer prefix like 'ZACME_' "
                         "(Z/Y, uppercase, ending with '_') or a registered namespace like '/ACME/'")
    if not re.fullmatch(r"(/[A-Z0-9_]+/)?[A-Z0-9_]+", package) or len(package) > 30:
        raise BuildError(f"invalid package '{package}' (uppercase, max 30 characters)")
    if not (package.startswith(("Z", "Y", "$")) or package.startswith("/")):
        raise BuildError(f"package '{package}' must be in the customer namespace (Z*, Y*, $*) or a registered namespace")


def make_rewriter(old_prefix, new_prefix, old_package, new_package):
    pkg_re = re.compile(r"(?<![A-Za-z0-9_/#])" + re.escape(old_package) + r"(?![A-Za-z0-9_])", re.IGNORECASE)
    pre_re = re.compile(r"(?<![A-Za-z0-9_/#])" + re.escape(old_prefix), re.IGNORECASE)
    placeholder = "\x00PKG\x00"

    def case_like(sample, value):
        return value.lower() if sample.islower() else value.upper() if sample.isupper() else value

    def rewrite(text):
        text = pkg_re.sub(lambda m: placeholder + ("l" if m.group(0).islower() else "u"), text)
        text = pre_re.sub(lambda m: case_like(m.group(0), new_prefix), text)
        text = text.replace(placeholder + "l", new_package.lower()).replace(placeholder + "u", new_package)
        return text

    return rewrite


def target_name(name, old_prefix, new_prefix):
    if not name.upper().startswith(old_prefix.upper()):
        raise BuildError(f"object {name} does not start with library prefix {old_prefix}")
    return new_prefix + name[len(old_prefix):]


def sql_view_name(name, root=ROOT):
    """SQL view name of a classic DDLS (None for view entities)."""
    main = object_files("DDLS", name, root)[0]
    m = re.search(r"@AbapCatalog\.sqlViewName\s*:\s*'([^']*)'", main.read_text(encoding="utf-8"))
    return m.group(1) if m else None


def check_lengths(objects, old_prefix, new_prefix, limits, root=ROOT):
    too_long = []
    for t, n, _ in objects:
        new = target_name(n, old_prefix, new_prefix)
        if len(new) > limits.get(t, 30):
            too_long.append(f"{t} {new} ({len(new)} > {limits.get(t, 30)})")
        sv = sql_view_name(n, root) if t == "DDLS" else None
        if sv:
            new_sv = target_name(sv, old_prefix, new_prefix)
            if len(new_sv) > limits.get("SQLVIEW", 16):
                too_long.append(f"SQL view name {new_sv} of {new} ({len(new_sv)} > {limits.get('SQLVIEW', 16)})")
    if too_long:
        raise BuildError("object names exceed the SAP length limit with this prefix:\n  " + "\n  ".join(too_long))


# --------------------------------------------------------------------------- build

def build(selected, prefix=None, package=None, out=None, with_tests=False, root=ROOT):
    library = load_library(root)
    old_prefix, old_package = library["prefix"], library["package"]
    new_prefix = (prefix or old_prefix).upper()
    new_package = (package or old_package).upper()
    validate_target(new_prefix, new_package)

    modules = load_modules(root)
    resolved, objects, links_in, links_out = select_objects(selected, modules, with_tests)
    if not objects:
        raise BuildError("nothing selected")
    check_closure(objects, old_prefix, root)
    check_lengths(objects, old_prefix, new_prefix, library.get("max_object_name_length", {}), root)
    order = activation_order(objects, old_prefix, root)
    rewrite = make_rewriter(old_prefix, new_prefix, old_package, new_package)

    out = Path(out) if out else vdm_paths.REPO / "dist" / root.name / f"{file_base(new_package)}_{'_'.join(resolved)[:80]}.zip"
    out.parent.mkdir(parents=True, exist_ok=True)

    manifest = {
        "library_prefix": old_prefix,
        "target_prefix": new_prefix,
        "target_package": new_package,
        "selected_modules": list(selected),
        "resolved_modules": resolved,
        "auto_included_dependencies": [m for m in resolved if m not in selected],
        "link_views_included": links_in,
        "link_views_skipped": links_out,
        "with_tests": with_tests,
        "module_status": {m: modules[m]["status"] for m in resolved},
        "module_versions": {m: modules[m].get("version") for m in resolved},
        "tested_release": {m: modules[m]["tested_release"] for m in resolved},
        "objects": [{"type": t, "name": target_name(n, old_prefix, new_prefix), "module": o} for t, n, o in order],
        "built_at": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "warning": "Draft content - never activated on an SAP system unless module_status says otherwise.",
    }
    with zipfile.ZipFile(out, "w", zipfile.ZIP_DEFLATED) as zf:
        if (root / "docs" / "CUSTOMER_TEST.md").exists():
            zf.writestr("README.md", "# ModuPorter EAM customer package\n\n"
                + f"Product: {root.name}. Package: {new_package}. Prefix: {new_prefix}.\n\n"
                + "Start with docs/CUSTOMER_TEST.md and docs/SUPPORTED_SCOPE.md. Import the src/ library through abapGit on the appropriate system. "
                + "Optional SAP reports live in helpers/ and are created separately in SE38. "
                + "Python tools require Python 3.10+ and no extra dependencies; run commands from this extracted directory.\n\n"
                + "Read OPEN_CHECKS.md, DDIC_REQUIREMENTS.csv (source), BUILD_MANIFEST.json and ACTIVATION_ORDER.txt before activation. "
                + "For historical cutover use docs/CUSTOMER_WORKFLOW.md in the source package; current CDS previews do not recover past states. "
                + "This candidate is system-unverified pending the customer's activation/extraction trial.\n")
        zf.writestr(".abapgit.xml", (root / ".abapgit.xml").read_text(encoding="utf-8"))
        devc = (root / "src" / "package.devc.xml").read_text(encoding="utf-8")
        zf.writestr("src/package.devc.xml", rewrite(devc))
        for t, n, _ in objects:
            new_base = file_base(target_name(n, old_prefix, new_prefix))
            for path in object_files(t, n, root):
                suffix = path.name[len(file_base(n)):]
                zf.writestr(f"src/{new_base}{suffix}", rewrite(path.read_text(encoding="utf-8")))
        for mod in resolved:  # migration products: field mapping and generated mapping docs travel with the views
            for extra in [root / "modules" / mod / "mapping.json", root / "docs" / "mapping" / f"{mod}.md"]:
                if extra.exists():
                    zf.writestr(f"mapping/{extra.parent.name if extra.name == 'mapping.json' else 'docs'}/{extra.name}",
                                rewrite(extra.read_text(encoding="utf-8")))
        seq = root / "docs" / "MIGRATION_SEQUENCE.md"
        if seq.exists():
            text = seq.read_text(encoding="utf-8")
            lines = []
            for line in text.splitlines():
                if line.startswith("| ") and re.match(r"\| \d+ \|", line):
                    names = re.findall(r"\[`([^`]+)`\]", line)
                    included = [m for m in names if m in resolved]
                    if not included:
                        continue
                    # Rebuild mixed levels so no unselected module or consumption view is advertised.
                    cells = line.split("|")
                    links = ", ".join(f"[`{m}`](docs/{m}.md)" for m in included)
                    views = []
                    for m in included:
                        mp = root / "modules" / m / "mapping.json"
                        if mp.exists():
                            views.extend(x["consumption_view"] for x in json.loads(mp.read_text(encoding="utf-8"))["structures"])
                    line = f"| {cells[1].strip()} | {links} | " + ", ".join(f"`{v}`" for v in views) + " |"
                lines.append(line)
            zf.writestr("mapping/MIGRATION_SEQUENCE.md", rewrite("\n".join(lines) + "\n"))
        for doc in ("INSTALLATION.md", "COMPATIBILITY.md", "CHANGELOG.md", "PROVENANCE.md", "CUSTOMER_TEST.md", "KNOWN_LIMITATIONS.md", "CUSTOMER_WORKFLOW.md", "SUPPORTED_SCOPE.md", "LICENSE.md"):
            extra = root / "docs" / doc
            if extra.exists():
                zf.writestr("docs/" + doc, rewrite(extra.read_text(encoding="utf-8")))
        if library.get("kind") == "migration-source" and (root / "customer").exists():
            for helper in sorted((root / "helpers").glob("*")):
                if helper.is_file():
                    zf.writestr("helpers/" + rewrite(helper.name), rewrite(helper.read_text(encoding="utf-8")))
            shipped_views = {n for _, n, _ in objects}
            for asset in sorted((root / "customer").rglob("*")):
                if not asset.is_file():
                    continue
                text = asset.read_text(encoding="utf-8")
                if asset.name == "structure-cohorts.json":
                    content = json.loads(text)
                    text = json.dumps({n: v for n, v in content.items() if n in shipped_views}, indent=2) + "\n"
                elif asset.name == "customer-cohort-project.json":
                    content = json.loads(text)
                    content["steps"] = [s for s in content["steps"] if s["input"] in shipped_views]
                    needed = {s[k] for s in content["steps"] for k in ("input", "parent")}
                    roots = [n for n in content["outputs"] if n in shipped_views]
                    needed.update(roots)
                    content["inputs"] = {n: p for n, p in content["inputs"].items() if n in needed}
                    content["outputs"] = roots + [s["name"] for s in content["steps"]]
                    text = json.dumps(content, indent=2) + "\n"
                relative = asset.relative_to(root)
                zf.writestr(relative.as_posix(), rewrite(text))
            for tool in ("mig_reconcile.py", "eam_prepare.py", "eam_run.py"):
                zf.writestr("tools/" + tool, (vdm_paths.REPO / "tools" / tool).read_text(encoding="utf-8"))
            # The existing main-object CLI resolves mappings by product/module.
            for mod in resolved:
                mp = root / "modules" / mod / "mapping.json"
                if mp.exists():
                    zf.writestr(f"packages/{root.name}/modules/{mod}/mapping.json", rewrite(mp.read_text(encoding="utf-8")))
        if library.get("kind") == "migration-source":
            import csv
            import io
            buf = io.StringIO(newline="")
            writer = csv.writer(buf)
            writer.writerow(["module", "view", "element", "key", "ecc_source", "provisional_target", "rule", "scope", "delivery_mode", "status"])
            for mod in resolved:
                mp = root / "modules" / mod / "mapping.json"
                if not mp.exists():
                    continue
                mapping = json.loads(mp.read_text(encoding="utf-8"))
                for structure in mapping.get("structures", []):
                    for field in structure["fields"]:
                        writer.writerow([mod, rewrite(structure["consumption_view"]), field["element"],
                            field["element"] in structure["keys"], field["source"], field["target"],
                            field["rule"], rewrite(structure.get("scope_filter", "")), structure.get("delivery_mode", "scoped_extract"), modules[mod]["status"]])
            zf.writestr("FIELD_CATALOG.csv", buf.getvalue())
        # System preflight accompanies the actual selected objects, rather than the whole repository.
        checks = ["# Open system verification checks", "", "These checks remain unverified until SAP activation and extraction evidence exists.", ""]
        ddic = set()
        for typ, name, mod in objects:
            if typ != "DDLS":
                continue
            path = root / "src" / (file_base(name) + ".ddls.asddls")
            text = path.read_text(encoding="utf-8")
            for number, line in enumerate(text.splitlines(), 1):
                if "TODO-VERIFY" in line:
                    checks.append(f"- {rewrite(name)}:{number}: {rewrite(line.strip().lstrip('/').strip())}")
            clean = strip_comments(text, "DDLS")
            match = re.search(r"as select from (\w+)(?: as (\w+))?", clean, re.IGNORECASE)
            if match and not match.group(1).upper().startswith(old_prefix.upper()):
                table = match.group(1).upper()
                alias = match.group(2) or match.group(1)
                if table in modules[mod].get("sap_tables", []):
                    for field in re.findall(r"\b" + re.escape(alias) + r"\.(\w+)", clean):
                        ddic.add((mod, table, field.upper(), rewrite(name)))
        for mod in resolved:
            mp = root / "modules" / mod / "mapping.json"
            if mp.exists():
                for line in mp.read_text(encoding="utf-8").splitlines():
                    if "TODO-VERIFY" in line:
                        checks.append(f"- {mod} mapping: {rewrite(line.strip())}")
        zf.writestr("OPEN_CHECKS.md", "\n".join(checks) + "\n")
        if ddic:
            import csv
            import io
            buf = io.StringIO(newline="")
            writer = csv.writer(buf)
            writer.writerow(["module", "table", "field", "view"])
            writer.writerows(sorted(ddic))
            zf.writestr("DDIC_REQUIREMENTS.csv", buf.getvalue())
        zf.writestr("BUILD_MANIFEST.json", json.dumps(manifest, indent=2) + "\n")
        zf.writestr("ACTIVATION_ORDER.txt", "\n".join(
            f"{i:3d}  {o['type']}  {o['name']}  ({o['module']})" for i, o in enumerate(manifest["objects"], 1)) + "\n")
    return out, manifest


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__.split("\n\n")[0])
    ap.add_argument("--product", help="product folder under /packages (e.g. eam); also VDM_PRODUCT")
    ap.add_argument("modules", nargs="*", help="module names (folder names under packages/<product>/modules)")
    ap.add_argument("--all", action="store_true", help="select every module")
    ap.add_argument("--prefix", help="target object prefix, e.g. ZACME_ or /ACME/ (default: library.json)")
    ap.add_argument("--package", help="target package, e.g. ZACME_EAM (default: library.json)")
    ap.add_argument("--out", help="output zip path (default: dist/<package>_<modules>.zip)")
    ap.add_argument("--with-tests", action="store_true", help="include ABAP Unit test classes")
    ap.add_argument("--list", action="store_true", help="list modules and link views, then exit")
    ap.add_argument("--activation-order", action="store_true", help="print activation order, do not build")
    args = ap.parse_args(argv)

    try:
        if is_bridge():
            raise BuildError("the bridge product only ships through build_bundle.py (it needs several products)")
        modules = load_modules()
        if args.list:
            for m in modules.values():
                deps = ", ".join(m.get("hard_dependencies", [])) or "-"
                print(f"{m['name']:<24} batch {m.get('batch', '?')}  {m['status']:<17} deps: {deps}")
            for link in collect_link_views(modules).values():
                print(f"  link {link['name']:<32} requires {' + '.join(link['requires_modules'])}")
            return 0
        selected = sorted(modules) if args.all else args.modules
        if not selected:
            ap.error("select modules or use --all")
        if args.activation_order:
            prefix = load_library()["prefix"]
            _, objects, _, _ = select_objects(selected, modules, args.with_tests)
            check_closure(objects, prefix)
            for i, (t, n, o) in enumerate(activation_order(objects, prefix), 1):
                print(f"{i:3d}  {t}  {n}  ({o})")
            return 0
        out, manifest = build(selected, args.prefix, args.package, args.out, args.with_tests)
    except BuildError as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 1
    print(f"wrote {out}")
    print(f"  modules : {', '.join(manifest['resolved_modules'])}"
          + (f" (auto-included: {', '.join(manifest['auto_included_dependencies'])})"
             if manifest["auto_included_dependencies"] else ""))
    print(f"  links   : {', '.join(manifest['link_views_included']) or '-'}")
    print(f"  objects : {len(manifest['objects'])}  prefix {manifest['target_prefix']}  package {manifest['target_package']}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
