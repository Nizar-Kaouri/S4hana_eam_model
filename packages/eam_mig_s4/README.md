# EAM Migration - S/4HANA reconciliation (`ZEMT_`)

> **Status: draft-unverified (pilot).** Nothing has been activated or run. Tested release: none (draft,
> 2025 assumed). Open items are ranked in [`BATCH_REPORT.md`](BATCH_REPORT.md).

Target side of the EAM migration model (ECC → S/4HANA). The extraction views, the mapping and the
reconciliation tool live in [`packages/eam_mig_ecc`](../eam_mig_ecc/README.md); this product holds the
S/4HANA views the migrated data is compared with.

| | |
|---|---|
| Product folder | `packages/eam_mig_s4` |
| Object prefix | `ZEMT_` (separate target prefix; default ZEMT_) |
| ABAP package | `ZEMT_MIG` |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |

Per migrated object (8 modules: work center, functional location, equipment, measuring point, task list,
maintenance plan, open notification, open order) there are two views on SAP released `I_` views:

- `ZEMT_I_<Object>Compare` (basic) - business key + the fields compared after the load. The element names equal the
  ECC consumption view (`ZEMX_C_*Mig`), so `tools/mig_reconcile.py records` compares them by name.
- `ZEMT_I_<Object>Count` (composite) - record count per the same dimensions as the ECC count view
  (`tools/mig_reconcile.py counts`).

The field lists are generated from the `compare` flags in the ECC mapping files, and `tools/validate_mapping.py`
checks that both sides stay aligned (rule X5). Like the extraction, the reconciliation views have no CDS access
control by design (TGEN-D01): they must see every migrated record; grant them to the migration role only.

These views select from SAP's released views directly instead of the `ZEAM_` views of `packages/eam`, so the
migration package does not depend on the analytics product.

```bash
python3 tools/check_all.py --only eam_mig_s4
python3 build_package.py --product eam_mig_s4 --list
```
