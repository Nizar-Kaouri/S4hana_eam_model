# Sales and Distribution (SD) - CDS virtual data model

> **Status: planned.** Product skeleton only - no views yet. See `PRODUCT_CHECKLIST.md` in the
> repository root for the planned modules and the release checks to do first.

Sales orders, deliveries and billing documents.

| | |
|---|---|
| Product folder | `packages/sd` |
| Object prefix | `ZSDV_` |
| ABAP package | `ZSDV_VDM` |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |

Layout, layering rules, module rules and tooling are the same as in the EAM product
(`packages/eam/README.md`). Every tool takes `--product sd`:

```bash
python3 tools/check_all.py --only sd
python3 build_package.py --product sd --list
```
