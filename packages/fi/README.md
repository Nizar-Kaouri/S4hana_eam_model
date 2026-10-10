# Financial Accounting (FI) - CDS virtual data model

> **Status: planned.** Product skeleton only - no views yet. See `PRODUCT_CHECKLIST.md` in the
> repository root for the planned modules and the release checks to do first.

General ledger, accounts payable and receivable from the Universal Journal.

| | |
|---|---|
| Product folder | `packages/fi` |
| Object prefix | `ZFIV_` |
| ABAP package | `ZFIV_VDM` |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |

Layout, layering rules, module rules and tooling are the same as in the EAM product
(`packages/eam/README.md`). Every tool takes `--product fi`:

```bash
python3 tools/check_all.py --only fi
python3 build_package.py --product fi --list
```
