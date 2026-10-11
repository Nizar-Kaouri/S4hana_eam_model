# Migration interface: cost_element

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** - (first level)
- **Business key:** `ChartOfAccounts`, `CostElement` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZCOX_C_CostElementMig`

- Source: `ZCOX_I_CostElement`
- Keys: `ChartOfAccounts`, `CostElement`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ChartOfAccounts` | CSKA-KTOPL | customer interface field: ChartOfAccounts (unconfirmed) | information only | yes |
| `CostElement` | CSKA-KSTAR | customer interface field: CostElement (unconfirmed) | information only | yes |
| `CreationDate` | CSKA-ERSDA | customer interface field: CreationDate (unconfirmed) | information only | yes |

## `ZCOX_C_CostElementAreMig`

- Source: `ZCOX_I_CostElementAre`
- Keys: `ControllingArea`, `CostElement`, `ValidityEndDate`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ControllingArea` | CSKB-KOKRS | customer interface field: ControllingArea (unconfirmed) | information only | yes |
| `CostElement` | CSKB-KSTAR | customer interface field: CostElement (unconfirmed) | information only | yes |
| `ValidityEndDate` | CSKB-DATBI | customer interface field: ValidityEndDate (unconfirmed) | information only | yes |
| `ValidityStartDate` | CSKB-DATAB | customer interface field: ValidityStartDate (unconfirmed) | information only | yes |
| `CostElementCategory` | CSKB-KATYP | customer interface field: CostElementCategory (unconfirmed) | information only | yes |

## `ZCOX_C_CostElementTextMig`

- Source: `ZCOX_I_CostElementText`
- Keys: `Language`, `ChartOfAccounts`, `CostElement`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Language` | CSKU-SPRAS | - | copy |  |
| `ChartOfAccounts` | CSKU-KTOPL | - | copy |  |
| `CostElement` | CSKU-KSTAR | - | copy |  |
| `CostElementName` | CSKU-KTEXT | - | copy |  |
| `CostElementDescription` | CSKU-LTEXT | - | copy |  |

## `ZCOX_C_CostElementLongTextMig`

- Source: `ZCOX_I_CostElementLongText`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: SAPscript index only. Populate the explicit full text-key to business-owner link file from the source text editor/application metadata, run the text_scope preparation step against selected masters, then READ_TEXT to retrieve ordered formatted lines. Never infer the business owner from a TDNAME substring or post compressed STXL data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | - | copy |  |
| `TextName` | STXH-TDNAME | - | copy |  |
| `TextID` | STXH-TDID | - | copy |  |
| `Language` | STXH-TDSPRAS | - | copy |  |

## Reconciliation

- Counts: `ZCOX_C_CostElementMigCount` (ECC) vs `-` (S/4HANA) per `ChartOfAccounts`

```bash
python3 tools/mig_reconcile.py counts --product co_mig_ecc --module cost_element --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.
