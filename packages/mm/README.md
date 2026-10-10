# Materials Management (MM) - CDS virtual data model

> **Status: planned.** Product skeleton only - no views yet. See `PRODUCT_CHECKLIST.md` in the
> repository root for the planned modules and the release checks to do first.

Purchasing, inventory and goods movements, with a spare-parts focus and links to EAM orders.

| | |
|---|---|
| Product folder | `packages/mm` |
| Object prefix | `ZMMV_` |
| ABAP package | `ZMMV_VDM` |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |

Layout, layering rules, module rules and tooling are the same as in the EAM product
(`packages/eam/README.md`). Every tool takes `--product mm`:

```bash
python3 tools/check_all.py --only mm
python3 build_package.py --product mm --list
```
