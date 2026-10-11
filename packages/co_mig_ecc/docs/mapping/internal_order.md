# Migration interface: internal_order

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** `cost_center`, `profit_center`
- **Business key:** `InternalOrder` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZCOX_C_InternalOrderMig`

- Source: `ZCOX_I_InternalOrder`
- Keys: `InternalOrder`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `InternalOrder` | AUFK-AUFNR | customer interface field: InternalOrder (unconfirmed) | copy |
| `InternalOrderType` | AUFK-AUART | customer interface field: InternalOrderType (unconfirmed) | copy |
| `OrderCategory` | AUFK-AUTYP | customer interface field: OrderCategory (unconfirmed) | copy |
| `InternalOrderDescription` | AUFK-KTEXT | customer interface field: InternalOrderDescription (unconfirmed) | copy |
| `CompanyCode` | AUFK-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy |
| `ControllingArea` | AUFK-KOKRS | customer interface field: ControllingArea (unconfirmed) | copy |
| `ResponsibleCostCenter` | AUFK-KOSTV | customer interface field: ResponsibleCostCenter (unconfirmed) | copy |
| `ProfitCenter` | AUFK-PRCTR | customer interface field: ProfitCenter (unconfirmed) | copy |
| `ObjectNumber` | AUFK-OBJNR | customer interface field: ObjectNumber (unconfirmed) | copy |

## `ZCOX_C_OrderSettlemenMig`

- Source: `ZCOX_I_OrderSettlemen`
- Keys: `ObjectNumber`, `DistributionRuleGroup`, `DistributionRule`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ObjectNumber` | COBRB-OBJNR | customer interface field: ObjectNumber (unconfirmed) | copy |
| `DistributionRuleGroup` | COBRB-BUREG | customer interface field: DistributionRuleGroup (unconfirmed) | copy |
| `DistributionRule` | COBRB-LFDNR | customer interface field: DistributionRule (unconfirmed) | copy |
| `SettlementType` | COBRB-PERBZ | customer interface field: SettlementType (unconfirmed) | copy |
| `SettlementPercentage` | COBRB-PROZS | customer interface field: SettlementPercentage (unconfirmed) | copy |
| `ReceiverCostCenter` | COBRB-KOSTL | customer interface field: ReceiverCostCenter (unconfirmed) | copy |
| `ReceiverOrder` | COBRB-AUFNR | customer interface field: ReceiverOrder (unconfirmed) | copy |
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

## `ZCOX_C_OrderStatusMig`

- Source: `ZCOX_I_OrderStatus`
- Keys: `InternalOrder`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `InternalOrder` | AUFK-AUFNR | - | copy |
| `ObjectNumber` | JEST-OBJNR | - | information only |
| `StatusCode` | JEST-STAT | - | copy |
| `StatusKind` | derived: first character of JEST-STAT | - | copy |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |
| `StatusProfile` | JSTO-STSMA | - | copy |

## `ZCOX_C_OrderPartnerMig`

- Source: `ZCOX_I_OrderPartner`
- Keys: `InternalOrder`, `PartnerFunction`, `PartnerCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Resolve partner identities and language-independent partner functions through a supported business interface after the selected master. Preserve partner counters; deleted partner assignments are excluded.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `InternalOrder` | AUFK-AUFNR | - | copy |
| `PartnerFunction` | IHPA-PARVW | - | copy |
| `PartnerCounter` | IHPA-COUNTER | - | copy |
| `Partner` | IHPA-PARNR | - | copy |

## `ZCOX_C_OrderUserStatusMig`

- Source: `ZCOX_I_OrderUserStatus`
- Keys: `InternalOrder`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Map source profile and E* user status codes to configured target profiles/statuses. Apply through a supported post-load business operation; do not replay system statuses or write JEST/JSTO.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `InternalOrder` | AUFK-AUFNR | - | copy |
| `StatusCode` | JEST-STAT | - | copy |
| `ObjectNumber` | JEST-OBJNR | - | information only |
| `StatusKind` | derived: first character of JEST-STAT | - | copy |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |
| `StatusProfile` | JSTO-STSMA | - | copy |

## `ZCOX_C_OrderLongTextMig`

- Source: `ZCOX_I_OrderLongText`
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
| `ZCOX_B_OrderStatusData` | `StatusIsInactive` | JEST-INACT | Selection predicate retains only active source statuses. |

## Source controls

- Source count view: `ZCOX_C_InternalOrderMigCount`

## Open gaps

- Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.
