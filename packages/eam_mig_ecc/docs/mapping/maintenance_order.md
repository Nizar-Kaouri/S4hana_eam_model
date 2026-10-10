# Mapping: maintenance_order

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Target:** SAP S/4HANA Migration Cockpit - migration object *Maintenance order*
- **Load after:** `equipment`, `functional_location`, `work_center`, `task_list`, `maintenance_notification`, `maintenance_plan`
- **Business key:** `MaintenanceOrder` · numbering **new**
- **Key rule:** Orders get new numbers on S/4HANA unless external numbering is set up; keep the key map 'maintenance_order' (old,new).
- **Scope filter:** `IsTechnicallyCompleted = '' and IsClosed = '' and IsMarkedForDeletion = ''` - Only open orders are migrated, as released or created orders without actual costs (actual costs, confirmations and goods movements stay in the old system / FI-CO migration).

> TODO-VERIFY[H] XOR-M01: Migration Cockpit object for 'Maintenance order' (name, approach staging tables / direct transfer) and its structure field names; targets below are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance

## Fields

| View | Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|---|
| `ZEMX_I_MaintOrder` | `MaintenanceOrder` | AUFK-AUFNR | AUFK-AUFNR | key map: `maintenance_order` | yes |
| `ZEMX_I_MaintOrder` | `MaintenanceOrderType` | AUFK-AUART | AUFK-AUART | value map: `order_type` | yes |
| `ZEMX_I_MaintOrder` | `MaintenanceOrderDesc` | AUFK-KTEXT | AUFK-KTEXT | copy |  |
| `ZEMX_I_MaintOrder` | `MaintenanceActivityType` | AFIH-ILART | AFIH-ILART | value map: `activity_type_pm` | yes |
| `ZEMX_I_MaintOrder` | `MaintPriority` | AFIH-PRIOK | AFIH-PRIOK | value map: `priority` | yes |
| `ZEMX_I_MaintOrder` | `MaintOrdBasicStartDate` | AFKO-GSTRP | AFKO-GSTRP | copy | yes |
| `ZEMX_I_MaintOrder` | `MaintOrdBasicEndDate` | AFKO-GLTRP | AFKO-GLTRP | copy | yes |
| `ZEMX_I_MaintOrder` | `MaintenancePlanningPlant` | AFIH-IWERK | AFIH-IWERK | value map: `plant` | yes |
| `ZEMX_I_MaintOrder` | `MaintenancePlannerGroup` | AFIH-INGPR | AFIH-INGPR | value map: `planner_group` |  |
| `ZEMX_I_MaintOrder` | `MainWorkCenter` | CRHD-ARBPL | AFIH-GEWRK (via work center) | key map: `work_center` | yes |
| `ZEMX_I_MaintOrder` | `MainWorkCenterPlant` | CRHD-WERKS | AFIH-GEWRK (via work center) | value map: `plant` |  |
| `ZEMX_I_MaintOrder` | `MaintenancePlant` | ILOA-SWERK | ILOA-SWERK | value map: `plant` |  |
| `ZEMX_I_MaintOrder` | `CompanyCode` | AUFK-BUKRS | AUFK-BUKRS | value map: `company_code` |  |
| `ZEMX_I_MaintOrder` | `BusinessArea` | AUFK-GSBER | AUFK-GSBER | value map: `business_area` |  |
| `ZEMX_I_MaintOrder` | `ControllingArea` | AUFK-KOKRS | AUFK-KOKRS | value map: `controlling_area` |  |
| `ZEMX_I_MaintOrder` | `ResponsibleCostCenter` | AUFK-KOSTV | AUFK-KOSTV | value map: `cost_center` |  |
| `ZEMX_I_MaintOrder` | `CostCenter` | ILOA-KOSTL | ILOA-KOSTL | value map: `cost_center` | yes |
| `ZEMX_I_MaintOrder` | `MaintenanceNotification` | AFIH-QMNUM | AFIH-QMNUM | key map: `maintenance_notification` |  |
| `ZEMX_I_MaintOrder` | `Equipment` | AFIH-EQUNR | AFIH-EQUNR | key map: `equipment` | yes |
| `ZEMX_I_MaintOrder` | `FunctionalLocation` | ILOA-TPLNR | ILOA-TPLNR | key map: `functional_location` | yes |
| `ZEMX_I_MaintOrder` | `MaintenancePlan` | AFIH-WARPL | AFIH-WARPL | key map: `maintenance_plan` |  |
| `ZEMX_I_MaintOrder` | `MaintenanceItem` | AFIH-WAPOS | AFIH-WAPOS | key map: `maintenance_item` |  |
| `ZEMX_I_MaintOrder` | `MaintObjectSystemCondition` | AFIH-ANLZU | AFIH-ANLZU | copy |  |
| `ZEMX_I_MaintOrder` | `OrderRoutingNumber` | AFKO-AUFPL | - | not migrated: internal routing number - regenerated on S/4HANA; joins operations and components |  |
| `ZEMX_I_MaintOrder` | `TaskListType` | AFKO-PLNTY | AFKO-PLNTY | copy |  |
| `ZEMX_I_MaintOrder` | `TaskListGroup` | AFKO-PLNNR | AFKO-PLNNR | key map: `task_list_group` |  |
| `ZEMX_I_MaintOrder` | `TaskListGroupCounter` | AFKO-PLNAL | AFKO-PLNAL | copy |  |
| `ZEMX_I_MaintOrder` | `Currency` | AUFK-WAERS | AUFK-WAERS | copy |  |
| `ZEMX_I_MaintOrder` | `ObjectNumber` | AUFK-OBJNR | - | not migrated: status object number - regenerated on S/4HANA |  |
| `ZEMX_I_MaintOrder` | `IsTechnicallyCompleted` | case teco.stat when 'I0045' then 'X' else '' end | - | scope filter |  |
| `ZEMX_I_MaintOrder` | `IsClosed` | case clsd.stat when 'I0046' then 'X' else '' end | - | scope filter |  |
| `ZEMX_I_MaintOrder` | `IsMarkedForDeletion` | case dlfl.stat when 'I0076' then 'X' else '' end | - | scope filter |  |
| `ZEMX_I_MaintOrder` | `CreationDate` | AUFK-ERDAT | - | information only |  |
| `ZEMX_I_MaintOrder` | `CreatedByUser` | AUFK-ERNAM | - | information only |  |
| `ZEMX_I_MaintOrder` | `LastChangeDate` | AUFK-AEDAT | - | information only |  |
| `ZEMX_I_MaintOrderOperation` | `MaintenanceOrder` | AFKO-AUFNR | AFKO-AUFNR | key map: `maintenance_order` |  |
| `ZEMX_I_MaintOrderOperation` | `OrderOperationInternalID` | AFVC-APLZL | - | not migrated: internal counter - regenerated on S/4HANA |  |
| `ZEMX_I_MaintOrderOperation` | `OrderRoutingNumber` | AFVC-AUFPL | - | not migrated: internal routing number |  |
| `ZEMX_I_MaintOrderOperation` | `MaintenanceOrderOperation` | AFVC-VORNR | AFVC-VORNR | copy |  |
| `ZEMX_I_MaintOrderOperation` | `MaintenanceOrderSubOperation` | AFVC-UVORN | AFVC-UVORN | copy |  |
| `ZEMX_I_MaintOrderOperation` | `OperationDescription` | AFVC-LTXA1 | AFVC-LTXA1 | copy |  |
| `ZEMX_I_MaintOrderOperation` | `OperationControlKey` | AFVC-STEUS | AFVC-STEUS | value map: `control_key` |  |
| `ZEMX_I_MaintOrderOperation` | `WorkCenter` | CRHD-ARBPL | AFVC-ARBID (via work center) | key map: `work_center` |  |
| `ZEMX_I_MaintOrderOperation` | `WorkCenterPlant` | CRHD-WERKS | AFVC-ARBID (via work center) | value map: `plant` |  |
| `ZEMX_I_MaintOrderOperation` | `Plant` | AFVC-WERKS | AFVC-WERKS | value map: `plant` |  |
| `ZEMX_I_MaintOrderOperation` | `ActivityType` | AFVC-LARNT | AFVC-LARNT | value map: `activity_type` |  |
| `ZEMX_I_MaintOrderOperation` | `PlannedWorkQuantity` | AFVV-ARBEI | AFVV-ARBEI | copy |  |
| `ZEMX_I_MaintOrderOperation` | `PlannedWorkQuantityUnit` | AFVV-ARBEH | AFVV-ARBEH | value map: `unit_of_measure` |  |
| `ZEMX_I_MaintOrderOperation` | `OperationDuration` | AFVV-DAUNO | AFVV-DAUNO | copy |  |
| `ZEMX_I_MaintOrderOperation` | `OperationDurationUnit` | AFVV-DAUNE | AFVV-DAUNE | value map: `unit_of_measure` |  |
| `ZEMX_I_MaintOrderOperation` | `ObjectNumber` | AFVC-OBJNR | - | not migrated: status object number - regenerated on S/4HANA |  |
| `ZEMX_I_MaintOrderComponent` | `Reservation` | RESB-RSNUM | - | not migrated: new reservation numbers on S/4HANA |  |
| `ZEMX_I_MaintOrderComponent` | `ReservationItem` | RESB-RSPOS | - | not migrated: new reservation numbers on S/4HANA |  |
| `ZEMX_I_MaintOrderComponent` | `ReservationRecordType` | RESB-RSART | - | information only |  |
| `ZEMX_I_MaintOrderComponent` | `MaintenanceOrder` | RESB-AUFNR | RESB-AUFNR | key map: `maintenance_order` |  |
| `ZEMX_I_MaintOrderComponent` | `OrderRoutingNumber` | RESB-AUFPL | - | not migrated: internal routing number |  |
| `ZEMX_I_MaintOrderComponent` | `OrderOperationInternalID` | RESB-APLZL | RESB-APLZL | derive: operation number via ZEMX_I_MaintOrderOperation |  |
| `ZEMX_I_MaintOrderComponent` | `BOMItemNumber` | RESB-POSNR | RESB-POSNR | copy |  |
| `ZEMX_I_MaintOrderComponent` | `BOMItemCategory` | RESB-POSTP | RESB-POSTP | value map: `item_category` |  |
| `ZEMX_I_MaintOrderComponent` | `Material` | RESB-MATNR | RESB-MATNR | convert: `material_number` |  |
| `ZEMX_I_MaintOrderComponent` | `Plant` | RESB-WERKS | RESB-WERKS | value map: `plant` |  |
| `ZEMX_I_MaintOrderComponent` | `StorageLocation` | RESB-LGORT | RESB-LGORT | value map: `storage_location` |  |
| `ZEMX_I_MaintOrderComponent` | `MatlCompRequirementDate` | RESB-BDTER | RESB-BDTER | copy |  |
| `ZEMX_I_MaintOrderComponent` | `RequirementQuantityInBaseUnit` | RESB-BDMNG | RESB-BDMNG | copy |  |
| `ZEMX_I_MaintOrderComponent` | `WithdrawnQuantity` | RESB-ENMNG | RESB-ENMNG | copy |  |
| `ZEMX_I_MaintOrderComponent` | `BaseUnit` | RESB-MEINS | RESB-MEINS | value map: `unit_of_measure` |  |
| `ZEMX_I_MaintOrderComponent` | `IsMarkedForDeletion` | RESB-XLOEK | - | scope filter |  |
| `ZEMX_I_MaintOrderComponent` | `IsFinalIssue` | RESB-KZEAR | - | scope filter |  |

## Value maps and key maps

Templates: `docs/mapping/templates/` (columns `source,target,comment`). An empty map means "same value on S/4HANA".

- value map `activity_type`
- value map `activity_type_pm`
- value map `business_area`
- value map `company_code`
- value map `control_key`
- value map `controlling_area`
- value map `cost_center`
- value map `item_category`
- value map `order_type`
- value map `planner_group`
- value map `plant`
- value map `priority`
- value map `storage_location`
- value map `unit_of_measure`
- key map `equipment`
- key map `functional_location`
- key map `maintenance_item`
- key map `maintenance_notification`
- key map `maintenance_order`
- key map `maintenance_plan`
- key map `task_list_group`
- key map `work_center`

This object's load provides the key map(s) `maintenance_order` (old key, new key from the load log).

## Reconciliation

- Counts: `ZEMX_R_MaintOrderCount` (ECC) vs `ZEMT_R_MaintOrderCount` (S/4HANA) per `MaintenanceOrderType` (value map `order_type`), `MaintenancePlanningPlant` (value map `plant`)
- Records and fields: `ZEMX_I_MaintOrder` vs `ZEMT_I_MaintOrderCompare` on `MaintenanceOrder` (key map `maintenance_order`); compared fields: `MaintenanceOrderType`, `MaintenanceActivityType`, `MaintPriority`, `MaintOrdBasicStartDate`, `MaintOrdBasicEndDate`, `MaintenancePlanningPlant`, `MainWorkCenter`, `CostCenter`, `Equipment`, `FunctionalLocation`

```bash
python3 tools/mig_reconcile.py counts --module maintenance_order --source ecc_counts.csv --target s4_counts.csv --maps <folder>
python3 tools/mig_reconcile.py records --module maintenance_order --source ecc_extract.csv --target s4_compare.csv --maps <folder>
```

## Open gaps

- TODO-VERIFY[H] XOR-G01: settlement rules (COBRA/COBRB), partner and permit data are not extracted in the pilot
- TODO-VERIFY[H] XOR-G02: open orders with partial confirmations or goods issues need a cut-off decision (complete in ECC or migrate remaining work only)
