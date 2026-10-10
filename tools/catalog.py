"""Read-only catalog of all products (no product selection needed).

Used by the bundle build and the bridge validator to resolve names across products.
"""
import json
import re
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
PACKAGES = REPO / "packages"


class Product:
    def __init__(self, root):
        self.root = root
        self.name = root.name
        self.lib = json.loads((root / "library.json").read_text(encoding="utf-8"))
        self.prefix = self.lib["prefix"]
        self.package = self.lib["package"]
        self.is_bridge = self.lib.get("kind") == "bridge"
        self.modules = {}
        for mj in sorted((root / "modules").glob("*/module.json")):
            m = json.loads(mj.read_text(encoding="utf-8"))
            self.modules[m["name"]] = m
        bf = root / "bridges.json"
        self.bridges = json.loads(bf.read_text(encoding="utf-8"))["bridge_links"] if bf.exists() else []


def load_all():
    return {p.name: Product(p) for p in sorted(PACKAGES.iterdir()) if (p / "library.json").exists()}


def prefix_regex(products):
    alts = "|".join(sorted((re.escape(p.prefix) for p in products.values()), key=len, reverse=True))
    return re.compile(r"(?<![A-Za-z0-9_/#])(?:" + alts + r")[A-Za-z0-9_]+", re.IGNORECASE)


def owner_index(products):
    """NAME (upper) -> (product, 'module'|'link'|'bridge', module name or requires list)."""
    idx = {}
    for p in products.values():
        for m in p.modules.values():
            objs = m.get("objects", {})
            for key in ("basic", "composite", "consumption", "access_controls", "metadata_extensions"):
                for n in objs.get(key, []):
                    idx.setdefault(n.upper(), (p.name, "module", m["name"]))
            for lk in m.get("link_views", []):
                idx[lk["name"].upper()] = (p.name, "link", lk["requires_modules"])
        for b in p.bridges:
            idx[b["name"].upper()] = (p.name, "bridge", b["requires_modules"])
    return idx


def resolve_deps(product, names):
    """Module names plus transitive hard dependencies inside one product."""
    out, todo = set(), list(names)
    while todo:
        n = todo.pop()
        if n in out:
            continue
        if n not in product.modules:
            raise KeyError(f"unknown module {product.name}:{n}")
        out.add(n)
        todo += product.modules[n].get("hard_dependencies", [])
    return out
