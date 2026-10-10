# Supported scope

Sales and Distribution has 3 modules and 12 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Sales orders | sales_order | 8 | open-document |
| Outbound delivery reference | outbound_delivery | 2 | reference |
| Billing document reference | billing_document | 2 | reference |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented candidate structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/sd; they are not duplicated as migration payloads.

Open sales scope must resolve item rejection, delivery and billing status, document flow and remaining quantities. Historical deliveries and billing documents are reference data; recreating them can trigger accounting or logistics. Partners, pricing, texts and tax need explicit target interfaces and agreed key maps. Do not infer open status from VBAK alone.

This scope does not imply every SAP feature is covered. Full-row allowlisted exports retain additional DDIC fields for customer extension. No posting program, customizing migration, business status replay, delta synchronization, clean-core certification or SAP runtime certification is supplied.
