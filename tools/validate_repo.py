#!/usr/bin/env python3
"""Structural checks for the ZEAM VDM repository (complements abaplint).

abaplint parses DDLS sources but not DCLS / DDLX content and knows nothing about the
module rules of this library, so this script enforces:

  M1  module.json: required keys, allowed status, phase rules from library.json
  M2  every object listed in a module.json exists; every /src object belongs to a module
  M3  layer naming: basic=<P>I_*, composite=<P>R_*, consumption=<P>C_*Q, and the matching @VDM.viewType
  M4  every DDLS has @AccessControl, @Analytics*, @VDM.viewType, @ObjectModel and @EndUserText.label
  M5  every DDLS has a DCL (unless listed in no_dcl_by_design) and a doc page docs/views/<Name>.md
  M6  base views reference only objects of their own module or of declared hard dependencies;
      link views only objects of the modules they require
  M7  DCLS: role name = file name, grants select on itself, inherited ZEAM entity exists
  M8  DDLX: annotates an existing view that has @Metadata.allowExtensions: true
  M9  object names within length limits for the library prefix
  M10 abapGit XML in sync with sources (tools/sync_xml.py --check)
  M11 TODO-VERIFY markers well-formed with unique IDs

Usage: python3 tools/validate_repo.py      (exit code 1 on any error)
"""
import json
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT))
sys.path.insert(0, str(ROOT / "tools"))

import build_package as bp  # noqa: E402
import sync_xml  # noqa: E402

REQUIRED_KEYS = ["name", "title", "status", "tested_release", "tags", "hard_dependencies", "objects", "link_views"]
STATUSES = {"draft-unverified", "activated", "tested"}
LAYER_RULES = {"basic": ("I_", "#BASIC"), "composite": ("R_", "#COMPOSITE"), "consumption": ("C_", "#CONSUMPTION")}
MARKER_RE = re.compile(r"TODO-VERIFY\[(?P<risk>[HML])\]\s+(?P<id>[A-Z]+-[A-Z0-9]+):")
LOOSE_MARKER_RE = re.compile(r"TODO-VERIFY\[")


def main():
    errors = []
    err = errors.append
    library = bp.load_library()
    prefix = library["prefix"]
    try:
        modules = bp.load_modules()
        links = bp.collect_link_views(modules)
    except bp.BuildError as exc:
        print(f"ERROR {exc}")
        return 1

    # M1
    for m in modules.values():
        for key in REQUIRED_KEYS:
            if key not in m:
                err(f"M1 module {m['name']}: missing key '{key}'")
        if m.get("status") not in STATUSES:
            err(f"M1 module {m['name']}: status '{m.get('status')}' not in {sorted(STATUSES)}")
        if library.get("phase") == "no-system":
            if m.get("status") != "draft-unverified":
                err(f"M1 module {m['name']}: phase 'no-system' requires status draft-unverified")
            if m.get("tested_release") != "none (draft, 2025 assumed)":
                err(f"M1 module {m['name']}: phase 'no-system' requires tested_release 'none (draft, 2025 assumed)'")
        for dep in m.get("hard_dependencies", []):
            if dep not in modules:
                err(f"M1 module {m['name']}: unknown hard dependency '{dep}'")
    try:
        for name in modules:
            bp.resolve_modules([name], modules)
    except bp.BuildError as exc:
        err(f"M1 {exc}")

    # M2 - ownership map
    owner = {}  # (type, NAME) -> module or "link:<a+b>"
    for m in modules.values():
        for t, n, _ in bp.module_objects(m, with_tests=True):
            key = (t, n.upper())
            if key in owner and owner[key] != m["name"]:
                err(f"M2 {t} {n} listed in modules {owner[key]} and {m['name']}")
            owner[key] = m["name"]
    for link in links.values():
        owner[("DDLS", link["name"].upper())] = "link:" + "+".join(link["requires_modules"])
        if link.get("access_control"):
            owner[("DCLS", link["access_control"].upper())] = "link:" + "+".join(link["requires_modules"])
    canonical = {}
    for (t, n_upper), mod in owner.items():
        folder, suffixes = bp.OBJECT_FILES[t]
        path = ROOT / folder / (n_upper.lower().replace("/", "#") + suffixes[0])
        if not path.exists():
            err(f"M2 {t} {n_upper} ({mod}) has no file {path.relative_to(ROOT)}")
    for m in modules.values():
        for t, n, _ in bp.module_objects(m, with_tests=True):
            canonical[(t, n.upper())] = n
    for link in links.values():
        canonical[("DDLS", link["name"].upper())] = link["name"]
        if link.get("access_control"):
            canonical[("DCLS", link["access_control"].upper())] = link["access_control"]
    ext_type = {".ddls.asddls": "DDLS", ".dcls.asdcls": "DCLS", ".ddlx.asddlx": "DDLX", ".clas.abap": "CLAS"}
    for folder in ("src", "tests/abap"):
        for path in (ROOT / folder).glob("*.*"):
            for ext, t in ext_type.items():
                if path.name.endswith(ext):
                    if (t, path.name[: -len(ext)].upper().replace("#", "/")) not in owner:
                        err(f"M2 {path.relative_to(ROOT)} is not listed in any module.json")

    ddls_text = {}
    for (t, n_upper), mod in owner.items():
        if t == "DDLS":
            p = ROOT / "src" / (n_upper.lower() + ".ddls.asddls")
            if p.exists():
                ddls_text[n_upper] = p.read_text(encoding="utf-8")

    # M3 / M4 / M5
    for m in modules.values():
        for layer, (layer_prefix, vdm) in LAYER_RULES.items():
            for n in m["objects"].get(layer, []):
                text = ddls_text.get(n.upper(), "")
                if not n.upper().startswith((prefix + layer_prefix).upper()):
                    err(f"M3 {n}: {layer} views must start with {prefix}{layer_prefix}")
                if layer == "consumption" and not n.endswith("Q"):
                    err(f"M3 {n}: consumption views must end with 'Q'")
                if f"@VDM.viewType: {vdm}" not in text:
                    err(f"M3 {n}: expected @VDM.viewType: {vdm}")
    for link in links.values():
        text = ddls_text.get(link["name"].upper(), "")
        if not link["name"].upper().startswith((prefix + "I_").upper()) or "@VDM.viewType: #BASIC" not in text:
            err(f"M3 link view {link['name']}: must be {prefix}I_* with @VDM.viewType: #BASIC")
        if "LINK VIEW" not in text:
            err(f"M3 link view {link['name']}: header comment must say 'LINK VIEW'")

    no_dcl = {}
    for m in modules.values():
        for n in m.get("no_dcl_by_design", {}):
            no_dcl[n.upper()] = m["name"]
    for n_upper, text in ddls_text.items():
        name = canonical.get(("DDLS", n_upper), n_upper)
        for ann, label in [("@AccessControl.authorizationCheck", "@AccessControl"),
                           ("@Analytics", "@Analytics*"), ("@VDM.viewType", "@VDM.viewType"),
                           ("@ObjectModel", "@ObjectModel"), ("@EndUserText.label", "@EndUserText.label")]:
            if ann not in text:
                err(f"M4 {name}: missing {label} annotation")
        if "draft-unverified" not in text.splitlines()[0]:
            err(f"M4 {name}: first line must carry the draft-unverified status comment")
        if ("DCLS", n_upper) not in owner and n_upper not in no_dcl:
            err(f"M5 {name}: no DCL and not listed in no_dcl_by_design")
        if not (ROOT / "docs" / "views" / f"{name}.md").exists():
            err(f"M5 {name}: missing docs/views/{name}.md")

    # M6 - module isolation
    def allowed_modules(mod_name):
        if mod_name.startswith("link:"):
            return set(mod_name[5:].split("+"))
        return set(bp.resolve_modules([mod_name], modules))

    for (t, n_upper), mod in owner.items():
        if t == "CLAS":
            continue
        try:
            refs = bp.references(t, canonical.get((t, n_upper), n_upper), prefix)
        except bp.BuildError:
            continue
        allowed = allowed_modules(mod)
        for ref in refs:
            ref_owner = owner.get(("DDLS", ref)) or owner.get(("DCLS", ref))
            if ref_owner is None:
                err(f"M6 {t} {n_upper} references unknown object {ref}")
            elif ref_owner.startswith("link:") and not mod.startswith("link:"):
                err(f"M6 {t} {n_upper} ({mod}) references link view {ref}")
            elif not ref_owner.startswith("link:") and ref_owner not in allowed:
                err(f"M6 {t} {n_upper} ({mod}) references {ref} of module {ref_owner} "
                    f"(not a hard dependency - use a link view)")

    # M7 - DCLS
    for (t, n_upper), mod in owner.items():
        if t != "DCLS":
            continue
        p = ROOT / "src" / (n_upper.lower() + ".dcls.asdcls")
        if not p.exists():
            continue
        text = bp.strip_comments(p.read_text(encoding="utf-8"), "DCLS")
        m = re.search(r"define\s+role\s+([\w/]+)\s*\{(.*)\}\s*$", text, re.DOTALL | re.IGNORECASE)
        if not m or m.group(1).upper() != n_upper:
            err(f"M7 DCLS {n_upper}: 'define role {n_upper}' not found")
            continue
        body = m.group(2)
        grant = re.search(r"grant\s+select\s+on\s+([\w/]+)\s*(where\s+(.*?))?;", body, re.DOTALL | re.IGNORECASE)
        if not grant or grant.group(1).upper() != n_upper:
            err(f"M7 DCLS {n_upper}: must 'grant select on {n_upper}'")
        if ("DDLS", n_upper) not in owner:
            err(f"M7 DCLS {n_upper}: no DDLS with the same name")
        for inh in re.findall(r"inheriting\s+conditions\s+from\s+entity\s+([\w/]+)", body, re.IGNORECASE):
            if inh.upper().startswith(prefix.upper()) and ("DDLS", inh.upper()) not in owner:
                err(f"M7 DCLS {n_upper}: inherits from unknown entity {inh}")
        if body.count("{") != body.count("}"):
            err(f"M7 DCLS {n_upper}: unbalanced braces")

    # M8 - DDLX
    for (t, n_upper), mod in owner.items():
        if t != "DDLX":
            continue
        p = ROOT / "src" / (n_upper.lower() + ".ddlx.asddlx")
        if not p.exists():
            continue
        text = p.read_text(encoding="utf-8")
        m = re.search(r"annotate\s+(?:entity|view)\s+([\w/]+)\s+with\s*\{(.*)\}\s*$", text, re.DOTALL | re.IGNORECASE)
        if not m:
            err(f"M8 DDLX {n_upper}: 'annotate entity ... with {{ ... }}' not found")
            continue
        target = m.group(1).upper()
        if target not in ddls_text:
            err(f"M8 DDLX {n_upper}: annotated entity {target} not in repository")
        elif "@Metadata.allowExtensions: true" not in ddls_text[target]:
            err(f"M8 DDLX {n_upper}: {target} lacks @Metadata.allowExtensions: true")
        if "@Metadata.layer" not in text:
            err(f"M8 DDLX {n_upper}: missing @Metadata.layer")
        elements = re.findall(r"^\s*([A-Za-z_]\w*)\s*;", m.group(2), re.MULTILINE)
        view = ddls_text.get(target, "")
        for el in elements:
            if not re.search(r"\b" + el + r"\b", view):
                err(f"M8 DDLX {n_upper}: element {el} not found in {target}")

    # M9 - name lengths
    limits = library.get("max_object_name_length", {})
    for (t, n_upper) in owner:
        if len(n_upper) > limits.get(t, 30):
            err(f"M9 {t} {n_upper}: {len(n_upper)} characters > {limits.get(t, 30)}")

    # M10 - XML sync
    for path, content in sync_xml.expected_files().items():
        if not path.exists() or path.read_text(encoding="utf-8") != content:
            err(f"M10 {path.relative_to(ROOT)} out of date - run python3 tools/sync_xml.py")

    # M11 - markers
    seen = {}
    for folder in ("src", "tests", "tools"):
        for path in sorted((ROOT / folder).rglob("*")):
            if not path.is_file() or path.suffix == ".pyc" or path.name in ("validate_repo.py", "todo_verify_report.py"):
                continue
            for i, line in enumerate(path.read_text(encoding="utf-8", errors="ignore").splitlines(), 1):
                if LOOSE_MARKER_RE.search(line):
                    m = MARKER_RE.search(line)
                    if not m:
                        err(f"M11 {path.relative_to(ROOT)}:{i}: malformed TODO-VERIFY marker")
                    elif m.group("id") in seen:
                        err(f"M11 duplicate TODO-VERIFY id {m.group('id')} ({seen[m.group('id')]} and "
                            f"{path.relative_to(ROOT)}:{i})")
                    else:
                        seen[m.group("id")] = f"{path.relative_to(ROOT)}:{i}"

    for e in errors:
        print("ERROR " + e)
    print(f"validate_repo: {len(errors)} error(s), {len(modules)} module(s), {len(owner)} object(s), "
          f"{len(seen)} TODO-VERIFY item(s)")
    return 1 if errors else 0


if __name__ == "__main__":
    sys.exit(main())
