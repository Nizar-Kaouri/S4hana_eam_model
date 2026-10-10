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

# Customer workflow

1. Choose the actual source/target deployment and release. Implement and approve native read adapters using customer-supported business services/reports. Record interface, scopes, hashes, ID mappings and export time. Contracts in customer/source-adapters.json are specifications, not working SAP connectors.
2. Populate canonical CSV columns in customer/headers. SourceSystem, SourceClient and ExportBatch identify the original cohort. Supply these same origin fields with target evidence, not the target system ID. Normalize mapped target business identifiers back to source keys for comparison, retaining a separate audit ledger. One file has one source system/client/batch. Preserve leading zeros.
3. Approve the business population and complete parent/child relationships before loading. Populate full keys in customer/selection. Empty production selection files yield zero rows. The source cohort project selects candidates, not business eligibility or dependency closure. Use the shared closure/reference-key tools and the declared dependency list where needed.
4. Run `python tools/migration_run.py --project customer/customer-cohort-project.json --out prepared`. First try customer/examples/project.json locally; these are synthetic data, not SAP evidence.
5. For each prepared CSV run `python tools/migration_stage.py --contract customer/staging-contracts.json --view <source consumption view> --input prepared/<view>_Prepared.csv --out new-stage-directory`. The tool verifies complete unique keys, exact headers/order, lengths and one origin cohort, then writes canonical.csv, headerless stage.tsv and hash audit. Tabs, newlines, NUL and trailing spaces are rejected to avoid lossy flat staging. Use native text/attachment interfaces for those values.
6. Import the source ZIP into an authorized administrative staging client on a compatible ABAP stack. Activate customer tables before Basic, Composite and Consumption views using ACTIVATION_ORDER.txt. Create the supplied load/export reports separately in SE38. The stage loader defaults to simulation and accepts only supplied Z staging tables; reviewed non-simulation inserts new rows, refuses duplicate keys and rolls back database failures. It does not update native business tables or delete existing cohorts. Verify GUI UTF-8/tab handling, authorization and transaction rollback on SAP before use. If this staging stack is unavailable, use the offline CSV preparation/comparison path instead.
7. Export stages with the supplied full-row helper, then run migration_stage.py with --physical to recover canonical aliases. Use migration_ddic.py to check delivered stage fields/keys against the real .fields.csv export. This proves stage metadata only, never native business extraction completeness.
8. Adapt approved data to the supported target business interface. Reference/history/regulatory structures are not automatically posted. Retain accepted/rejected records, regenerated keys and application logs. No target posting connector is supplied.
9. Implement native target read adapters for the same approved and mapped cohort. Compare their canonical CSVs directly with `python tools/migration_prepare.py compare --mapping mapping/<module>/mapping.json --view <source consumption view> --input prepared/<view>_Prepared.csv --target target.csv --out comparison.md`. Optional target staging uses its own contracts and loader; its CDS views project staged evidence, not live business tables.
10. Reconcile quantities/amounts by explicit currencies/units and approved signs with migration_business.py totals. Verify business status, effects, source-to-target dependency closure and target application behavior independently. Candidate count views count all staged cohorts by origin; always restrict by source system, source client and export batch. Record actual SAP evidence in customer/TEST_RESULTS.csv before acceptance.

# Customer acceptance

No SAP activation, source extraction, staging import or target posting has been performed. Test authorized/restricted reads and writes, DDIC activation, UTF-8 TSV round trip, preservation of zeros and GUIDs, duplicate imports with rollback, mixed origins, overlength data, missing parents, changed IDs, deletion/status rules, unit/currency totals and rejected target posts. Verify native source completeness and native target evidence; identical staging files alone are not business acceptance.

## Staging TSV format

Use stage.tsv exactly as generated. It has no header and ends each row with the literal marker #MODUPORTER_END# after the final tab. The loader verifies and removes that marker; it preserves empty final values. Do not edit or load canonical.csv as TSV. Native SAP GUI encoding and SPLIT behavior remain subject to customer testing.
