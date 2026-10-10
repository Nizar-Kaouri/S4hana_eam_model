# Migration interface: maintenance_order

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`, `work_center`, `task_list`, `maintenance_notification`, `maintenance_plan`
- **Business key:** `MaintenanceOrder` · numbering **new**
- **Key rule:** Orders get new numbers on S/4HANA unless external numbering is set up; the load program writes old -> new into the key map 'MAINTENANCE_ORDER'.

> TODO-VERIFY[M] XOR-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

Values are delivered **translated**: every field marked *value map* / *key map* is looked up in the mapping table `ZEMX_MAP` (map name in capitals); without an entry the old value is delivered. `Legacy*` key fields carry the old key of the record.

## `ZEMX_C_MaintOrderMig`

- Source: `ZEMX_I_MaintOrder`
- Keys: `LegacyMaintenanceOrder`
- Scope: `src.IsTechnicallyCompleted = '' and src.IsClosed = '' and src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenanceOrder` | AUFK-AUFNR | AUFK-AUFNR | key map: `MAINTENANCE_ORDER` | yes |
| `MaintenanceOrderType` | AUFK-AUART | AUFK-AUART | value map: `ORDER_TYPE` | yes |
| `MaintenanceOrderDesc` | AUFK-KTEXT | AUFK-KTEXT | copy |  |
| `MaintenanceActivityType` | AFIH-ILART | AFIH-ILART | value map: `ACTIVITY_TYPE_PM` | yes |
| `MaintPriority` | AFIH-PRIOK | AFIH-PRIOK | value map: `PRIORITY` | yes |
| `MaintOrdBasicStartDate` | AFKO-GSTRP | AFKO-GSTRP | copy | yes |
| `MaintOrdBasicEndDate` | AFKO-GLTRP | AFKO-GLTRP | copy | yes |
| `MaintenancePlanningPlant` | AFIH-IWERK | AFIH-IWERK | value map: `PLANT` | yes |
| `MaintenancePlannerGroup` | AFIH-INGPR | AFIH-INGPR | value map: `PLANNER_GROUP` |  |
| `MainWorkCenter` | CRHD-ARBPL | CRHD-ARBPL | key map: `WORK_CENTER` | yes |
| `MainWorkCenterPlant` | CRHD-WERKS | CRHD-WERKS | value map: `PLANT` |  |
| `MaintenancePlant` | ILOA-SWERK | ILOA-SWERK | value map: `PLANT` |  |
| `CompanyCode` | AUFK-BUKRS | AUFK-BUKRS | value map: `COMPANY_CODE` |  |
| `BusinessArea` | AUFK-GSBER | AUFK-GSBER | value map: `BUSINESS_AREA` |  |
| `ControllingArea` | AUFK-KOKRS | AUFK-KOKRS | value map: `CONTROLLING_AREA` |  |
| `ResponsibleCostCenter` | AUFK-KOSTV | AUFK-KOSTV | value map: `COST_CENTER` |  |
| `CostCenter` | ILOA-KOSTL | ILOA-KOSTL | value map: `COST_CENTER` | yes |
| `MaintenanceNotification` | AFIH-QMNUM | AFIH-QMNUM | key map: `MAINTENANCE_NOTIFICATION` |  |
| `Equipment` | AFIH-EQUNR | AFIH-EQUNR | key map: `EQUIPMENT` | yes |
| `FunctionalLocation` | ILOA-TPLNR | ILOA-TPLNR | key map: `FUNCTIONAL_LOCATION` | yes |
| `MaintenancePlan` | AFIH-WARPL | AFIH-WARPL | key map: `MAINTENANCE_PLAN` |  |
| `MaintenanceItem` | AFIH-WAPOS | AFIH-WAPOS | key map: `MAINTENANCE_ITEM` |  |
| `MaintObjectSystemCondition` | AFIH-ANLZU | AFIH-ANLZU | copy |  |
| `TaskListType` | AFKO-PLNTY | AFKO-PLNTY | copy |  |
| `TaskListGroup` | AFKO-PLNNR | AFKO-PLNNR | key map: `TASK_LIST_GROUP` |  |
| `TaskListGroupCounter` | AFKO-PLNAL | AFKO-PLNAL | copy |  |
| `Currency` | AUFK-WAERS | AUFK-WAERS | copy |  |
| `LastChangeDate` | AUFK-AEDAT | - | information only |  |

## `ZEMX_C_MaintOrderOperationMig`

- Source: `ZEMX_I_MaintOrderOperation`
- Keys: `LegacyMaintenanceOrder`, `MaintenanceOrderOperation`, `MaintenanceOrderSubOperation`
- Scope: `obj.IsTechnicallyCompleted = '' and obj.IsClosed = '' and obj.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenanceOrderOperation` | AFVC-VORNR | AFVC-VORNR | copy |  |
| `MaintenanceOrderSubOperation` | AFVC-UVORN | AFVC-UVORN | copy |  |
| `MaintenanceOrder` | AFKO-AUFNR | AFKO-AUFNR | key map: `MAINTENANCE_ORDER` |  |
| `OperationDescription` | AFVC-LTXA1 | AFVC-LTXA1 | copy |  |
| `OperationControlKey` | AFVC-STEUS | AFVC-STEUS | value map: `CONTROL_KEY` |  |
| `WorkCenter` | CRHD-ARBPL | CRHD-ARBPL | key map: `WORK_CENTER` |  |
| `WorkCenterPlant` | CRHD-WERKS | CRHD-WERKS | value map: `PLANT` |  |
| `Plant` | AFVC-WERKS | AFVC-WERKS | value map: `PLANT` |  |
| `ActivityType` | AFVC-LARNT | AFVC-LARNT | value map: `ACTIVITY_TYPE` |  |
| `PlannedWorkQuantity` | AFVV-ARBEI | AFVV-ARBEI | copy |  |
| `PlannedWorkQuantityUnit` | AFVV-ARBEH | AFVV-ARBEH | copy: reference unit of a quantity - unit of measure customizing is transported, not mapped |  |
| `OperationDuration` | AFVV-DAUNO | AFVV-DAUNO | copy |  |
| `OperationDurationUnit` | AFVV-DAUNE | AFVV-DAUNE | copy: reference unit of a quantity - unit of measure customizing is transported, not mapped |  |

## `ZEMX_C_MaintOrderComponentMig`

- Source: `ZEMX_I_MaintOrderComponent`
- Keys: `LegacyMaintenanceOrder`, `ReservationItem`
- Scope: `src.IsMarkedForDeletion = '' and src.IsFinalIssue = '' and obj.IsTechnicallyCompleted = '' and obj.IsClosed = '' and obj.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ReservationItem` | RESB-RSPOS | RESB-RSPOS | copy |  |
| `MaintenanceOrder` | RESB-AUFNR | RESB-AUFNR | key map: `MAINTENANCE_ORDER` |  |
| `MaintenanceOrderOperation` | AFVC-VORNR | AFVC-VORNR | copy |  |
| `BOMItemNumber` | RESB-POSNR | RESB-POSNR | copy |  |
| `BOMItemCategory` | RESB-POSTP | RESB-POSTP | value map: `ITEM_CATEGORY` |  |
| `Material` | RESB-MATNR | RESB-MATNR | key map: `MATERIAL` |  |
| `Plant` | RESB-WERKS | RESB-WERKS | value map: `PLANT` |  |
| `StorageLocation` | RESB-LGORT | RESB-LGORT | value map: `STORAGE_LOCATION` |  |
| `MatlCompRequirementDate` | RESB-BDTER | RESB-BDTER | copy |  |
| `RequirementQuantityInBaseUnit` | RESB-BDMNG | RESB-BDMNG | copy |  |
| `WithdrawnQuantity` | RESB-ENMNG | RESB-ENMNG | copy |  |
| `BaseUnit` | RESB-MEINS | RESB-MEINS | copy: reference unit of a quantity - unit of measure customizing is transported, not mapped |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_MaintOrder` | `OrderRoutingNumber` | AFKO-AUFPL | not migrated: internal routing number - regenerated on S/4HANA |
| `ZEMX_I_MaintOrder` | `ObjectNumber` | AUFK-OBJNR | not migrated: status object number - regenerated on S/4HANA |
| `ZEMX_I_MaintOrder` | `IsTechnicallyCompleted` | derived: case teco.StatusCode when 'I0045' then 'X' else '' end from JEST-STAT | scope flag |
| `ZEMX_I_MaintOrder` | `IsClosed` | derived: case clsd.StatusCode when 'I0046' then 'X' else '' end from JEST-STAT | scope flag |
| `ZEMX_I_MaintOrder` | `IsMarkedForDeletion` | derived: case dlfl.StatusCode when 'I0076' then 'X' else '' end from JEST-STAT | scope flag |
| `ZEMX_I_MaintOrder` | `CreationDate` | AUFK-ERDAT | information only |
| `ZEMX_I_MaintOrder` | `CreatedByUser` | AUFK-ERNAM | information only |
| `ZEMX_I_MaintOrderOperation` | `OrderOperationInternalID` | AFVC-APLZL | not migrated: internal counter - regenerated on S/4HANA |
| `ZEMX_I_MaintOrderOperation` | `OrderRoutingNumber` | AFVC-AUFPL | not migrated: internal routing number |
| `ZEMX_I_MaintOrderOperation` | `WorkCenterInternalID` | AFVC-ARBID | not migrated: internal object ID - replaced by WorkCenter |
| `ZEMX_I_MaintOrderOperation` | `ObjectNumber` | AFVC-OBJNR | not migrated: status object number - regenerated on S/4HANA |
| `ZEMX_I_MaintOrderComponent` | `Reservation` | RESB-RSNUM | not migrated: new reservation numbers on S/4HANA |
| `ZEMX_I_MaintOrderComponent` | `ReservationRecordType` | RESB-RSART | information only |
| `ZEMX_I_MaintOrderComponent` | `OrderRoutingNumber` | RESB-AUFPL | not migrated: internal routing number |
| `ZEMX_I_MaintOrderComponent` | `OrderOperationInternalID` | RESB-APLZL | not migrated: internal counter - replaced by MaintenanceOrderOperation |
| `ZEMX_I_MaintOrderComponent` | `IsMarkedForDeletion` | RESB-XLOEK | scope flag |
| `ZEMX_I_MaintOrderComponent` | `IsFinalIssue` | RESB-KZEAR | scope flag |

## Maps

- value map `ACTIVITY_TYPE`
- value map `ACTIVITY_TYPE_PM`
- value map `BUSINESS_AREA`
- value map `COMPANY_CODE`
- value map `CONTROL_KEY`
- value map `CONTROLLING_AREA`
- value map `COST_CENTER`
- value map `ITEM_CATEGORY`
- value map `ORDER_TYPE`
- value map `PLANNER_GROUP`
- value map `PLANT`
- value map `PRIORITY`
- value map `STORAGE_LOCATION`
- key map `EQUIPMENT`
- key map `FUNCTIONAL_LOCATION`
- key map `MAINTENANCE_ITEM`
- key map `MAINTENANCE_NOTIFICATION`
- key map `MAINTENANCE_ORDER`
- key map `MAINTENANCE_PLAN`
- key map `MATERIAL` (from another migration)
- key map `TASK_LIST_GROUP`
- key map `WORK_CENTER`

After loading this object, the key map(s) `MAINTENANCE_ORDER` (old key, new key from the load log) must be written into `ZEMX_MAP` on the ECC system (by the load program via RFC or by uploading the load log) before the objects that use them are extracted.

## Reconciliation

- Counts: `ZEMX_C_MaintOrderMigCount` (ECC, translated values) vs `ZEMT_I_MaintOrderCount` (S/4HANA) per `MaintenanceOrderType`, `MaintenancePlanningPlant`
- Records and fields: `ZEMX_C_MaintOrderMig` vs `ZEMT_I_MaintOrderCompare` on `MaintenanceOrder`; compared: `MaintenanceOrderType`, `MaintenanceActivityType`, `MaintPriority`, `MaintOrdBasicStartDate`, `MaintOrdBasicEndDate`, `MaintenancePlanningPlant`, `MainWorkCenter`, `CostCenter`, `Equipment`, `FunctionalLocation`

```bash
python3 tools/mig_reconcile.py counts --module maintenance_order --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --module maintenance_order --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- TODO-VERIFY[H] XOR-G01: settlement rules (COBRA/COBRB), partner and permit data are not extracted in the pilot
- TODO-VERIFY[H] XOR-G02: open orders with partial confirmations or goods issues need a cut-off decision (complete in ECC or migrate remaining work only)
