# Migration interface: network

> Version **1.0.0**

- **Read by:** Customer-verified business interface; process-reference restrictions apply
- **Load after:** `wbs_element`
- **Business key:** `Network` · numbering **derived**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZPSX_C_NetworkHeaderMig`

- Source: `ZPSX_I_NetworkHeader`
- Keys: `Network`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement. AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Network` | AUFK-AUFNR | customer interface field: Network (unconfirmed) | information only |
| `NetworkType` | AUFK-AUART | customer interface field: NetworkType (unconfirmed) | information only |
| `ControllingArea` | AUFK-KOKRS | customer interface field: ControllingArea (unconfirmed) | information only |
| `CompanyCode` | AUFK-BUKRS | customer interface field: CompanyCode (unconfirmed) | information only |
| `Plant` | AUFK-WERKS | customer interface field: Plant (unconfirmed) | information only |
| `NetworkDescription` | AUFK-KTEXT | customer interface field: NetworkDescription (unconfirmed) | information only |
| `ObjectNumber` | AUFK-OBJNR | customer interface field: ObjectNumber (unconfirmed) | information only |

## `ZPSX_C_NetworkPlanMig`

- Source: `ZPSX_I_NetworkPlan`
- Keys: `Network`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement. AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Network` | AFKO-AUFNR | customer interface field: Network (unconfirmed) | information only |
| `RoutingNumber` | AFKO-AUFPL | customer interface field: RoutingNumber (unconfirmed) | information only |
| `BasicStartDate` | AFKO-GSTRP | customer interface field: BasicStartDate (unconfirmed) | information only |
| `BasicFinishDate` | AFKO-GLTRP | customer interface field: BasicFinishDate (unconfirmed) | information only |

## `ZPSX_C_NetworkActivitMig`

- Source: `ZPSX_I_NetworkActivit`
- Keys: `RoutingNumber`, `OperationInternalID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement. AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `RoutingNumber` | AFVC-AUFPL | customer interface field: RoutingNumber (unconfirmed) | information only |
| `OperationInternalID` | AFVC-APLZL | customer interface field: OperationInternalID (unconfirmed) | information only |
| `Activity` | AFVC-VORNR | customer interface field: Activity (unconfirmed) | information only |
| `Sequence` | AFVC-PLNFL | customer interface field: Sequence (unconfirmed) | information only |
| `WorkCenterInternalID` | AFVC-ARBID | customer interface field: WorkCenterInternalID (unconfirmed) | information only |
| `ControlKey` | AFVC-STEUS | customer interface field: ControlKey (unconfirmed) | information only |
| `ActivityDescription` | AFVC-LTXA1 | customer interface field: ActivityDescription (unconfirmed) | information only |
| `WBSElementInternalID` | AFVC-PROJN | customer interface field: WBSElementInternalID (unconfirmed) | information only |
| `Plant` | AFVC-WERKS | - | copy |

## `ZPSX_C_NetworkQuantitMig`

- Source: `ZPSX_I_NetworkQuantit`
- Keys: `RoutingNumber`, `OperationInternalID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement. AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `RoutingNumber` | AFVV-AUFPL | customer interface field: RoutingNumber (unconfirmed) | information only |
| `OperationInternalID` | AFVV-APLZL | customer interface field: OperationInternalID (unconfirmed) | information only |
| `WorkQuantity` | AFVV-ARBEI | customer interface field: WorkQuantity (unconfirmed) | information only |
| `WorkUnit` | AFVV-ARBEH | customer interface field: WorkUnit (unconfirmed) | information only |
| `Duration` | AFVV-DAUNO | customer interface field: Duration (unconfirmed) | information only |
| `DurationUnit` | AFVV-DAUNE | customer interface field: DurationUnit (unconfirmed) | information only |

## `ZPSX_C_NetworkStatusMig`

- Source: `ZPSX_I_NetworkStatus`
- Keys: `Network`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads. AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Network` | AUFK-AUFNR | - | copy |
| `ObjectNumber` | JEST-OBJNR | - | information only |
| `StatusCode` | JEST-STAT | - | copy |
| `StatusKind` | derived: first character of JEST-STAT | - | copy |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |
| `StatusProfile` | JSTO-STSMA | - | copy |

## `ZPSX_C_NetworkPartnerMig`

- Source: `ZPSX_I_NetworkPartner`
- Keys: `Network`, `PartnerFunction`, `PartnerCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Resolve partner identities and language-independent partner functions through a supported business interface after the selected master. Preserve partner counters; deleted partner assignments are excluded. AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Network` | AUFK-AUFNR | - | copy |
| `PartnerFunction` | IHPA-PARVW | - | copy |
| `PartnerCounter` | IHPA-COUNTER | - | copy |
| `Partner` | IHPA-PARNR | - | copy |

## `ZPSX_C_NetworkUserStatusMig`

- Source: `ZPSX_I_NetworkUserStatus`
- Keys: `Network`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Map source profile and E* user status codes to configured target profiles/statuses. Apply through a supported post-load business operation; do not replay system statuses or write JEST/JSTO. AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Network` | AUFK-AUFNR | - | copy |
| `StatusCode` | JEST-STAT | - | copy |
| `ObjectNumber` | JEST-OBJNR | - | information only |
| `StatusKind` | derived: first character of JEST-STAT | - | copy |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |
| `StatusProfile` | JSTO-STSMA | - | copy |

## `ZPSX_C_NetworkComponentMig`

- Source: `ZPSX_I_NetworkComponent`
- Keys: `Reservation`, `ReservationItem`, `RecordType`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads. AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Reservation` | RESB-RSNUM | - | copy |
| `ReservationItem` | RESB-RSPOS | - | copy |
| `RecordType` | RESB-RSART | - | copy |
| `Network` | RESB-AUFNR | - | copy |
| `Material` | RESB-MATNR | - | copy |
| `Plant` | RESB-WERKS | - | copy |
| `StorageLocation` | RESB-LGORT | - | copy |
| `RequiredQuantity` | RESB-BDMNG | - | copy |
| `Unit` | RESB-MEINS | - | copy |
| `DeletionFlag` | RESB-XLOEK | - | copy |

## `ZPSX_C_NetworkSettleMig`

- Source: `ZPSX_I_NetworkSettle`
- Keys: `ObjectNumber`, `DistributionRuleGroup`, `DistributionRule`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads. AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ObjectNumber` | COBRB-OBJNR | - | information only |
| `DistributionRuleGroup` | COBRB-BUREG | - | copy |
| `DistributionRule` | COBRB-LFDNR | - | copy |
| `SettlementType` | COBRB-PERBZ | - | copy |
| `SettlementPercentage` | COBRB-PROZS | - | copy |
| `ReceiverCostCenter` | COBRB-KOSTL | - | copy |
| `ReceiverOrder` | COBRB-AUFNR | - | copy |
| `ReceiverCategory` | COBRB-KONTY | - | copy |
| `SettlementAmount` | COBRB-BETRR | - | copy |
| `SettlementCurrency` | COBRB-BWAER | - | copy |
| `ControllingArea` | COBRB-KOKRS | - | copy |
| `ReceiverCompanyCode` | COBRB-BUKRS | - | copy |
| `ReceiverMasterAsset` | COBRB-ANLN1 | - | copy |
| `ReceiverAsset` | COBRB-ANLN2 | - | copy |
| `ReceiverWBSInternalID` | COBRB-PSPNR | - | copy |
| `ValidFromFiscalYear` | COBRB-GABJA | - | copy |
| `ValidFromPeriod` | COBRB-GABPE | - | copy |
| `ValidToFiscalYear` | COBRB-GBISJ | - | copy |
| `ValidToPeriod` | COBRB-GBISP | - | copy |

## `ZPSX_C_NetworkLongTextMig`

- Source: `ZPSX_I_NetworkLongText`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: SAPscript index only. Populate the explicit full text-key to business-owner link file from the source text editor/application metadata, run the text_scope preparation step against selected masters, then READ_TEXT to retrieve ordered formatted lines. Never infer the business owner from a TDNAME substring or post compressed STXL data. AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | - | copy |
| `TextName` | STXH-TDNAME | - | copy |
| `TextID` | STXH-TDID | - | copy |
| `Language` | STXH-TDSPRAS | - | copy |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZPSX_B_NetworkStatusData` | `StatusIsInactive` | JEST-INACT | Selection predicate retains only active source statuses. |

## Source controls

- Source count view: `ZPSX_C_NetworkHeaderMigCount`

## Open gaps

- Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.
- AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.
