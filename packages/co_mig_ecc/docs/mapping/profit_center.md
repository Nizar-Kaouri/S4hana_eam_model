# Migration interface: profit_center

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** - (first level)
- **Business key:** `ProfitCenter`, `ValidityEndDate`, `ControllingArea` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZCOX_C_ProfitCenterMig`

- Source: `ZCOX_I_ProfitCenter`
- Keys: `ProfitCenter`, `ValidityEndDate`, `ControllingArea`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ProfitCenter` | CEPC-PRCTR | customer interface field: ProfitCenter (unconfirmed) | copy |
| `ValidityEndDate` | CEPC-DATBI | customer interface field: ValidityEndDate (unconfirmed) | copy |
| `ControllingArea` | CEPC-KOKRS | customer interface field: ControllingArea (unconfirmed) | copy |
| `ValidityStartDate` | CEPC-DATAB | customer interface field: ValidityStartDate (unconfirmed) | copy |
| `ResponsiblePerson` | CEPC-VERAK | customer interface field: ResponsiblePerson (unconfirmed) | copy |
| `Segment` | CEPC-SEGMENT | customer interface field: Segment (unconfirmed) | copy |
| `AddressStreet` | CEPC-STRAS | - | copy |
| `AddressCity` | CEPC-ORT01 | - | copy |
| `AddressDistrict` | CEPC-ORT02 | - | copy |
| `AddressPostalCode` | CEPC-PSTLZ | - | copy |
| `AddressCountry` | CEPC-LAND1 | - | copy |
| `AddressRegion` | CEPC-REGIO | - | copy |
| `AddressPOBox` | CEPC-PFACH | - | copy |
| `AddressPOBoxPostalCode` | CEPC-PSTL2 | - | copy |
| `AddressLanguage` | CEPC-SPRAS | - | copy |
| `PhoneNumber1` | CEPC-TELF1 | - | copy |
| `PhoneNumber2` | CEPC-TELF2 | - | copy |
| `FaxNumber` | CEPC-TELFX | - | copy |

## `ZCOX_C_ProfitCenterTeMig`

- Source: `ZCOX_I_ProfitCenterTe`
- Keys: `Language`, `ProfitCenter`, `ValidityEndDate`, `ControllingArea`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Language` | CEPCT-SPRAS | customer interface field: Language (unconfirmed) | copy |
| `ProfitCenter` | CEPCT-PRCTR | customer interface field: ProfitCenter (unconfirmed) | copy |
| `ValidityEndDate` | CEPCT-DATBI | customer interface field: ValidityEndDate (unconfirmed) | copy |
| `ControllingArea` | CEPCT-KOKRS | customer interface field: ControllingArea (unconfirmed) | copy |
| `ProfitCenterName` | CEPCT-KTEXT | customer interface field: ProfitCenterName (unconfirmed) | copy |
| `ProfitCenterDescription` | CEPCT-LTEXT | customer interface field: ProfitCenterDescription (unconfirmed) | copy |

## `ZCOX_C_ProfitCtrLongTextMig`

- Source: `ZCOX_I_ProfitCtrLongText`
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

- Source count view: `ZCOX_C_ProfitCenterMigCount`

## Open gaps

- Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.
