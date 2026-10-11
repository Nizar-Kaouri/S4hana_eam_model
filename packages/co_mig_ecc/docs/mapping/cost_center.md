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

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ControllingArea` | CSKS-KOKRS | customer interface field: ControllingArea (unconfirmed) | copy | yes |
| `CostCenter` | CSKS-KOSTL | customer interface field: CostCenter (unconfirmed) | copy | yes |
| `ValidityEndDate` | CSKS-DATBI | customer interface field: ValidityEndDate (unconfirmed) | copy | yes |
| `ValidityStartDate` | CSKS-DATAB | customer interface field: ValidityStartDate (unconfirmed) | copy | yes |
| `CompanyCode` | CSKS-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `ProfitCenter` | CSKS-PRCTR | customer interface field: ProfitCenter (unconfirmed) | copy | yes |
| `CostCenterCategory` | CSKS-KOSAR | customer interface field: CostCenterCategory (unconfirmed) | copy | yes |
| `ResponsiblePerson` | CSKS-VERAK | customer interface field: ResponsiblePerson (unconfirmed) | copy | yes |

## `ZCOX_C_CostCenterTextMig`

- Source: `ZCOX_I_CostCenterText`
- Keys: `Language`, `ControllingArea`, `CostCenter`, `ValidityEndDate`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Language` | CSKT-SPRAS | customer interface field: Language (unconfirmed) | copy | yes |
| `ControllingArea` | CSKT-KOKRS | customer interface field: ControllingArea (unconfirmed) | copy | yes |
| `CostCenter` | CSKT-KOSTL | customer interface field: CostCenter (unconfirmed) | copy | yes |
| `ValidityEndDate` | CSKT-DATBI | customer interface field: ValidityEndDate (unconfirmed) | copy | yes |
| `CostCenterName` | CSKT-KTEXT | customer interface field: CostCenterName (unconfirmed) | copy | yes |
| `CostCenterDescription` | CSKT-LTEXT | customer interface field: CostCenterDescription (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZCOX_C_CostCenterMigCount` (ECC) vs `ZCOT_I_CostCenterCount` (S/4HANA) per `ControllingArea`
- Records and fields: `ZCOX_C_CostCenterMig` vs `ZCOT_B_CostCenterCompare` on `ControllingArea`, `CostCenter`, `ValidityEndDate`; compared: `ValidityStartDate`, `CompanyCode`, `ProfitCenter`, `CostCenterCategory`

```bash
python3 tools/mig_reconcile.py counts --product co_mig_ecc --module cost_center --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product co_mig_ecc --module cost_center --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.
