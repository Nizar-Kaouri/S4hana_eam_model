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

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ProfitCenter` | CEPC-PRCTR | customer interface field: ProfitCenter (unconfirmed) | copy | yes |
| `ValidityEndDate` | CEPC-DATBI | customer interface field: ValidityEndDate (unconfirmed) | copy | yes |
| `ControllingArea` | CEPC-KOKRS | customer interface field: ControllingArea (unconfirmed) | copy | yes |
| `ValidityStartDate` | CEPC-DATAB | customer interface field: ValidityStartDate (unconfirmed) | copy | yes |
| `ResponsiblePerson` | CEPC-VERAK | customer interface field: ResponsiblePerson (unconfirmed) | copy | yes |
| `Segment` | CEPC-SEGMENT | customer interface field: Segment (unconfirmed) | copy | yes |
| `AddressStreet` | CEPC-STRAS | - | copy |  |
| `AddressCity` | CEPC-ORT01 | - | copy |  |
| `AddressDistrict` | CEPC-ORT02 | - | copy |  |
| `AddressPostalCode` | CEPC-PSTLZ | - | copy |  |
| `AddressCountry` | CEPC-LAND1 | - | copy |  |
| `AddressRegion` | CEPC-REGIO | - | copy |  |
| `AddressPOBox` | CEPC-PFACH | - | copy |  |
| `AddressPOBoxPostalCode` | CEPC-PSTL2 | - | copy |  |
| `AddressLanguage` | CEPC-SPRAS | - | copy |  |
| `PhoneNumber1` | CEPC-TELF1 | - | copy |  |
| `PhoneNumber2` | CEPC-TELF2 | - | copy |  |
| `FaxNumber` | CEPC-TELFX | - | copy |  |

## `ZCOX_C_ProfitCenterTeMig`

- Source: `ZCOX_I_ProfitCenterTe`
- Keys: `Language`, `ProfitCenter`, `ValidityEndDate`, `ControllingArea`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Language` | CEPCT-SPRAS | customer interface field: Language (unconfirmed) | copy | yes |
| `ProfitCenter` | CEPCT-PRCTR | customer interface field: ProfitCenter (unconfirmed) | copy | yes |
| `ValidityEndDate` | CEPCT-DATBI | customer interface field: ValidityEndDate (unconfirmed) | copy | yes |
| `ControllingArea` | CEPCT-KOKRS | customer interface field: ControllingArea (unconfirmed) | copy | yes |
| `ProfitCenterName` | CEPCT-KTEXT | customer interface field: ProfitCenterName (unconfirmed) | copy | yes |
| `ProfitCenterDescription` | CEPCT-LTEXT | customer interface field: ProfitCenterDescription (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZCOX_C_ProfitCenterMigCount` (ECC) vs `ZCOT_I_ProfitCenterCount` (S/4HANA) per `ProfitCenter`
- Records and fields: `ZCOX_C_ProfitCenterMig` vs `ZCOT_B_ProfitCenterCompare` on `ProfitCenter`, `ValidityEndDate`, `ControllingArea`; compared: `ValidityStartDate`, `ResponsiblePerson`, `Segment`

```bash
python3 tools/mig_reconcile.py counts --product co_mig_ecc --module profit_center --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product co_mig_ecc --module profit_center --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.
