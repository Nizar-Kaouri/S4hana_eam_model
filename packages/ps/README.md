# Project System (PS) - CDS virtual data model

> **Status: planned.** Product skeleton only - no views yet. See `PRODUCT_CHECKLIST.md` in the
> repository root for the planned modules and the release checks to do first.

Projects, WBS elements and project costs, with links to EAM orders.

| | |
|---|---|
| Product folder | `packages/ps` |
| Object prefix | `ZPSV_` |
| ABAP package | `ZPSV_VDM` |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |

Layout, layering rules, module rules and tooling are the same as in the EAM product
(`packages/eam/README.md`). Every tool takes `--product ps`:

```bash
python3 tools/check_all.py --only ps
python3 build_package.py --product ps --list
```
