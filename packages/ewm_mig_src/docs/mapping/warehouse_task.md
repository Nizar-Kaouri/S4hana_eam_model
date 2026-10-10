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
| `Warehouse` | /SCWM/ORDIM_C-LGNUM | Native target evidence: ZWMT_I_TaskConfirmCompare.Warehouse | information only | yes |
| `WarehouseTask` | /SCWM/ORDIM_C-TANUM | Native target evidence: ZWMT_I_TaskConfirmCompare.WarehouseTask | information only | yes |
| `WarehouseTaskItem` | /SCWM/ORDIM_C-TAPOS | Native target evidence: ZWMT_I_TaskConfirmCompare.WarehouseTaskItem | information only | yes |
| `WarehouseOrder` | /SCWM/ORDIM_C-WHO | Native target evidence: ZWMT_I_TaskConfirmCompare.WarehouseOrder | information only | yes |
| `ProcessType` | /SCWM/ORDIM_C-PROCTY | Native target evidence: ZWMT_I_TaskConfirmCompare.ProcessType | information only | yes |
| `TaskStatus` | /SCWM/ORDIM_C-TOSTAT | Native target evidence: ZWMT_I_TaskConfirmCompare.TaskStatus | information only | yes |
| `ConfirmedBy` | /SCWM/ORDIM_C-CONFIRMED_BY | Native target evidence: ZWMT_I_TaskConfirmCompare.ConfirmedBy | information only | yes |
| `ConfirmedAt` | /SCWM/ORDIM_C-CONFIRMED_AT | Native target evidence: ZWMT_I_TaskConfirmCompare.ConfirmedAt | information only | yes |
| `SourceStorageType` | /SCWM/ORDIM_C-VLTYP | Native target evidence: ZWMT_I_TaskConfirmCompare.SourceStorageType | information only | yes |
| `SourceBin` | /SCWM/ORDIM_C-VLPLA | Native target evidence: ZWMT_I_TaskConfirmCompare.SourceBin | information only | yes |
| `TargetStorageType` | /SCWM/ORDIM_C-NLTYP | Native target evidence: ZWMT_I_TaskConfirmCompare.TargetStorageType | information only | yes |
| `TargetBin` | /SCWM/ORDIM_C-NLPLA | Native target evidence: ZWMT_I_TaskConfirmCompare.TargetBin | information only | yes |

## Reconciliation

- Counts: `ZWMX_C_TaskConfirmMigCount` (SAP source) vs `ZWMT_I_TaskConfirmCount` (S/4HANA) per `Warehouse`
- Records and fields: `ZWMX_C_TaskConfirmMig` vs `ZWMT_I_TaskConfirmCompare` on `Warehouse`, `WarehouseTask`, `WarehouseTaskItem`; compared: `WarehouseOrder`, `ProcessType`, `TaskStatus`, `ConfirmedBy`, `ConfirmedAt`, `SourceStorageType`, `SourceBin`, `TargetStorageType`, `TargetBin`

```bash
python3 tools/mig_reconcile.py counts --product ewm_mig_src --module warehouse_task --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ewm_mig_src --module warehouse_task --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Native field/key/release verification and SAP activation pending. No posting adapter.
- WarehouseTask: Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.
- Pending native dependency: warehouse_product
