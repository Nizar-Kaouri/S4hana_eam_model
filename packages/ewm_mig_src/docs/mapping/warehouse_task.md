# Migration interface: warehouse_task

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** `storage_bin`
- **Business key:** `Warehouse`, `WarehouseTask`, `WarehouseTaskItem` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger before comparison.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZWMX_C_TaskConfirmMig`

- Source: `ZWMX_I_TaskConfirm`
- Keys: `Warehouse`, `WarehouseTask`, `WarehouseTaskItem`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Confirmed task records only; open tasks, serials and quantity semantics remain pending. Reference extraction, not task recreation. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Warehouse` | /SCWM/ORDIM_C-LGNUM | Native target evidence: ZWMT_B_TaskConfirmCompare.Warehouse | information only | yes |
| `WarehouseTask` | /SCWM/ORDIM_C-TANUM | Native target evidence: ZWMT_B_TaskConfirmCompare.WarehouseTask | information only | yes |
| `WarehouseTaskItem` | /SCWM/ORDIM_C-TAPOS | Native target evidence: ZWMT_B_TaskConfirmCompare.WarehouseTaskItem | information only | yes |
| `WarehouseOrder` | /SCWM/ORDIM_C-WHO | Native target evidence: ZWMT_B_TaskConfirmCompare.WarehouseOrder | information only | yes |
| `ProcessType` | /SCWM/ORDIM_C-PROCTY | Native target evidence: ZWMT_B_TaskConfirmCompare.ProcessType | information only | yes |
| `TaskStatus` | /SCWM/ORDIM_C-TOSTAT | Native target evidence: ZWMT_B_TaskConfirmCompare.TaskStatus | information only | yes |
| `ConfirmedBy` | /SCWM/ORDIM_C-CONFIRMED_BY | Native target evidence: ZWMT_B_TaskConfirmCompare.ConfirmedBy | information only | yes |
| `ConfirmedAt` | /SCWM/ORDIM_C-CONFIRMED_AT | Native target evidence: ZWMT_B_TaskConfirmCompare.ConfirmedAt | information only | yes |
| `SourceStorageType` | /SCWM/ORDIM_C-VLTYP | Native target evidence: ZWMT_B_TaskConfirmCompare.SourceStorageType | information only | yes |
| `SourceBin` | /SCWM/ORDIM_C-VLPLA | Native target evidence: ZWMT_B_TaskConfirmCompare.SourceBin | information only | yes |
| `TargetStorageType` | /SCWM/ORDIM_C-NLTYP | Native target evidence: ZWMT_B_TaskConfirmCompare.TargetStorageType | information only | yes |
| `TargetBin` | /SCWM/ORDIM_C-NLPLA | Native target evidence: ZWMT_B_TaskConfirmCompare.TargetBin | information only | yes |

## `ZWMX_C_WarehouseTaskMig`

- Source: `ZWMX_I_WarehouseTask`
- Keys: `Warehouse`, `WarehouseTask`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Open-task snapshot only. Do not add confirmed-task TAPOS to this grain. Quantities, product references and serials remain pending. Key flags require actual DDIC validation.

| Element | Source (SAP source) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Warehouse` | /SCWM/ORDIM_O-LGNUM | Native target evidence: ZWMT_B_WarehouseTaskCompare.Warehouse | information only | yes |
| `WarehouseTask` | /SCWM/ORDIM_O-TANUM | Native target evidence: ZWMT_B_WarehouseTaskCompare.WarehouseTask | information only | yes |
| `WarehouseOrder` | /SCWM/ORDIM_O-WHO | Native target evidence: ZWMT_B_WarehouseTaskCompare.WarehouseOrder | information only | yes |
| `TaskStatus` | /SCWM/ORDIM_O-TOSTAT | Native target evidence: ZWMT_B_WarehouseTaskCompare.TaskStatus | information only | yes |
| `CreatedBy` | /SCWM/ORDIM_O-CREATED_BY | Native target evidence: ZWMT_B_WarehouseTaskCompare.CreatedBy | information only | yes |
| `ActivityArea` | /SCWM/ORDIM_O-AAREA | Native target evidence: ZWMT_B_WarehouseTaskCompare.ActivityArea | information only | yes |
| `SourceStorageType` | /SCWM/ORDIM_O-VLTYP | Native target evidence: ZWMT_B_WarehouseTaskCompare.SourceStorageType | information only | yes |
| `TargetStorageType` | /SCWM/ORDIM_O-NLTYP | Native target evidence: ZWMT_B_WarehouseTaskCompare.TargetStorageType | information only | yes |
| `TargetStorageSection` | /SCWM/ORDIM_O-NLBER | Native target evidence: ZWMT_B_WarehouseTaskCompare.TargetStorageSection | information only | yes |
| `Owner` | /SCWM/ORDIM_O-OWNER | Native target evidence: ZWMT_B_WarehouseTaskCompare.Owner | information only | yes |
| `OwnerRole` | /SCWM/ORDIM_O-OWNER_ROLE | Native target evidence: ZWMT_B_WarehouseTaskCompare.OwnerRole | information only | yes |
| `Unit` | /SCWM/ORDIM_O-MEINS | Native target evidence: ZWMT_B_WarehouseTaskCompare.Unit | information only | yes |

## Reconciliation

- Counts: `ZWMX_C_TaskConfirmMigCount` (SAP source) vs `ZWMT_I_TaskConfirmCount` (S/4HANA) per `Warehouse`
- Records and fields: `ZWMX_C_TaskConfirmMig` vs `ZWMT_B_TaskConfirmCompare` on `Warehouse`, `WarehouseTask`, `WarehouseTaskItem`; compared: `WarehouseOrder`, `ProcessType`, `TaskStatus`, `ConfirmedBy`, `ConfirmedAt`, `SourceStorageType`, `SourceBin`, `TargetStorageType`, `TargetBin`

```bash
python3 tools/mig_reconcile.py counts --product ewm_mig_src --module warehouse_task --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ewm_mig_src --module warehouse_task --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- WarehouseTask: Open-task snapshot only. Do not add confirmed-task TAPOS to this grain. Quantities, product references and serials remain pending. Key flags require actual DDIC validation.
- TaskConfirm: Confirmed tasks only, retaining TAPOS. Open tasks are delivered separately at LGNUM/TANUM grain. Quantity and serial payload remain pending.
