# Asset Accounting (FI-AA) - CDS virtual data model

> **Status: planned.** Product skeleton only - no views yet. See `PRODUCT_CHECKLIST.md` in the
> repository root for the planned modules and the release checks to do first.

Fixed assets, asset values and depreciation, with links to EAM equipment.

| | |
|---|---|
| Product folder | `packages/fi_aa` |
| Object prefix | `ZFAA_` |
| ABAP package | `ZFAA_VDM` |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |

Layout, layering rules, module rules and tooling are the same as in the EAM product
(`packages/eam/README.md`). Every tool takes `--product fi_aa`:

```bash
python3 tools/check_all.py --only fi_aa
python3 build_package.py --product fi_aa --list
```
