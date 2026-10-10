"""Shared path resolution for the multi-product repository.

Layout:  <repo>/packages/<product>/{src,modules,docs,tests/abap,library.json,...}
         <repo>/tools/            shared tooling (this file)
         <repo>/build_package.py  shared build CLI

The product is chosen with `--product <name>` on the command line (consumed here, before the
tool's own argument parsing) or the environment variable VDM_PRODUCT.
"""
import os
import sys
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
PACKAGES = REPO / "packages"
TOOLS = REPO / "tools"


def products():
    return sorted(p.name for p in PACKAGES.iterdir() if (p / "library.json").exists()) if PACKAGES.exists() else []


def _take_product_arg():
    argv = sys.argv
    for i, a in enumerate(argv):
        if a == "--product" and i + 1 < len(argv):
            value = argv[i + 1]
            del argv[i:i + 2]
            return value
        if a.startswith("--product="):
            del argv[i]
            return a.split("=", 1)[1]
    return None


PRODUCT = _take_product_arg() or os.environ.get("VDM_PRODUCT")
if not PRODUCT:
    sys.exit("select a product with --product <name> or VDM_PRODUCT=<name>; available: "
             + ", ".join(products()))
if PRODUCT not in products():
    sys.exit(f"unknown product '{PRODUCT}'; available: " + ", ".join(products()))
os.environ["VDM_PRODUCT"] = PRODUCT  # inherited by sub-tools
PRODUCT_ROOT = PACKAGES / PRODUCT


def rel(path):
    """Repository-relative path for messages."""
    try:
        return str(Path(path).resolve().relative_to(REPO))
    except ValueError:
        return str(path)
