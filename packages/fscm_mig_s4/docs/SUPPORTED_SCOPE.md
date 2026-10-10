# ModuPorter Financial Supply Chain Management

Version 0.1.0. Draft templates, never activated or tested on SAP. Source path: Classic ECC credit management, FSCM Credit/Collections/Dispute Management, or S/4HANA successors; choose the exact path.

| Module | ID | Structures | Mode |
|---|---|---|---|
| Credit profiles and relationships | credit_profile | 2 | master |
| Credit segment limits | credit_segment | 1 | master |
| Credit exposure references | credit_exposure | 1 | reference |
| Collections profiles and segment assignments | collections_profile | 2 | master |
| Collections contacts and tasks | collection_activity | 2 | process-reference |
| Promises to pay and related receivables | promise_to_pay | 2 | process-reference |
| Dispute cases attributes receivables and attachments | dispute_case | 4 | process-reference |

Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.

These packs define canonical export contracts and customer-owned staging DDIC tables. They do not directly query or change native SAP business tables. Basic → Composite → Consumption preserves each contract's grain. The target stages and comparison views contain exported target evidence; a stage insert is not a business migration. All values are text to preserve IDs, decimal representations and UTC/time-zone evidence. Use approved currency/unit totals; no mathematical meaning is implied by a CHAR field. Long texts, binaries, all customizing and every industry/application feature are outside this explicitly catalogued scope.
