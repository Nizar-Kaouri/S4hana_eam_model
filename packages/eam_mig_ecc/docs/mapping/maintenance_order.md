# Migration interface: maintenance_order

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`, `work_center`, `task_list`, `maintenance_notification`, `maintenance_plan`
- **Business key:** `MaintenanceOrder` · numbering **new**
- **Key rule:** Orders get new numbers on S/4HANA unless external numbering is set up; the load program keeps the old -> new numbers.

> TODO-VERIFY[M] XOR-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEMX_C_MaintOrderMig`

- Source: `ZEMX_I_MaintOrder`
- Keys: `MaintenanceOrder`
- Scope: `src.IsTechnicallyCompleted = '' and src.IsClosed = '' and src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenanceOrder` | AUFK-AUFNR | AUFK-AUFNR | copy | yes |
| `MaintenanceOrderType` | AUFK-AUART | AUFK-AUART | copy | yes |
| `MaintenanceOrderDesc` | AUFK-KTEXT | AUFK-KTEXT | copy |  |
| `MaintenanceActivityType` | AFIH-ILART | AFIH-ILART | copy | yes |
| `MaintPriority` | AFIH-PRIOK | AFIH-PRIOK | copy | yes |
| `MaintOrdBasicStartDate` | AFKO-GSTRP | AFKO-GSTRP | copy | yes |
| `MaintOrdBasicEndDate` | AFKO-GLTRP | AFKO-GLTRP | copy | yes |
| `MaintenancePlanningPlant` | AFIH-IWERK | AFIH-IWERK | copy | yes |
| `MaintenancePlannerGroup` | AFIH-INGPR | AFIH-INGPR | copy |  |
| `MainWorkCenter` | CRHD-ARBPL | CRHD-ARBPL | copy | yes |
| `MainWorkCenterPlant` | CRHD-WERKS | CRHD-WERKS | copy |  |
| `MaintenancePlant` | ILOA-SWERK | ILOA-SWERK | copy |  |
| `CompanyCode` | AUFK-BUKRS | AUFK-BUKRS | copy |  |
| `BusinessArea` | AUFK-GSBER | AUFK-GSBER | copy |  |
| `ControllingArea` | AUFK-KOKRS | AUFK-KOKRS | copy |  |
| `ResponsibleCostCenter` | AUFK-KOSTV | AUFK-KOSTV | copy |  |
| `CostCenter` | ILOA-KOSTL | ILOA-KOSTL | copy | yes |
| `MaintenanceNotification` | AFIH-QMNUM | AFIH-QMNUM | copy |  |
| `Equipment` | AFIH-EQUNR | AFIH-EQUNR | copy | yes |
| `FunctionalLocation` | ILOA-TPLNR | ILOA-TPLNR | copy | yes |
| `MaintenancePlan` | AFIH-WARPL | AFIH-WARPL | copy |  |
| `MaintenanceItem` | AFIH-WAPOS | AFIH-WAPOS | copy |  |
| `MaintObjectSystemCondition` | AFIH-ANLZU | AFIH-ANLZU | copy |  |
| `TaskListType` | AFKO-PLNTY | AFKO-PLNTY | copy |  |
| `TaskListGroup` | AFKO-PLNNR | AFKO-PLNNR | copy |  |
| `TaskListGroupCounter` | AFKO-PLNAL | AFKO-PLNAL | copy |  |
| `Currency` | AUFK-WAERS | AUFK-WAERS | copy |  |
| `LastChangeDate` | AUFK-AEDAT | - | information only |  |

## `ZEMX_C_MaintOrderOperationMig`

- Source: `ZEMX_I_MaintOrderOperation`
- Keys: `MaintenanceOrder`, `MaintenanceOrderOperation`, `MaintenanceOrderSubOperation`
- Scope: `_MaintOrder.IsTechnicallyCompleted = '' and _MaintOrder.IsClosed = '' and _MaintOrder.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenanceOrder` | AFKO-AUFNR | AFKO-AUFNR | copy |  |
| `MaintenanceOrderOperation` | AFVC-VORNR | AFVC-VORNR | copy |  |
| `MaintenanceOrderSubOperation` | AFVC-UVORN | AFVC-UVORN | copy |  |
| `OperationDescription` | AFVC-LTXA1 | AFVC-LTXA1 | copy |  |
| `OperationControlKey` | AFVC-STEUS | AFVC-STEUS | copy |  |
| `WorkCenter` | CRHD-ARBPL | CRHD-ARBPL | copy |  |
| `WorkCenterPlant` | CRHD-WERKS | CRHD-WERKS | copy |  |
| `Plant` | AFVC-WERKS | AFVC-WERKS | copy |  |
| `ActivityType` | AFVC-LARNT | AFVC-LARNT | copy |  |
| `PlannedWorkQuantity` | AFVV-ARBEI | AFVV-ARBEI | copy |  |
| `PlannedWorkQuantityUnit` | AFVV-ARBEH | AFVV-ARBEH | copy: reference unit of a quantity - unit of measure customizing is transported, not mapped |  |
| `OperationDuration` | AFVV-DAUNO | AFVV-DAUNO | copy |  |
| `OperationDurationUnit` | AFVV-DAUNE | AFVV-DAUNE | copy: reference unit of a quantity - unit of measure customizing is transported, not mapped |  |

## `ZEMX_C_MaintOrderComponentMig`

- Source: `ZEMX_I_MaintOrderComponent`
- Keys: `MaintenanceOrder`, `ReservationItem`
- Scope: `src.IsMarkedForDeletion = '' and src.IsFinalIssue = '' and _MaintOrder.IsTechnicallyCompleted = '' and _MaintOrder.IsClosed = '' and _MaintOrder.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `MaintenanceOrder` | RESB-AUFNR | RESB-AUFNR | copy |  |
| `ReservationItem` | RESB-RSPOS | RESB-RSPOS | copy |  |
| `MaintenanceOrderOperation` | AFVC-VORNR | AFVC-VORNR | copy |  |
| `BOMItemNumber` | RESB-POSNR | RESB-POSNR | copy |  |
| `BOMItemCategory` | RESB-POSTP | RESB-POSTP | copy |  |
| `Material` | RESB-MATNR | RESB-MATNR | copy |  |
| `Plant` | RESB-WERKS | RESB-WERKS | copy |  |
| `StorageLocation` | RESB-LGORT | RESB-LGORT | copy |  |
| `MatlCompRequirementDate` | RESB-BDTER | RESB-BDTER | copy |  |
| `RequirementQuantityInBaseUnit` | RESB-BDMNG | RESB-BDMNG | copy |  |
| `WithdrawnQuantity` | RESB-ENMNG | RESB-ENMNG | copy |  |
| `BaseUnit` | RESB-MEINS | RESB-MEINS | copy: reference unit of a quantity - unit of measure customizing is transported, not mapped |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_MaintOrder` | `OrderRoutingNumber` | AFKO-AUFPL | not migrated: internal routing number - regenerated on S/4HANA |
| `ZEMX_I_MaintOrder` | `ObjectNumber` | AUFK-OBJNR | not migrated: status object number - regenerated on S/4HANA |
| `ZEMX_I_MaintOrder` | `IsTechnicallyCompleted` | derived: case ord._TechCompletedFlag.StatusCode when 'I0045' then 'X' else '' end from JEST-STAT | scope flag |
| `ZEMX_I_MaintOrder` | `IsClosed` | derived: case ord._ClosedFlag.StatusCode when 'I0046' then 'X' else '' end from JEST-STAT | scope flag |
| `ZEMX_I_MaintOrder` | `IsMarkedForDeletion` | derived: case ord._DeletionFlag.StatusCode when 'I0076' then 'X' else '' end from JEST-STAT | scope flag |
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

## Reconciliation

- Counts: `ZEMX_C_MaintOrderMigCount` (ECC) vs `ZEMT_I_MaintOrderCount` (S/4HANA) per `MaintenanceOrderType`, `MaintenancePlanningPlant`
- Records and fields: `ZEMX_C_MaintOrderMig` vs `ZEMT_I_MaintOrderCompare` on `MaintenanceOrder`; compared: `MaintenanceOrderType`, `MaintenanceActivityType`, `MaintPriority`, `MaintOrdBasicStartDate`, `MaintOrdBasicEndDate`, `MaintenancePlanningPlant`, `MainWorkCenter`, `CostCenter`, `Equipment`, `FunctionalLocation`

```bash
python3 tools/mig_reconcile.py counts --module maintenance_order --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --module maintenance_order --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- TODO-VERIFY[H] XOR-G01: settlement rules (COBRA/COBRB), partner and permit data are not extracted in the pilot
- TODO-VERIFY[H] XOR-G02: open orders with partial confirmations or goods issues need a cut-off decision (complete in ECC or migrate remaining work only)
