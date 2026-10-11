# Migration interface: maintenance_order

> Version **1.0.0**

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`, `work_center`, `task_list`, `maintenance_notification`, `maintenance_plan`
- **Business key:** `MaintenanceOrder` · numbering **new**
- **Key rule:** Orders get new numbers on S/4HANA unless external numbering is set up; the load program keeps the old -> new numbers.

> Compatibility note: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEMX_C_MaintOrderMig`

- Source: `ZEMX_I_MaintOrder`
- Keys: `MaintenanceOrder`
- Scope: `src.IsTechnicallyCompleted = '' and src.IsClosed = '' and src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `MaintenanceOrder` | AUFK-AUFNR | AUFK-AUFNR | copy |
| `MaintenanceOrderType` | AUFK-AUART | AUFK-AUART | copy |
| `MaintenanceOrderDesc` | AUFK-KTEXT | AUFK-KTEXT | copy |
| `MaintenanceActivityType` | AFIH-ILART | AFIH-ILART | copy |
| `MaintPriority` | AFIH-PRIOK | AFIH-PRIOK | copy |
| `MaintOrdBasicStartDate` | AFKO-GSTRP | AFKO-GSTRP | copy |
| `MaintOrdBasicEndDate` | AFKO-GLTRP | AFKO-GLTRP | copy |
| `MaintenancePlanningPlant` | AFIH-IWERK | AFIH-IWERK | copy |
| `MaintenancePlannerGroup` | AFIH-INGPR | AFIH-INGPR | copy |
| `MainWorkCenter` | CRHD-ARBPL | CRHD-ARBPL | copy |
| `MainWorkCenterPlant` | CRHD-WERKS | CRHD-WERKS | copy |
| `MaintenancePlant` | ILOA-SWERK | ILOA-SWERK | copy |
| `CompanyCode` | AUFK-BUKRS | AUFK-BUKRS | copy |
| `BusinessArea` | AUFK-GSBER | AUFK-GSBER | copy |
| `ControllingArea` | AUFK-KOKRS | AUFK-KOKRS | copy |
| `ResponsibleCostCenter` | AUFK-KOSTV | AUFK-KOSTV | copy |
| `CostCenter` | ILOA-KOSTL | ILOA-KOSTL | copy |
| `MaintenanceNotification` | AFIH-QMNUM | AFIH-QMNUM | copy |
| `Equipment` | AFIH-EQUNR | AFIH-EQUNR | copy |
| `FunctionalLocation` | ILOA-TPLNR | ILOA-TPLNR | copy |
| `MaintenancePlan` | AFIH-WARPL | AFIH-WARPL | copy |
| `MaintenanceItem` | AFIH-WAPOS | AFIH-WAPOS | copy |
| `MaintObjectSystemCondition` | AFIH-ANLZU | AFIH-ANLZU | copy |
| `TaskListType` | AFKO-PLNTY | AFKO-PLNTY | copy |
| `TaskListGroup` | AFKO-PLNNR | AFKO-PLNNR | copy |
| `TaskListGroupCounter` | AFKO-PLNAL | AFKO-PLNAL | copy |
| `Currency` | AUFK-WAERS | AUFK-WAERS | copy |
| `LastChangeDate` | AUFK-AEDAT | - | information only |

## `ZEMX_C_MaintOrderOperationMig`

- Source: `ZEMX_I_MaintOrderOperation`
- Keys: `MaintenanceOrder`, `MaintenanceOrderOperation`, `MaintenanceOrderSubOperation`
- Scope: `_MaintOrder.IsTechnicallyCompleted = '' and _MaintOrder.IsClosed = '' and _MaintOrder.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `MaintenanceOrder` | AFKO-AUFNR | AFKO-AUFNR | copy |
| `MaintenanceOrderOperation` | AFVC-VORNR | AFVC-VORNR | copy |
| `MaintenanceOrderSubOperation` | AFVC-UVORN | AFVC-UVORN | copy |
| `OperationDescription` | AFVC-LTXA1 | AFVC-LTXA1 | copy |
| `OperationControlKey` | AFVC-STEUS | AFVC-STEUS | copy |
| `WorkCenter` | CRHD-ARBPL | CRHD-ARBPL | copy |
| `WorkCenterPlant` | CRHD-WERKS | CRHD-WERKS | copy |
| `Plant` | AFVC-WERKS | AFVC-WERKS | copy |
| `ActivityType` | AFVC-LARNT | AFVC-LARNT | copy |
| `PlannedWorkQuantity` | AFVV-ARBEI | AFVV-ARBEI | copy |
| `PlannedWorkQuantityUnit` | AFVV-ARBEH | AFVV-ARBEH | copy: reference unit of a quantity - unit of measure customizing is transported, not mapped |
| `OperationDuration` | AFVV-DAUNO | AFVV-DAUNO | copy |
| `OperationDurationUnit` | AFVV-DAUNE | AFVV-DAUNE | copy: reference unit of a quantity - unit of measure customizing is transported, not mapped |

## `ZEMX_C_MaintOrderComponentMig`

- Source: `ZEMX_I_MaintOrderComponent`
- Keys: `MaintenanceOrder`, `ReservationItem`
- Scope: `src.IsMarkedForDeletion = '' and src.IsFinalIssue = '' and _MaintOrder.IsTechnicallyCompleted = '' and _MaintOrder.IsClosed = '' and _MaintOrder.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `MaintenanceOrder` | RESB-AUFNR | RESB-AUFNR | copy |
| `ReservationItem` | RESB-RSPOS | RESB-RSPOS | copy |
| `MaintenanceOrderOperation` | AFVC-VORNR | AFVC-VORNR | copy |
| `BOMItemNumber` | RESB-POSNR | RESB-POSNR | copy |
| `BOMItemCategory` | RESB-POSTP | RESB-POSTP | copy |
| `Material` | RESB-MATNR | RESB-MATNR | copy |
| `Plant` | RESB-WERKS | RESB-WERKS | copy |
| `StorageLocation` | RESB-LGORT | RESB-LGORT | copy |
| `MatlCompRequirementDate` | RESB-BDTER | RESB-BDTER | copy |
| `RequirementQuantityInBaseUnit` | RESB-BDMNG | RESB-BDMNG | copy |
| `WithdrawnQuantity` | RESB-ENMNG | RESB-ENMNG | copy |
| `BaseUnit` | RESB-MEINS | RESB-MEINS | copy: reference unit of a quantity - unit of measure customizing is transported, not mapped |

## `ZEMX_C_OrderSettlementMig`

- Source: `ZEMX_I_OrderSettlement`
- Keys: `ObjectNumber`, `DistributionRuleNumber`, `DistributionRuleGroup`
- Scope: `_Parent.IsClosed = '' and _Parent.IsTechnicallyCompleted = '' and _Parent.IsMarkedForDeletion = ''`
- Delivery mode: **scoped_extract**
- Before posting: Verify fields/keys on the real release; resolve receiver/permit identities and posting requirements in the customer loader.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ObjectNumber` | COBRB-OBJNR | COBRB-OBJNR | copy |
| `DistributionRuleNumber` | COBRB-LFDNR | COBRB-LFDNR | copy |
| `SettlementType` | COBRB-PERBZ | COBRB-PERBZ | copy |
| `ReceiverCategory` | COBRB-KONTY | COBRB-KONTY | copy |
| `SettlementPercentage` | COBRB-PROZS | COBRB-PROZS | copy |
| `SettlementAmount` | COBRB-BETRR | COBRB-BETRR | copy |
| `Currency` | COBRB-BWAER | COBRB-BWAER | copy |
| `ControllingArea` | COBRB-KOKRS | COBRB-KOKRS | copy |
| `CompanyCode` | COBRB-BUKRS | COBRB-BUKRS | copy |
| `ReceiverCostCenter` | COBRB-KOSTL | COBRB-KOSTL | copy |
| `ReceiverOrder` | COBRB-AUFNR | COBRB-AUFNR | copy |
| `ReceiverAsset` | COBRB-ANLN1 | COBRB-ANLN1 | copy |
| `ReceiverAssetSubnumber` | COBRB-ANLN2 | COBRB-ANLN2 | copy |
| `ReceiverWBSInternalID` | COBRB-PSPNR | COBRB-PSPNR | copy |
| `ValidFromYear` | COBRB-GABJA | COBRB-GABJA | copy |
| `ValidFromPeriod` | COBRB-GABPE | COBRB-GABPE | copy |
| `ValidToYear` | COBRB-GBISJ | COBRB-GBISJ | copy |
| `ValidToPeriod` | COBRB-GBISP | COBRB-GBISP | copy |
| `MaintenanceOrder` | AUFK-AUFNR | AUFK-AUFNR | copy |
| `DistributionRuleGroup` | COBRB-BUREG | - | copy |

## `ZEMX_C_OrderPermitMig`

- Source: `ZEMX_I_OrderPermit`
- Keys: `ObjectNumber`, `Permit`
- Scope: `_Parent.IsClosed = '' and _Parent.IsTechnicallyCompleted = '' and _Parent.IsMarkedForDeletion = ''`
- Delivery mode: **scoped_extract**
- Before posting: Verify fields/keys on the real release; resolve receiver/permit identities and posting requirements in the customer loader.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ObjectNumber` | IHSG-OBJNR | IHSG-OBJNR | copy |
| `Permit` | IHSG-PMPS | IHSG-PMPS | copy |
| `MaintenanceOrder` | AUFK-AUFNR | AUFK-AUFNR | copy |

## `ZEMX_C_MaintOrderPartnerMig`

- Source: `ZEMX_I_MaintOrderPartner`
- Keys: `MaintenanceOrder`, `PartnerFunction`, `PartnerCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Resolve partner identities and language-independent partner functions through a supported business interface after the selected master. Preserve partner counters; deleted partner assignments are excluded.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `MaintenanceOrder` | AUFK-AUFNR | - | copy |
| `PartnerFunction` | IHPA-PARVW | - | copy |
| `PartnerCounter` | IHPA-COUNTER | - | copy |
| `Partner` | IHPA-PARNR | - | copy |

## `ZEMX_C_MaintOrderStatusMig`

- Source: `ZEMX_I_MaintOrderStatus`
- Keys: `MaintenanceOrder`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `MaintenanceOrder` | source: MaintenanceOrder | - | copy |
| `StatusCode` | JEST-STAT | - | copy |
| `StatusKind` | source: StatusKind | - | copy |
| `StatusProfile` | JSTO-STSMA | - | copy |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |

## `ZEMX_C_OrderUserStatusMig`

- Source: `ZEMX_I_MaintOrderUserStatus`
- Keys: `MaintenanceOrder`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Map source profile and E* user status codes to configured target profiles/statuses. Apply through a supported post-load business operation; do not replay system statuses or write JEST/JSTO.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `MaintenanceOrder` | source: MaintenanceOrder | - | copy |
| `StatusCode` | JEST-STAT | - | copy |
| `StatusKind` | source: StatusKind | - | copy |
| `StatusProfile` | JSTO-STSMA | - | copy |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |

## `ZEMX_C_OrderLongTextMig`

- Source: `ZEMX_I_OrderLongText`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: SAPscript index only. Populate the explicit full text-key to business-owner link file from the source text editor/application metadata, run the text_scope preparation step against selected masters, then READ_TEXT to retrieve ordered formatted lines. Never infer the business owner from a TDNAME substring or post compressed STXL data.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | - | copy |
| `TextName` | STXH-TDNAME | - | copy |
| `TextID` | STXH-TDID | - | copy |
| `Language` | STXH-TDSPRAS | - | copy |

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

## Source controls

- Source count view: `ZEMX_C_MaintOrderMigCount`

## Open gaps

- Compatibility note: settlement rules and permit assignments are delivered; verify IHSG identity, permit issue/status fields and settlement-profile requirements. Partners use object_partner.
- Compatibility note: open orders with partial confirmations or goods issues need a cut-off decision (complete in ECC or migrate remaining work only)
