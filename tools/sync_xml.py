#!/usr/bin/env python3
"""Generate/refresh the abapGit XML companion files for CDS sources in /src.

The XML metadata is derived from the source so that it can never drift:
  *.ddls.asddls -> *.ddls.xml   (DDTEXT from @EndUserText.label, SOURCE_TYPE from the define statement)
  *.dcls.asdcls -> *.dcls.xml   (DDTEXT from @EndUserText.label)
  *.ddlx.asddlx -> *.ddlx.xml   (DESCRIPTION from the annotated entity's label)

Usage: python3 tools/sync_xml.py [--check]
  --check  do not write, exit 1 if any XML file is missing or out of date (for CI).
"""
import re
import sys
from pathlib import Path
from xml.sax.saxutils import escape

sys.path.insert(0, str(Path(__file__).resolve().parent))
import vdm_paths  # noqa: E402  (consumes --product)

ROOT = vdm_paths.PRODUCT_ROOT
SRC = ROOT / "src"

LABEL_RE = re.compile(r"@EndUserText\.label\s*:\s*'([^']*)'")
DEFINE_RE = re.compile(
    r"^\s*define\s+(?P<kind>(?:transient\s+)?(?:root\s+)?view\s+entity|view|abstract\s+entity|custom\s+entity"
    r"|table\s+function|hierarchy|role)\s+(?P<name>[\w/]+)",
    re.IGNORECASE | re.MULTILINE,
)
ANNOTATE_RE = re.compile(r"^\s*annotate\s+(?:entity|view)\s+([\w/]+)", re.IGNORECASE | re.MULTILINE)

# abapGit DDLS SOURCE_TYPE values (domain DDDDLSRCTYPE).
# TODO-VERIFY[H] GEN-A01: SOURCE_TYPE for a transient view entity (assumed 'P' like projection views)
SOURCE_TYPES = {"view entity": "W", "root view entity": "W", "view": "V", "projection": "P",
                "transient": "P", "abstract entity": "A", "custom entity": "Q",
                "table function": "F", "hierarchy": "H"}

HEADER = '<?xml version="1.0" encoding="utf-8"?>\n'


def label_of(text, path):
    m = LABEL_RE.search(text)
    if not m:
        raise SystemExit(f"{path}: missing @EndUserText.label")
    if len(m.group(1)) > 60:
        raise SystemExit(f"{path}: @EndUserText.label longer than 60 characters")
    return m.group(1)


def source_type(text, path):
    m = DEFINE_RE.search(text)
    if not m:
        raise SystemExit(f"{path}: no define statement found")
    kind = " ".join(m.group("kind").lower().split())
    if kind.startswith("transient"):
        return "transient"
    if re.search(r"\bas\s+projection\s+on\b", text, re.IGNORECASE):
        return "projection"
    return kind


def ddls_xml(name, label, stype):
    return (HEADER +
            '<abapGit version="v1.0.0" serializer="LCL_OBJECT_DDLS" serializer_version="v1.0.0">\n'
            ' <asx:abap xmlns:asx="http://www.sap.com/abapxml" version="1.0">\n'
            '  <asx:values>\n'
            '   <DDLS>\n'
            f'    <DDLNAME>{name}</DDLNAME>\n'
            '    <DDLANGUAGE>E</DDLANGUAGE>\n'
            f'    <DDTEXT>{escape(label)}</DDTEXT>\n'
            f'    <SOURCE_TYPE>{SOURCE_TYPES[stype]}</SOURCE_TYPE>\n'
            '   </DDLS>\n'
            '  </asx:values>\n'
            ' </asx:abap>\n'
            '</abapGit>\n')


def dcls_xml(name, label):
    return (HEADER +
            '<abapGit version="v1.0.0" serializer="LCL_OBJECT_DCLS" serializer_version="v1.0.0">\n'
            ' <asx:abap xmlns:asx="http://www.sap.com/abapxml" version="1.0">\n'
            '  <asx:values>\n'
            '   <DCLS>\n'
            f'    <DCLNAME>{name}</DCLNAME>\n'
            '    <DCLLANGUAGE>E</DCLLANGUAGE>\n'
            f'    <DDTEXT>{escape(label)}</DDTEXT>\n'
            '   </DCLS>\n'
            '  </asx:values>\n'
            ' </asx:abap>\n'
            '</abapGit>\n')


def ddlx_xml(name, label):
    return (HEADER +
            '<abapGit version="v1.0.0" serializer="LCL_OBJECT_DDLX" serializer_version="v1.0.0">\n'
            ' <asx:abap xmlns:asx="http://www.sap.com/abapxml" version="1.0">\n'
            '  <asx:values>\n'
            '   <DDLX>\n'
            '    <METADATA>\n'
            f'     <NAME>{name}</NAME>\n'
            f'     <DESCRIPTION>{escape(label)}</DESCRIPTION>\n'
            '     <MASTER_LANGUAGE>EN</MASTER_LANGUAGE>\n'
            '    </METADATA>\n'
            '   </DDLX>\n'
            '  </asx:values>\n'
            ' </asx:abap>\n'
            '</abapGit>\n')


def expected_files(src=SRC):
    out = {}
    for p in sorted(src.rglob("*.ddls.asddls")):
        text = p.read_text(encoding="utf-8")
        name = p.name.split(".")[0].upper()
        out[p.with_name(p.name.replace(".asddls", ".xml"))] = ddls_xml(name, label_of(text, p), source_type(text, p))
    for p in sorted(src.rglob("*.dcls.asdcls")):
        text = p.read_text(encoding="utf-8")
        name = p.name.split(".")[0].upper()
        out[p.with_name(p.name.replace(".asdcls", ".xml"))] = dcls_xml(name, label_of(text, p))
    for p in sorted(src.rglob("*.ddlx.asddlx")):
        text = p.read_text(encoding="utf-8")
        name = p.name.split(".")[0].upper()
        m = ANNOTATE_RE.search(text)
        if not m:
            raise SystemExit(f"{p}: no annotate statement found")
        ddls = p.with_name(m.group(1).lower() + ".ddls.asddls")
        label = label_of(ddls.read_text(encoding="utf-8"), ddls) if ddls.exists() else name
        out[p.with_name(p.name.replace(".asddlx", ".xml"))] = ddlx_xml(name, label)
    return out


def main():
    check = "--check" in sys.argv
    stale = []
    for path, content in expected_files().items():
        current = path.read_text(encoding="utf-8") if path.exists() else None
        if current != content:
            stale.append(path)
            if not check:
                path.write_text(content, encoding="utf-8")
    for p in stale:
        print(("STALE " if check else "wrote ") + vdm_paths.rel(str(p)))
    if check and stale:
        sys.exit(1)


if __name__ == "__main__":
    main()
