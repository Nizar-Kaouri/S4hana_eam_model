# Migration interface: internal_order

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

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

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `InternalOrder` | AUFK-AUFNR | customer interface field: InternalOrder (unconfirmed) | copy | yes |
| `InternalOrderType` | AUFK-AUART | customer interface field: InternalOrderType (unconfirmed) | copy | yes |
| `OrderCategory` | AUFK-AUTYP | customer interface field: OrderCategory (unconfirmed) | copy | yes |
| `InternalOrderDescription` | AUFK-KTEXT | customer interface field: InternalOrderDescription (unconfirmed) | copy | yes |
| `CompanyCode` | AUFK-BUKRS | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `ControllingArea` | AUFK-KOKRS | customer interface field: ControllingArea (unconfirmed) | copy | yes |
| `ResponsibleCostCenter` | AUFK-KOSTV | customer interface field: ResponsibleCostCenter (unconfirmed) | copy | yes |
| `ProfitCenter` | AUFK-PRCTR | customer interface field: ProfitCenter (unconfirmed) | copy | yes |
| `ObjectNumber` | AUFK-OBJNR | customer interface field: ObjectNumber (unconfirmed) | copy | yes |

## `ZCOX_C_OrderSettlemenMig`

- Source: `ZCOX_I_OrderSettlemen`
- Keys: `ObjectNumber`, `DistributionRuleGroup`, `DistributionRule`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ObjectNumber` | COBRB-OBJNR | customer interface field: ObjectNumber (unconfirmed) | copy | yes |
| `DistributionRuleGroup` | COBRB-BUREG | customer interface field: DistributionRuleGroup (unconfirmed) | copy | yes |
| `DistributionRule` | COBRB-LFDNR | customer interface field: DistributionRule (unconfirmed) | copy | yes |
| `SettlementType` | COBRB-PERBZ | customer interface field: SettlementType (unconfirmed) | copy | yes |
| `SettlementPercentage` | COBRB-PROZS | customer interface field: SettlementPercentage (unconfirmed) | copy | yes |
| `ReceiverCostCenter` | COBRB-KOSTL | customer interface field: ReceiverCostCenter (unconfirmed) | copy | yes |
| `ReceiverOrder` | COBRB-AUFNR | customer interface field: ReceiverOrder (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZCOX_C_InternalOrderMigCount` (ECC) vs `ZCOT_I_InternalOrderCount` (S/4HANA) per `InternalOrder`
- Records and fields: `ZCOX_C_InternalOrderMig` vs `ZCOT_I_InternalOrderCompare` on `InternalOrder`; compared: `InternalOrderType`, `InternalOrderDescription`, `CompanyCode`, `ControllingArea`, `ResponsibleCostCenter`, `ProfitCenter`

```bash
python3 tools/mig_reconcile.py counts --product co_mig_ecc --module internal_order --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product co_mig_ecc --module internal_order --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Resolve time intervals at cutover and map controlling areas, cost centers, profit centers and order numbers. Cost elements integrate with S/4HANA G/L accounts. COEP is source history, not a target Universal Journal posting template. Plan data, allocations, settlement and commitments require additional interface scope.
