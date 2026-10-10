#!/usr/bin/env python3
"""Run every offline quality gate for every product (or one product with --only <name>).

Per product: abaplint (with the product's abaplint.json), sync_xml, gen_docs, gen_checklist,
gen_model_map (--check), validate_repo, todo_verify_report (--check).
Once: unit tests of the shared build script (tools/tests).

abaplint is taken from node_modules/.bin/abaplint (run `npm install` once) or from $ABAPLINT.
Use --fix to regenerate the generated files instead of only checking them.
"""
import os
import shutil
import subprocess
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
PACKAGES = REPO / "packages"
GENERATORS = ["sync_xml", "gen_docs", "gen_checklist", "gen_model_map", "todo_verify_report"]


def abaplint_cmd():
    for cand in (os.environ.get("ABAPLINT"), str(REPO / "node_modules" / ".bin" / "abaplint"), shutil.which("abaplint")):
        if cand and Path(cand).exists():
            return [cand]
    return None


def run(cmd, cwd, env, label):
    res = subprocess.run(cmd, cwd=cwd, env=env, capture_output=True, text=True)
    out = [l for l in (res.stdout + res.stderr).splitlines() if l.strip()]
    status = "ok " if res.returncode == 0 else "FAIL"
    print(f"  [{status}] {label}" + (f": {out[-1]}" if out else ""))
    if res.returncode != 0:
        for line in out[-15:]:
            print("        " + line)
    return res.returncode == 0


def main():
    args = sys.argv[1:]
    fix = "--fix" in args
    only = args[args.index("--only") + 1] if "--only" in args else None
    products = sorted(p.name for p in PACKAGES.iterdir() if (p / "library.json").exists())
    if only:
        products = [p for p in products if p == only]
        if not products:
            sys.exit(f"unknown product {only}")
    lint = abaplint_cmd()
    ok = True
    for product in products:
        print(f"{product}:")
        env = dict(os.environ, VDM_PRODUCT=product)
        root = PACKAGES / product
        for gen in GENERATORS:
            cmd = [sys.executable, str(REPO / "tools" / f"{gen}.py")] + ([] if fix else ["--check"])
            ok &= run(cmd, REPO, env, gen + ("" if fix else " --check"))
        ok &= run([sys.executable, str(REPO / "tools" / "validate_repo.py")], REPO, env, "validate_repo")
        if lint:
            ok &= run(lint, root, env, "abaplint")
        else:
            print("  [skip] abaplint: run `npm install` or set ABAPLINT=<path to abaplint>")
            ok = False
    if not only or only == "eam":
        print("shared:")
        ok &= run([sys.executable, "-m", "unittest", "discover", "-s", "tools/tests"], REPO, dict(os.environ), "build_package unit tests")
    print("ALL CHECKS PASSED" if ok else "CHECKS FAILED")
    sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
