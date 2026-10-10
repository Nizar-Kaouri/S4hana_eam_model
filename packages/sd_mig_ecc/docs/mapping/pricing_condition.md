# Migration interface: pricing_condition

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** Customer-verified business interface; master restrictions apply
- **Load after:** - (first level)
- **Business key:** `ConditionRecord` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZSDX_C_ConditionHdrMig`

- Source: `ZSDX_I_ConditionHdr`
- Keys: `ConditionRecord`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone. Export every configured condition access table (Axxx or customer tables) at its actual DDIC key and link KNUMH to KONH/KONP and scales. KONH alone loses the customer/material/sales-area access key; the configured access export is mandatory. Include supplements, exclusions, deletion, validity, calculation-type-specific percentages/currencies/units and scale type. Never confuse master condition records with document conditions (KONV/PRCD_ELEMENTS), or divide every rate by the same factor.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ConditionRecord` | KONH-KNUMH | customer interface field: ConditionRecord (unconfirmed) | copy | yes |
| `ConditionUsage` | KONH-KVEWE | customer interface field: ConditionUsage (unconfirmed) | copy | yes |
| `ConditionTableNumber` | KONH-KOTABNR | customer interface field: ConditionTableNumber (unconfirmed) | copy | yes |
| `Application` | KONH-KAPPL | customer interface field: Application (unconfirmed) | copy | yes |
| `ConditionType` | KONH-KSCHL | customer interface field: ConditionType (unconfirmed) | copy | yes |
| `ValidityStartDate` | KONH-DATAB | customer interface field: ValidityStartDate (unconfirmed) | copy | yes |
| `ValidityEndDate` | KONH-DATBI | customer interface field: ValidityEndDate (unconfirmed) | copy | yes |

## `ZSDX_C_ConditionItemMig`

- Source: `ZSDX_I_ConditionItem`
- Keys: `ConditionRecord`, `ConditionItem`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone. Export every configured condition access table (Axxx or customer tables) at its actual DDIC key and link KNUMH to KONH/KONP and scales. KONH alone loses the customer/material/sales-area access key; the configured access export is mandatory. Include supplements, exclusions, deletion, validity, calculation-type-specific percentages/currencies/units and scale type. Never confuse master condition records with document conditions (KONV/PRCD_ELEMENTS), or divide every rate by the same factor.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ConditionRecord` | KONP-KNUMH | customer interface field: ConditionRecord (unconfirmed) | copy | yes |
| `ConditionItem` | KONP-KOPOS | customer interface field: ConditionItem (unconfirmed) | copy | yes |
| `CalculationType` | KONP-KRECH | customer interface field: CalculationType (unconfirmed) | copy | yes |
| `ConditionRate` | KONP-KBETR | customer interface field: ConditionRate (unconfirmed) | copy | yes |
| `ConditionCurrency` | KONP-KONWA | customer interface field: ConditionCurrency (unconfirmed) | copy | yes |
| `PricingUnit` | KONP-KPEIN | customer interface field: PricingUnit (unconfirmed) | copy | yes |
| `ConditionUnit` | KONP-KMEIN | customer interface field: ConditionUnit (unconfirmed) | copy | yes |
| `DeletionFlag` | KONP-LOEVM_KO | customer interface field: DeletionFlag (unconfirmed) | copy | yes |

## `ZSDX_C_QuantityScaleMig`

- Source: `ZSDX_I_QuantityScale`
- Keys: `ConditionRecord`, `ConditionItem`, `ScaleLine`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone. Export every configured condition access table (Axxx or customer tables) at its actual DDIC key and link KNUMH to KONH/KONP and scales. KONH alone loses the customer/material/sales-area access key; the configured access export is mandatory. Include supplements, exclusions, deletion, validity, calculation-type-specific percentages/currencies/units and scale type. Never confuse master condition records with document conditions (KONV/PRCD_ELEMENTS), or divide every rate by the same factor.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ConditionRecord` | KONM-KNUMH | customer interface field: ConditionRecord (unconfirmed) | copy | yes |
| `ConditionItem` | KONM-KOPOS | customer interface field: ConditionItem (unconfirmed) | copy | yes |
| `ScaleLine` | KONM-KLFN1 | customer interface field: ScaleLine (unconfirmed) | copy | yes |
| `ScaleQuantity` | KONM-KSTBM | customer interface field: ScaleQuantity (unconfirmed) | copy | yes |
| `ConditionRate` | KONM-KBETR | customer interface field: ConditionRate (unconfirmed) | copy | yes |

## `ZSDX_C_ValueScaleMig`

- Source: `ZSDX_I_ValueScale`
- Keys: `ConditionRecord`, `ConditionItem`, `ScaleLine`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone. Export every configured condition access table (Axxx or customer tables) at its actual DDIC key and link KNUMH to KONH/KONP and scales. KONH alone loses the customer/material/sales-area access key; the configured access export is mandatory. Include supplements, exclusions, deletion, validity, calculation-type-specific percentages/currencies/units and scale type. Never confuse master condition records with document conditions (KONV/PRCD_ELEMENTS), or divide every rate by the same factor.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ConditionRecord` | KONW-KNUMH | customer interface field: ConditionRecord (unconfirmed) | copy | yes |
| `ConditionItem` | KONW-KOPOS | customer interface field: ConditionItem (unconfirmed) | copy | yes |
| `ScaleLine` | KONW-KLFN1 | customer interface field: ScaleLine (unconfirmed) | copy | yes |
| `ScaleValue` | KONW-KSTBW | customer interface field: ScaleValue (unconfirmed) | copy | yes |
| `ConditionRate` | KONW-KBETR | customer interface field: ConditionRate (unconfirmed) | copy | yes |

## Reconciliation

- Counts: `ZSDX_C_ConditionHdrMigCount` (ECC) vs `-` (S/4HANA) per `ConditionRecord`

```bash
python3 tools/mig_reconcile.py counts --product sd_mig_ecc --module pricing_condition --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.
- Export every configured condition access table (Axxx or customer tables) at its actual DDIC key and link KNUMH to KONH/KONP and scales. KONH alone loses the customer/material/sales-area access key; the configured access export is mandatory. Include supplements, exclusions, deletion, validity, calculation-type-specific percentages/currencies/units and scale type. Never confuse master condition records with document conditions (KONV/PRCD_ELEMENTS), or divide every rate by the same factor.
