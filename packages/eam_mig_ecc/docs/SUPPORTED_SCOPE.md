# Supported scope

ModuPorter Enterprise Asset Management version 1.0.0.

| Module | ID | Extraction structures |
|---|---|---:|
| Classification | classification | 2 |
| Migration core | core | 0 |
| Equipment | equipment | 8 |
| Equipment BOM | equipment_bom | 4 |
| Functional location | functional_location | 3 |
| Long text | long_text | 1 |
| Maintenance notification | maintenance_notification | 5 |
| Maintenance order | maintenance_order | 5 |
| Maintenance plan | maintenance_plan | 3 |
| Measurement document | measurement_document | 1 |
| Measuring point | measuring_point | 1 |
| Object partner | object_partner | 1 |
| Object status | object_status | 1 |
| Maintenance task list | task_list | 6 |
| Work center | work_center | 5 |

## Delivery boundaries

Read-only extraction and comparison templates. Histories, balances and process references are not automatically posted as master data. Business eligibility, effectivity, cutover and target posting interfaces are customer configuration decisions.

## Domain details

# EAM pack 1.0.0 scope

## Delivered

- All 14 ECC migration modules plus shared core: 169 CDS views, 46 documented extraction structures, 14 count views and field mappings.
- S/4 companion: 16 CDS views for main-object comparisons in eight modules.
- Preparation tools: date/interval selection, explicit ECM eligibility validation, typed parent cohorts, reference sets, many-to-one joins, alias conversion, nested service-package closure and auditable whole-project execution.
- Reconciliation: every canonical structure and raw extension table, using exported DDIC keys or explicit business-key contracts; exact ordered text comparison.
- Optional read-only ABAP reports: complete row/schema export for the allowlisted EAM tables and READ_TEXT content export.
- Contracts, examples, installation/acceptance instructions and intended commercial usage license.

Specialized capacities/shifts/formulas, task-list relationships/services/dependencies are delivered as full-row DDIC exports and preparation recipes rather than additional narrow CDS views. Their fields are preserved, but SAP interface translation/posting is the customer's implementation. These are explicit delivery modes, not claims of load-ready APIs.

## Customer inputs

SAP release/DDIC confirmation, selected root population, native engineering-change eligibility where needed, conversion and identifier maps, target posting interface and deployment permissions. Customizing, target loading/commits and SAP entitlements belong to the customer implementation. Parameter-dependent ECM cannot be inferred reliably from a generic table snapshot; unevaluated cases stop preparation.

## Validation boundary

Equipment master now includes its standard postal address; separate equipment child exports preserve partner, status, text and address-version keys. See EQUIPMENT_ARCHITECTURE.md.
