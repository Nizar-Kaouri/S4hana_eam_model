# Quality Management (QM) - CDS virtual data model

> **Status: planned.** Product skeleton only - no views yet. See `PRODUCT_CHECKLIST.md` in the
> repository root for the planned modules and the release checks to do first.

Inspection lots, results and quality notifications.

| | |
|---|---|
| Product folder | `packages/qm` |
| Object prefix | `ZQMV_` |
| ABAP package | `ZQMV_VDM` |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |

Layout, layering rules, module rules and tooling are the same as in the EAM product
(`packages/eam/README.md`). Every tool takes `--product qm`:

```bash
python3 tools/check_all.py --only qm
python3 build_package.py --product qm --list
```
