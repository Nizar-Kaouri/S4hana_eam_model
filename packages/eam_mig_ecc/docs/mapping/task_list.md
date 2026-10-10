# Migration interface: task_list

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `work_center`, `equipment`, `functional_location`
- **Business key:** `TaskListType`, `TaskListGroup`, `TaskListGroupCounter` · numbering **new**
- **Key rule:** Task list groups are usually renumbered: the load program keeps the old -> new numbers; maintenance plan items refer to them.

> TODO-VERIFY[M] XTL-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEMX_C_TaskListMig`

- Source: `ZEMX_I_TaskListCurrent`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TaskListType` | PLKO-PLNTY | PLKO-PLNTY | copy | yes |
| `TaskListGroup` | PLKO-PLNNR | PLKO-PLNNR | copy | yes |
| `TaskListGroupCounter` | PLKO-PLNAL | PLKO-PLNAL | copy | yes |
| `ValidityStartDate` | PLKO-DATUV | PLKO-DATUV | copy |  |
| `TaskListDesc` | PLKO-KTEXT | PLKO-KTEXT | copy | yes |
| `Plant` | PLKO-WERKS | PLKO-WERKS | copy | yes |
| `TaskListUsage` | PLKO-VERWE | PLKO-VERWE | copy | yes |
| `TaskListStatus` | PLKO-STATU | PLKO-STATU | copy | yes |
| `MaintenancePlannerGroup` | PLKO-VAGRP | PLKO-VAGRP | copy | yes |
| `MainWorkCenter` | CRHD-ARBPL | CRHD-ARBPL | copy |  |
| `MainWorkCenterPlant` | CRHD-WERKS | CRHD-WERKS | copy |  |
| `MaintenanceStrategy` | PLKO-STRAT | PLKO-STRAT | copy | yes |
| `MaintObjectSystemCondition` | PLKO-ANLZU | PLKO-ANLZU | copy |  |
| `LastChangeDate` | PLKO-AEDAT | - | information only |  |

## `ZEMX_C_TaskListOperationMig`

- Source: `ZEMX_I_TaskListOperation`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `TaskListSequence`, `TaskListOperation`
- Scope: `src.IsMarkedForDeletion = '' and src.OpAssignmentIsDeleted = '' and _TaskListCurrent.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TaskListType` | PLAS-PLNTY | PLAS-PLNTY | copy |  |
| `TaskListGroup` | PLAS-PLNNR | PLAS-PLNNR | copy |  |
| `TaskListGroupCounter` | PLAS-PLNAL | PLAS-PLNAL | copy |  |
| `TaskListSequence` | PLAS-PLNFL | PLAS-PLNFL | copy |  |
| `TaskListOperation` | PLPO-VORNR | PLPO-VORNR | copy |  |
| `TaskListSubOperation` | PLPO-UVORN | PLPO-UVORN | copy |  |
| `OperationControlKey` | PLPO-STEUS | PLPO-STEUS | copy |  |
| `OperationText` | PLPO-LTXA1 | PLPO-LTXA1 | copy |  |
| `WorkCenter` | CRHD-ARBPL | CRHD-ARBPL | copy |  |
| `WorkCenterPlant` | CRHD-WERKS | CRHD-WERKS | copy |  |
| `Plant` | PLPO-WERKS | PLPO-WERKS | copy |  |
| `ActivityType` | PLPO-LARNT | PLPO-LARNT | copy |  |
| `PlannedWorkQuantity` | PLPO-ARBEI | PLPO-ARBEI | copy |  |
| `PlannedWorkQuantityUnit` | PLPO-ARBEH | PLPO-ARBEH | copy: reference unit of a quantity - unit of measure customizing is transported, not mapped |  |
| `OperationDuration` | PLPO-DAUNO | PLPO-DAUNO | copy |  |
| `OperationDurationUnit` | PLPO-DAUNE | PLPO-DAUNE | copy: reference unit of a quantity - unit of measure customizing is transported, not mapped |  |
| `NumberOfCapacities` | PLPO-ANZZL | PLPO-ANZZL | copy |  |

## `ZEMX_C_TaskListAllocationMig`

- Source: `ZEMX_I_TaskListObjectAssgmt`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`
- Scope: `_TaskListCurrent.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TaskListType` | EAPL-PLNTY | EAPL-PLNTY | copy |  |
| `TaskListGroup` | EAPL-PLNNR | EAPL-PLNNR | copy |  |
| `TaskListGroupCounter` | EAPL-PLNAL | EAPL-PLNAL | copy |  |
| `Equipment` | EAPL-EQUNR | EAPL-EQUNR | copy |  |
| `FunctionalLocation` | EAPL-TPLNR | EAPL-TPLNR | copy |  |

## `ZEMX_C_TaskListCompMig`

- Source: `ZEMX_I_TaskListComp`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `OperationInternalID`, `AllocationNumber`, `VersionCounter`
- Scope: `src.IsMarkedForDeletion = '' and _Parent.IsMarkedForDeletion = ''`
- Delivery mode: **reference**
- Before posting: Highest recorded counters are provisional, not effective-date resolved. Resolve operation nodes, BOM items and PRT technical IDs to business keys before posting.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TaskListType` | PLMZ-PLNTY | PLMZ-PLNTY | copy |  |
| `TaskListGroup` | PLMZ-PLNNR | PLMZ-PLNNR | copy |  |
| `TaskListGroupCounter` | PLMZ-PLNAL | PLMZ-PLNAL | copy |  |
| `OperationInternalID` | PLMZ-PLNKN | PLMZ-PLNKN | copy |  |
| `VersionCounter` | PLMZ-ZAEHL | PLMZ-ZAEHL | copy |  |
| `AllocationNumber` | PLMZ-ZUONR | PLMZ-ZUONR | copy |  |
| `BOMCategory` | PLMZ-STLTY | PLMZ-STLTY | copy |  |
| `BillOfMaterial` | PLMZ-STLNR | PLMZ-STLNR | copy |  |
| `BOMAlternative` | PLMZ-STLAL | PLMZ-STLAL | copy |  |
| `BOMItemNode` | PLMZ-STLKN | PLMZ-STLKN | copy |  |

## `ZEMX_C_TaskListPRTMig`

- Source: `ZEMX_I_TaskListPRT`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `OperationInternalID`, `PRTItem`, `VersionCounter`
- Scope: `src.IsMarkedForDeletion = '' and _Parent.IsMarkedForDeletion = ''`
- Delivery mode: **reference**
- Before posting: Highest recorded counters are provisional, not effective-date resolved. Resolve operation nodes, BOM items and PRT technical IDs to business keys before posting.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TaskListType` | PLFH-PLNTY | PLFH-PLNTY | copy |  |
| `TaskListGroup` | PLFH-PLNNR | PLFH-PLNNR | copy |  |
| `TaskListGroupCounter` | PLFH-PLNAL | PLFH-PLNAL | copy |  |
| `OperationInternalID` | PLFH-PLNKN | PLFH-PLNKN | copy |  |
| `VersionCounter` | PLFH-ZAEHL | PLFH-ZAEHL | copy |  |
| `PRTItem` | PLFH-PSNFH | PLFH-PSNFH | copy |  |
| `PRTObjectType` | PLFH-OBJTY | PLFH-OBJTY | copy |  |
| `PRTInternalID` | PLFH-OBJID | PLFH-OBJID | copy |  |
| `PRTControlKey` | PLFH-STEUF | PLFH-STEUF | copy |  |

## `ZEMX_C_TaskListPackageMig`

- Source: `ZEMX_I_TaskListPackage`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `OperationInternalID`, `MaintenancePackage`, `VersionCounter`
- Scope: `src.IsMarkedForDeletion = '' and _Parent.IsMarkedForDeletion = ''`
- Delivery mode: **reference**
- Before posting: Highest recorded counters are provisional, not effective-date resolved. Resolve operation nodes, BOM items and PRT technical IDs to business keys before posting.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TaskListType` | PLWP-PLNTY | PLWP-PLNTY | copy |  |
| `TaskListGroup` | PLWP-PLNNR | PLWP-PLNNR | copy |  |
| `TaskListGroupCounter` | PLWP-PLNAL | PLWP-PLNAL | copy |  |
| `OperationInternalID` | PLWP-PLNKN | PLWP-PLNKN | copy |  |
| `VersionCounter` | PLWP-ZAEHL | PLWP-ZAEHL | copy |  |
| `MaintenancePackage` | PLWP-PAKET | PLWP-PAKET | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_TaskListCurrent` | `TaskListVersionCounter` | PLKO-ZAEHL | information only |
| `ZEMX_I_TaskListCurrent` | `MainWorkCenterInternalID` | PLKO-ARBID | not migrated: internal object ID - replaced by MainWorkCenter |
| `ZEMX_I_TaskListCurrent` | `IsMarkedForDeletion` | PLKO-LOEKZ | scope flag |
| `ZEMX_I_TaskListCurrent` | `CreationDate` | PLKO-ANDAT | information only |
| `ZEMX_I_TaskListOperation` | `TaskListOperationInternalId` | PLAS-PLNKN | not migrated: internal node number - regenerated on S/4HANA |
| `ZEMX_I_TaskListOperation` | `TaskListOpAssgmtVersion` | PLAS-ZAEHL | information only |
| `ZEMX_I_TaskListOperation` | `TaskListOpVersionCounter` | PLPO-ZAEHL | information only |
| `ZEMX_I_TaskListOperation` | `WorkCenterInternalID` | PLPO-ARBID | not migrated: internal object ID - replaced by WorkCenter |
| `ZEMX_I_TaskListOperation` | `OpAssignmentIsDeleted` | PLAS-LOEKZ | scope flag |
| `ZEMX_I_TaskListOperation` | `IsMarkedForDeletion` | PLPO-LOEKZ | scope flag |
| `ZEMX_I_TaskListComp` | `IsMarkedForDeletion` | PLMZ-LOEKZ | scope flag |
| `ZEMX_I_TaskListPRT` | `IsMarkedForDeletion` | PLFH-LOEKZ | scope flag |
| `ZEMX_I_TaskListPackage` | `IsMarkedForDeletion` | PLWP-LOEKZ | scope flag |

## Reconciliation

- Counts: `ZEMX_C_TaskListMigCount` (ECC) vs `ZEMT_I_TaskListCount` (S/4HANA) per `TaskListType`, `Plant`
- Records and fields: `ZEMX_C_TaskListMig` vs `ZEMT_I_TaskListCompare` on `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`; compared: `TaskListDesc`, `Plant`, `TaskListUsage`, `TaskListStatus`, `MaintenancePlannerGroup`, `MaintenanceStrategy`

```bash
python3 tools/mig_reconcile.py counts --module task_list --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --module task_list --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- TODO-VERIFY[H] XTL-G02: highest recorded counters are provisional; resolve engineering-change effectivity and operation references at the customer cutover date before loading components, PRTs or packages.
