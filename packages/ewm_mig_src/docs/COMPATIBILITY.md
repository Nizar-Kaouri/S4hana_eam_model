# ModuPorter Extended Warehouse Management — native draft 0.3.0

This replaces the 0.1.0 staging architecture. Native SAP table → Basic → Composite → Consumption is supplied for documented structures. Target comparison views read native tables. No customer staging tables or write loaders are included.

**Not a complete pack:** 4 native structure drafts; 12 pending structures. Native drafts also have pending payload listed in customer/native-coverage.json. Do not interpret a root/header projection as a complete business object.

| Structure | Status | Native table / candidate | Scope and pending work |
|---|---|---|---|
| StorageBin | NATIVE_DRAFT | /SCWM/LAGP | EWM storage bins; LE-WM LAGP is a different model. Capacity fields await validated unit semantics. |
| BinSorting | NATIVE_DRAFT | /SCWM/LAGPS | SortSequence is payload, not an invented key. Confirm exact DDIC key flags before activation. |
| WarehouseProd | PENDING | /SAPAPO/MATLWH | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| FixedBin | PENDING | /SCWM/BINMAT | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| WarehouseStock | PENDING | /SCWM/QUAN; /SCWM/AQUA | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| StockSerial | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| HandlingUnit | PENDING | /SCWM/HUHDR | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| HUContent | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| WarehouseTask | PENDING | /SCWM/ORDIM_O | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| TaskConfirm | NATIVE_DRAFT | /SCWM/ORDIM_C | Confirmed task records only; open tasks, serials and quantity semantics remain pending. Reference extraction, not task recreation. |
| WarehouseOrder | NATIVE_DRAFT | /SCWM/WHO | All native warehouse-order records; customer must approve process state and cutover scope. |
| WhDelivery | PENDING | /SCDL/DB_PROCH_I; /SCDL/DB_PROCH_O | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| WhDeliveryItem | PENDING | /SCDL/DB_PROCI_I; /SCDL/DB_PROCI_O | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| PackSpec | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| PackLevel | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| PackElement | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |

## Installation and verification

1. Confirm the installed application and release. EWM is not LE-WM; classic EHS specifications are not modern EHSM incidents. Direct table extraction assumes on-premise/private-cloud or compatible decentralized ABAP systems. Public Cloud developer restrictions are not resolved by these templates.
2. Verify each native table, every field and its complete DDIC keys through SE11/ADT. The shipped key declarations are draft candidates, not SAP-tested metadata. Use the read-only full-row helper to export DDIC fields; run tools/migration_ddic.py against the actual .fields.csv and the structure mapping. Do not fabricate a schema export.
3. Import SOURCE and TARGET into the appropriate systems and follow ACTIVATION_ORDER.txt. Native tables must already exist. Source uses classic CDS; target uses view entities. Exact minimum application/ABAP releases remain pending. No SAP activation/runtime has been performed.
4. Verify permitted and restricted users and current-client behavior. No DCL is supplied. The helper checks S_TABU_NAM display authorization; this does not authorize every CDS extraction channel.
5. Export native consumption data with CDS aliases into customer/exports. Record system, client, export time and approved business population outside the CDS. Origin metadata is no longer an invented table key. The helper exports raw TABLE-FIELD columns, not consumption aliases or consumption filters.
6. Fill customer/selection with approved complete native keys. Empty selections yield zero rows. Run `python tools/migration_run.py --project customer/customer-cohort-project.json --out prepared`. The selection pipeline is not a business-state, dependency-closure or cutover calculation. Approve those separately.
7. Export the same target population using native comparison views. Map changed business identifiers and regenerated UUIDs before comparing; retain an audit ledger. Native UUID equality across systems is not assumed. Use migration_prepare.py compare with the relevant mapping and view. Count views are broad candidate counts; apply the same population before using totals.
8. Preserve EHS RECN/ACTN history and validity/deletion flags; no latest-record filter is asserted. Verify TM category constants and lifecycle scope. General case attributes include multiple case types. Payload absent from a native draft is pending, not successfully migrated.
9. Record activation, key uniqueness, authorization, extraction completeness, selection and source/target comparison in customer/TEST_RESULTS.csv. Real SAP evidence is required before acceptance.

Extraction views are read-only. No posting adapter or target business-object creation is supplied.
