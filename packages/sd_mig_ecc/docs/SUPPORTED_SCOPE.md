# Supported scope

ModuPorter Sales and Distribution version 1.0.0.

| Module | ID | Extraction structures |
|---|---|---:|
| Billing document reference | billing_document | 5 |
| Outbound delivery reference | outbound_delivery | 7 |
| Pricing condition records and scales | pricing_condition | 4 |
| Sales orders | sales_order | 10 |

## Delivery boundaries

Read-only source extraction templates. Histories, balances and process references are not automatically posted as master data. Business eligibility, effectivity, cutover and target posting interfaces are customer configuration decisions.

## Domain details

# Supported scope

Sales and Distribution has 4 modules and 16 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Pricing condition records and scales | pricing_condition | 4 | master |
| Sales orders | sales_order | 10 | open-document |
| Outbound delivery reference | outbound_delivery | 7 | reference |
| Billing document reference | billing_document | 5 | reference |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented extraction structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/sd; they are not duplicated as migration payloads.

Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

This scope does not imply every SAP feature is covered. Full-row allowlisted exports retain additional DDIC fields for customer extension. No posting program, customizing migration, business status replay, delta synchronization, clean-core certification or SAP runtime certification is supplied.

## Coverage additions — 0.2.0

### Pricing condition records and scales (`pricing_condition`)

Export every configured condition access table (Axxx or customer tables) at its actual DDIC key and link KNUMH to KONH/KONP and scales. KONH alone loses the customer/material/sales-area access key; the configured access export is mandatory. Include supplements, exclusions, deletion, validity, calculation-type-specific percentages/currencies/units and scale type. Never confuse master condition records with document conditions (KONV/PRCD_ELEMENTS), or divide every rate by the same factor.

Master and child preparation follows MASTER_CHILD_ARCHITECTURE.md; full source keys and selected parent populations are preserved.
