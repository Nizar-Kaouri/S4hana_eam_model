# Migration interface: storage_bin

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `Warehouse`, `StorageBin` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger during loading.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZWMX_C_StorageBinMig`

- Source: `ZWMX_I_StorageBin`
- Keys: `Warehouse`, `StorageBin`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: EWM storage bins; LE-WM LAGP is a different model. Capacity fields await validated unit semantics. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Warehouse` | /SCWM/LAGP-LGNUM | Native target evidence: ZWMT_B_StorageBinCompare.Warehouse | copy |
| `StorageBin` | /SCWM/LAGP-LGPLA | Native target evidence: ZWMT_B_StorageBinCompare.StorageBin | copy |
| `StorageType` | /SCWM/LAGP-LGTYP | Native target evidence: ZWMT_B_StorageBinCompare.StorageType | copy |
| `StorageSection` | /SCWM/LAGP-LGBER | Native target evidence: ZWMT_B_StorageBinCompare.StorageSection | copy |
| `BinType` | /SCWM/LAGP-LPTYP | Native target evidence: ZWMT_B_StorageBinCompare.BinType | copy |
| `RemovalBlocked` | /SCWM/LAGP-SKZUA | Native target evidence: ZWMT_B_StorageBinCompare.RemovalBlocked | copy |
| `PutawayBlocked` | /SCWM/LAGP-SKZUE | Native target evidence: ZWMT_B_StorageBinCompare.PutawayBlocked | copy |
| `InventoryBlocked` | /SCWM/LAGP-SKZSI | Native target evidence: ZWMT_B_StorageBinCompare.InventoryBlocked | copy |

## `ZWMX_C_BinSortingMig`

- Source: `ZWMX_I_BinSorting`
- Keys: `Warehouse`, `StorageBin`, `ActivityArea`, `Activity`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: SortSequence is payload, not an invented key. Confirm exact DDIC key flags before activation. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Warehouse` | /SCWM/LAGPS-LGNUM | Native target evidence: ZWMT_B_BinSortingCompare.Warehouse | copy |
| `StorageBin` | /SCWM/LAGPS-LGPLA | Native target evidence: ZWMT_B_BinSortingCompare.StorageBin | copy |
| `ActivityArea` | /SCWM/LAGPS-AAREA | Native target evidence: ZWMT_B_BinSortingCompare.ActivityArea | copy |
| `Activity` | /SCWM/LAGPS-ACT_TYPE | Native target evidence: ZWMT_B_BinSortingCompare.Activity | copy |
| `StorageType` | /SCWM/LAGPS-LGTYP | Native target evidence: ZWMT_B_BinSortingCompare.StorageType | copy |
| `SortSequence` | /SCWM/LAGPS-REIHF | Native target evidence: ZWMT_B_BinSortingCompare.SortSequence | copy |

## Source controls

- Source count view: `ZWMX_C_StorageBinMigCount`

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- StorageBin: EWM storage bins; LE-WM LAGP is a different model. Capacity fields await validated unit semantics.
- BinSorting: SortSequence is payload, not an invented key. Confirm exact DDIC key flags before activation.
