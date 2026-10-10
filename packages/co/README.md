# Controlling (CO) - CDS virtual data model

> **Status: planned.** Product skeleton only - no views yet. See `PRODUCT_CHECKLIST.md` in the
> repository root for the planned modules and the release checks to do first.

Cost centers, internal orders and profitability analysis from the Universal Journal.

| | |
|---|---|
| Product folder | `packages/co` |
| Object prefix | `ZCOV_` |
| ABAP package | `ZCOV_VDM` |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |

Layout, layering rules, module rules and tooling are the same as in the EAM product
(`packages/eam/README.md`). Every tool takes `--product co`:

```bash
python3 tools/check_all.py --only co
python3 build_package.py --product co --list
```
