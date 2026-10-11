# Migration interface: pricing_condition

> Version **1.0.0**

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

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ConditionRecord` | KONH-KNUMH | customer interface field: ConditionRecord (unconfirmed) | copy |
| `ConditionUsage` | KONH-KVEWE | customer interface field: ConditionUsage (unconfirmed) | copy |
| `ConditionTableNumber` | KONH-KOTABNR | customer interface field: ConditionTableNumber (unconfirmed) | copy |
| `Application` | KONH-KAPPL | customer interface field: Application (unconfirmed) | copy |
| `ConditionType` | KONH-KSCHL | customer interface field: ConditionType (unconfirmed) | copy |
| `ValidityStartDate` | KONH-DATAB | customer interface field: ValidityStartDate (unconfirmed) | copy |
| `ValidityEndDate` | KONH-DATBI | customer interface field: ValidityEndDate (unconfirmed) | copy |

## `ZSDX_C_ConditionItemMig`

- Source: `ZSDX_I_ConditionItem`
- Keys: `ConditionRecord`, `ConditionItem`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone. Export every configured condition access table (Axxx or customer tables) at its actual DDIC key and link KNUMH to KONH/KONP and scales. KONH alone loses the customer/material/sales-area access key; the configured access export is mandatory. Include supplements, exclusions, deletion, validity, calculation-type-specific percentages/currencies/units and scale type. Never confuse master condition records with document conditions (KONV/PRCD_ELEMENTS), or divide every rate by the same factor.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ConditionRecord` | KONP-KNUMH | customer interface field: ConditionRecord (unconfirmed) | copy |
| `ConditionItem` | KONP-KOPOS | customer interface field: ConditionItem (unconfirmed) | copy |
| `CalculationType` | KONP-KRECH | customer interface field: CalculationType (unconfirmed) | copy |
| `ConditionRate` | KONP-KBETR | customer interface field: ConditionRate (unconfirmed) | copy |
| `ConditionCurrency` | KONP-KONWA | customer interface field: ConditionCurrency (unconfirmed) | copy |
| `PricingUnit` | KONP-KPEIN | customer interface field: PricingUnit (unconfirmed) | copy |
| `ConditionUnit` | KONP-KMEIN | customer interface field: ConditionUnit (unconfirmed) | copy |
| `DeletionFlag` | KONP-LOEVM_KO | customer interface field: DeletionFlag (unconfirmed) | copy |

## `ZSDX_C_QuantityScaleMig`

- Source: `ZSDX_I_QuantityScale`
- Keys: `ConditionRecord`, `ConditionItem`, `ScaleLine`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone. Export every configured condition access table (Axxx or customer tables) at its actual DDIC key and link KNUMH to KONH/KONP and scales. KONH alone loses the customer/material/sales-area access key; the configured access export is mandatory. Include supplements, exclusions, deletion, validity, calculation-type-specific percentages/currencies/units and scale type. Never confuse master condition records with document conditions (KONV/PRCD_ELEMENTS), or divide every rate by the same factor.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ConditionRecord` | KONM-KNUMH | customer interface field: ConditionRecord (unconfirmed) | copy |
| `ConditionItem` | KONM-KOPOS | customer interface field: ConditionItem (unconfirmed) | copy |
| `ScaleLine` | KONM-KLFN1 | customer interface field: ScaleLine (unconfirmed) | copy |
| `ScaleQuantity` | KONM-KSTBM | customer interface field: ScaleQuantity (unconfirmed) | copy |
| `ConditionRate` | KONM-KBETR | customer interface field: ConditionRate (unconfirmed) | copy |

## `ZSDX_C_ValueScaleMig`

- Source: `ZSDX_I_ValueScale`
- Keys: `ConditionRecord`, `ConditionItem`, `ScaleLine`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone. Export every configured condition access table (Axxx or customer tables) at its actual DDIC key and link KNUMH to KONH/KONP and scales. KONH alone loses the customer/material/sales-area access key; the configured access export is mandatory. Include supplements, exclusions, deletion, validity, calculation-type-specific percentages/currencies/units and scale type. Never confuse master condition records with document conditions (KONV/PRCD_ELEMENTS), or divide every rate by the same factor.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ConditionRecord` | KONW-KNUMH | customer interface field: ConditionRecord (unconfirmed) | copy |
| `ConditionItem` | KONW-KOPOS | customer interface field: ConditionItem (unconfirmed) | copy |
| `ScaleLine` | KONW-KLFN1 | customer interface field: ScaleLine (unconfirmed) | copy |
| `ScaleValue` | KONW-KSTBW | customer interface field: ScaleValue (unconfirmed) | copy |
| `ConditionRate` | KONW-KBETR | customer interface field: ConditionRate (unconfirmed) | copy |

## Source controls

- Source count view: `ZSDX_C_ConditionHdrMigCount`

## Open gaps

- Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.
- Export every configured condition access table (Axxx or customer tables) at its actual DDIC key and link KNUMH to KONH/KONP and scales. KONH alone loses the customer/material/sales-area access key; the configured access export is mandatory. Include supplements, exclusions, deletion, validity, calculation-type-specific percentages/currencies/units and scale type. Never confuse master condition records with document conditions (KONV/PRCD_ELEMENTS), or divide every rate by the same factor.
