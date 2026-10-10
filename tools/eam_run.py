#!/usr/bin/env python3
"""Execute a customer EAM preparation project; validate all steps before publishing outputs."""
import argparse
import hashlib
import json
import shutil
import sys
import tempfile
from pathlib import Path

from eam_prepare import aliases, closure, cohort, identity, join, snapshot, unique, write_csv
from mig_reconcile import CsvRows, InputError, read_csv, require


def run(project_path, output_path):
    project_path, output_path = Path(project_path).resolve(), Path(output_path).resolve()
    if output_path.exists():
        raise InputError("choose a new output directory; existing results will not be overwritten")
    project = json.loads(project_path.read_text(encoding="utf-8"))
    datasets, hashes, logs = {}, {}, []
    for name, filename in project["inputs"].items():
        if not name or name in datasets:
            raise InputError("duplicate/empty input identifier")
        path = project_path.parent / filename
        datasets[name] = read_csv(path, preserve_values=True)
        hashes[name] = {"path": str(path.resolve()), "sha256": hashlib.sha256(path.read_bytes()).hexdigest()}
    for step in project["steps"]:
        name = step["name"]
        if not name or name in datasets or Path(name).name != name or any(c in name for c in '/\\:'):
            raise InputError(f"invalid or duplicate step name {name!r}")
        source = datasets[step["input"]]
        columns = source.columns
        op = step["operation"]
        if op == "snapshot":
            rows = snapshot(source, step["contract"], project["cutover"])
        elif op == "selection":
            # A complete approved key must occur exactly once in the export.
            approved = unique(datasets[step["parent"]], step["parent_keys"], "approved selection")
            exported = unique(source, step["child_keys"], "source selection")
            if approved - exported:
                raise InputError(f"approved identities absent from export: {sorted(approved - exported)[:5]}")
            rows = cohort(source, datasets[step["parent"]], step["child_keys"], step["parent_keys"])
        elif op == "cohort":
            rows = cohort(source, datasets[step["parent"]], step["child_keys"], step["parent_keys"])
        elif op == "join":
            rows = join(source, datasets[step["parent"]], step["child_keys"], step["parent_keys"], step["fields"])
            columns = columns + list(step["fields"])
        elif op == "aliases":
            rows = aliases(source, step)
            columns = list(step["fields"])
        elif op == "closure":
            contract = step["contract"]
            rows = closure(source, datasets[step["parent"]], contract["key"], contract["reference"], contract["root"])
        elif op == "reference_keys":
            # A set of referenced IDs can intentionally occur in several parent rows.
            # This never deduplicates an extraction payload or comparison dataset.
            columns = step["keys"]
            require(source, columns, "reference keys")
            values = sorted({tuple(r[c] for c in columns) for r in source})
            rows = [dict(zip(columns, value)) for value in values]
        else:
            raise InputError(f"unsupported operation {op!r}")
        datasets[name] = CsvRows(rows, columns)
        logs.append({"name": name, "operation": op, "input_rows": len(source), "output_rows": len(rows)})
    selected = project.get("outputs", [s["name"] for s in project["steps"]])
    for name in selected:
        if name not in datasets or Path(name).name != name or any(c in name for c in '/\\:'):
            raise InputError(f"invalid output name {name!r}")
    output_path.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(prefix="eam-prepared-", dir=output_path.parent) as temp:
        staging = Path(temp) / "result"
        staging.mkdir()
        for name in selected:
            write_csv(staging / (name + ".csv"), datasets[name], datasets[name].columns)
        audit = {"cutover": project["cutover"], "project": project,
                 "project_sha256": hashlib.sha256(project_path.read_bytes()).hexdigest(),
                 "input_files": hashes, "steps": logs,
                 "outputs": {p.name: hashlib.sha256(p.read_bytes()).hexdigest() for p in staging.glob("*.csv")}}
        (staging / "PREPARATION_AUDIT.json").write_text(json.dumps(audit, indent=2) + "\n", encoding="utf-8")
        # Same-volume rename publishes the complete validated project at once.
        staging.rename(output_path)
    return logs


def main(argv=None):
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--project", required=True)
    parser.add_argument("--out", required=True)
    args = parser.parse_args(argv)
    try:
        logs = run(args.project, args.out)
        print(f"Prepared {len(logs)} steps; complete results in {Path(args.out).resolve()}")
        return 0
    except (InputError, OSError, ValueError, KeyError) as exc:
        print(f"ERROR: {exc}", file=sys.stderr)
        return 2


if __name__ == "__main__":
    sys.exit(main())
