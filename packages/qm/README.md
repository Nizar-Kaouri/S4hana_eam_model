# Quality Management (QM) - CDS virtual data model

Naming: **B_ = Basic, I_ = Interface (Composite), C_ = Consumption**. See [naming guidance](../../docs/NAMING.md).

> **Status: draft-unverified.** Written without an SAP system; nothing has been activated or tested.
> Every uncertain element carries a `TODO-VERIFY` marker, ranked in [`BATCH_REPORT.md`](BATCH_REPORT.md).

| | |
|---|---|
| Product folder | `packages/qm` |
| Object prefix | `ZQMV_` (replaced per customer by the build) |
| ABAP package | `ZQMV_VDM` |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |
| Entity map | [`docs/model_map.html`](docs/model_map.html) |

Same architecture and rules as the EAM product (see `packages/eam/README.md`): basic `ZQMV_B_*`,
composite `ZQMV_I_*` (cubes), consumption `ZQMV_C_*Q` (analytical queries); one self-contained module
per business object; hard dependencies added by the build. **2 intra-product link object(s)** ship
only when all their modules are selected; links to other products live in `packages/bridge`.

## Link views (ship only when all listed modules are selected)

| Link object | Requires modules |
|---|---|
| `ZQMV_B_InspLotWithQualNotif` | inspection_lot, quality_notification |
| `ZQMV_B_QualNotifWithLot` | inspection_lot, quality_notification |

## Data model in one paragraph

Inspection lots (`I_InspectionLot`) carry the usage decision; characteristic results hang below the lot (hard dependency); quality notifications are a separate object. The supplier quality report counts goods-receipt lots with accepted / rejected usage decisions per supplier and computes the rejection rate in the query.

## Modules (4 modules, 13 views)

| Module | Batch | Hard dependencies | Views |
|---|---|---|---|
| `inspection_lot` | 1 | - | `ZQMV_B_InspectionLot`, `ZQMV_B_InspectionLotVH`, `ZQMV_I_InspectionLot`, `ZQMV_C_InspectionLotQ` |
| `inspection_result` | 2 | `inspection_lot` | `ZQMV_B_InspectionCharc`, `ZQMV_I_InspectionCharc`, `ZQMV_C_InspectionCharcQ` |
| `quality_notification` | 3 | - | `ZQMV_B_QualityNotif`, `ZQMV_B_QualityNotifVH`, `ZQMV_I_QualityNotif`, `ZQMV_C_QualityNotifQ` |
| `rpt_supplier_quality` | 4 | `inspection_lot` | `ZQMV_I_SupplierQuality`, `ZQMV_C_SupplierQualityQ` |

## Commands

```bash
python3 tools/check_all.py --only qm
python3 build_package.py --product qm --list
python3 build_package.py --product qm --all --prefix ZACME_ --package ZACME_QM
```
