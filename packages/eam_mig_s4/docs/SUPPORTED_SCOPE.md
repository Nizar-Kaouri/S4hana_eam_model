# EAM pack 1.0.0-rc.1 scope

## Delivered

- All 14 ECC migration modules plus shared core: 158 CDS views, 41 documented extraction structures, 14 count views and field mappings.
- S/4 companion: 16 CDS views for main-object comparisons in eight modules.
- Preparation tools: date/interval selection, explicit ECM eligibility validation, typed parent cohorts, reference sets, many-to-one joins, alias conversion, nested service-package closure and auditable whole-project execution.
- Reconciliation: every canonical structure and raw extension table, using exported DDIC keys or explicit business-key contracts; exact ordered text comparison.
- Optional read-only ABAP reports: complete row/schema export for the allowlisted EAM tables and READ_TEXT content export.
- Contracts, examples, installation/acceptance instructions and intended commercial usage license.

Specialized capacities/shifts/formulas, task-list relationships/services/dependencies are delivered as full-row DDIC exports and preparation recipes rather than additional narrow CDS views. Their fields are preserved, but SAP interface translation/posting is the customer's implementation. These are explicit delivery modes, not claims of load-ready APIs.

## Customer inputs

SAP release/DDIC confirmation, selected root population, native engineering-change eligibility where needed, conversion and identifier maps, target posting interface and deployment permissions. Customizing, target loading/commits and SAP entitlements belong to the customer implementation. Parameter-dependent ECM cannot be inferred reliably from a generic table snapshot; unevaluated cases stop preparation.

## Validation boundary

Status remains draft-unverified until your SAP activation and extraction test. Offline parsers and synthetic fixtures cannot establish the actual DDIC, function-module signatures, runtime behavior, authorization coverage or successful postings. The customer acceptance matrix includes the added workflow/report scenarios. This release candidate is prepared for a customer trial, not labelled SAP certified.
