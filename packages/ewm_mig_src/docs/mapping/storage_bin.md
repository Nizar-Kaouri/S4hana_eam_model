# Migration interface: storage_bin

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** - (first level)
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `StorageBin` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZWMX_C_StorageBinMig`

- Source: `ZWMX_I_StorageBin`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `StorageBin`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZWMX_WMS001-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZWMX_WMS001-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZWMX_WMS001-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `Warehouse` | ZWMX_WMS001-F004 | Customer native interface: Warehouse (adapter required) | copy | yes |
| `StorageBin` | ZWMX_WMS001-F005 | Customer native interface: StorageBin (adapter required) | copy | yes |
| `StorageType` | ZWMX_WMS001-F006 | Customer native interface: StorageType (adapter required) | copy | yes |
| `StorageSection` | ZWMX_WMS001-F007 | Customer native interface: StorageSection (adapter required) | copy | yes |
| `BinType` | ZWMX_WMS001-F008 | Customer native interface: BinType (adapter required) | copy | yes |
| `Capacity` | ZWMX_WMS001-F009 | Customer native interface: Capacity (adapter required) | copy | yes |
| `CapacityUnit` | ZWMX_WMS001-F010 | Customer native interface: CapacityUnit (adapter required) | copy | yes |
| `Blocked` | ZWMX_WMS001-F011 | Customer native interface: Blocked (adapter required) | copy | yes |

## `ZWMX_C_BinSortingMig`

- Source: `ZWMX_I_BinSorting`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `StorageBin`, `SortSequence`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZWMX_WMS002-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZWMX_WMS002-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZWMX_WMS002-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `Warehouse` | ZWMX_WMS002-F004 | Customer native interface: Warehouse (adapter required) | copy | yes |
| `StorageBin` | ZWMX_WMS002-F005 | Customer native interface: StorageBin (adapter required) | copy | yes |
| `SortSequence` | ZWMX_WMS002-F006 | Customer native interface: SortSequence (adapter required) | copy | yes |
| `ActivityArea` | ZWMX_WMS002-F007 | Customer native interface: ActivityArea (adapter required) | copy | yes |
| `Activity` | ZWMX_WMS002-F008 | Customer native interface: Activity (adapter required) | copy | yes |
| `SortDirection` | ZWMX_WMS002-F009 | Customer native interface: SortDirection (adapter required) | copy | yes |

## Reconciliation

- Counts: `ZWMX_C_StorageBinMigCount` (ECC) vs `ZWMT_I_StorageBinCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZWMX_C_StorageBinMig` vs `ZWMT_I_StorageBinCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `StorageBin`; compared: `StorageType`, `StorageSection`, `BinType`, `Capacity`, `CapacityUnit`, `Blocked`

```bash
python3 tools/mig_reconcile.py counts --product ewm_mig_src --module storage_bin --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ewm_mig_src --module storage_bin --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.
- Native export adapters and target business posting are customer implementations.
