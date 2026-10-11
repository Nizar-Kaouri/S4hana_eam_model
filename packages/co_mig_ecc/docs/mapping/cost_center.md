# Migration interface: cost_center

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** `profit_center`
- **Business key:** `ControllingArea`, `CostCenter`, `ValidityEndDate` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZCOX_C_CostCenterMig`

- Source: `ZCOX_I_CostCenter`
- Keys: `ControllingArea`, `CostCenter`, `ValidityEndDate`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ControllingArea` | CSKS-KOKRS | customer interface field: ControllingArea (unconfirmed) | copy |
| `CostCenter` | CSKS-KOSTL | customer interface field: CostCenter (unconfirmed) | copy |
| `ValidityEndDate` | CSKS-DATBI | customer interface field: ValidityEndDate (unconfirmed) | copy |
| `ValidityStartDate` | CSKS-DATAB | customer interface field: ValidityStartDate (unconfirmed) | copy |
| `CompanyCode` | CSKS-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy |
| `ProfitCenter` | CSKS-PRCTR | customer interface field: ProfitCenter (unconfirmed) | copy |
| `CostCenterCategory` | CSKS-KOSAR | customer interface field: CostCenterCategory (unconfirmed) | copy |
| `ResponsiblePerson` | CSKS-VERAK | customer interface field: ResponsiblePerson (unconfirmed) | copy |
| `AddressStreet` | CSKS-STRAS | - | copy |
| `AddressCity` | CSKS-ORT01 | - | copy |
| `AddressDistrict` | CSKS-ORT02 | - | copy |
| `AddressPostalCode` | CSKS-PSTLZ | - | copy |
| `AddressCountry` | CSKS-LAND1 | - | copy |
| `AddressRegion` | CSKS-REGIO | - | copy |
| `AddressPOBox` | CSKS-PFACH | - | copy |
| `AddressPOBoxPostalCode` | CSKS-PSTL2 | - | copy |
| `AddressLanguage` | CSKS-SPRAS | - | copy |
| `PhoneNumber1` | CSKS-TELF1 | - | copy |
| `PhoneNumber2` | CSKS-TELF2 | - | copy |
| `FaxNumber` | CSKS-TELFX | - | copy |

## `ZCOX_C_CostCenterTextMig`

- Source: `ZCOX_I_CostCenterText`
- Keys: `Language`, `ControllingArea`, `CostCenter`, `ValidityEndDate`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Language` | CSKT-SPRAS | customer interface field: Language (unconfirmed) | copy |
| `ControllingArea` | CSKT-KOKRS | customer interface field: ControllingArea (unconfirmed) | copy |
| `CostCenter` | CSKT-KOSTL | customer interface field: CostCenter (unconfirmed) | copy |
| `ValidityEndDate` | CSKT-DATBI | customer interface field: ValidityEndDate (unconfirmed) | copy |
| `CostCenterName` | CSKT-KTEXT | customer interface field: CostCenterName (unconfirmed) | copy |
| `CostCenterDescription` | CSKT-LTEXT | customer interface field: CostCenterDescription (unconfirmed) | copy |

## `ZCOX_C_CostCenterLongTextMig`

- Source: `ZCOX_I_CostCenterLongText`
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

## Source controls

- Source count view: `ZCOX_C_CostCenterMigCount`

## Open gaps

- Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.
