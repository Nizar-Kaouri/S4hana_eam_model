# Customer implementation requirements

Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

Use the supplied CSV contracts for the documented source structures. Selection is intentionally explicit and empty by default. It does not automatically derive business eligibility, dependency closure, historic open items, stock or effective BOM/routing states. Posting and configuration are customer work.

## Coverage additions — 0.2.0

### Pricing condition records and scales (`pricing_condition`)

Export every configured condition access table (Axxx or customer tables) at its actual DDIC key and link KNUMH to KONH/KONP and scales. KONH alone loses the customer/material/sales-area access key; the configured access export is mandatory. Include supplements, exclusions, deletion, validity, calculation-type-specific percentages/currencies/units and scale type. Never confuse master condition records with document conditions (KONV/PRCD_ELEMENTS), or divide every rate by the same factor.
