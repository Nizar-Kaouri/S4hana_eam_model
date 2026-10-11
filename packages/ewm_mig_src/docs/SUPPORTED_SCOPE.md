# ModuPorter Extended Warehouse Management â€” native draft 0.3.0

This replaces the 0.1.0 staging architecture. Native SAP table â†’ Basic â†’ Composite â†’ Consumption is supplied for documented structures. Target comparison views read native tables. No customer staging tables or write loaders are included.

## Research update

7 native drafts; 9 pending structures. Public documents establish field usage, not customer DDIC flags or SAP activation.
## Research update

7 native drafts; 9 pending structures. Public documents establish field usage, not customer DDIC flags or SAP activation.

| Structure | Status | Native table | Scope and remaining work |
|---|---|---|---|
| StorageBin | NATIVE_DRAFT | /SCWM/LAGP | EWM storage bins; LE-WM LAGP is a different model. Capacity fields await validated unit semantics. |
| BinSorting | NATIVE_DRAFT | /SCWM/LAGPS | SortSequence is payload, not an invented key. Confirm exact DDIC key flags before activation. |
| WarehouseProd | PENDING | /SAPAPO/MATLWH; /SAPAPO/MATKEY | MATLWH keys MANDT/MATID/SCUGUID/ENTITLED_ID documented; MATKEY supplies MATNR/MEINS. Warehouse control payload, full joined DDIC validation and target-release semantics still unresolved; no identity-only view substituted for a warehouse product. |
| FixedBin | PENDING | /SCWM/BINMAT | Fixed-bin functionality documented; exact physical keys, minimum/maximum quantities and unit references not established. |
| WarehouseStock | PENDING | /SCWM/QUAN; /SCWM/AQUA | Stock extractor joins indexed stock representations. Physical-stock versus available-stock grain, HU/product references and quantity/unit roles need explicit native definitions; no flattened stock-table assumption. |
| StockSerial | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| HandlingUnit | PENDING | /SCWM/HUHDR | GUID_HU and object references documented; complete header payload and content key/reference definitions unresolved. |
| HUContent | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| WarehouseTask | NATIVE_DRAFT | /SCWM/ORDIM_O | Open-task snapshot only. Do not add confirmed-task TAPOS to this grain. Quantities, product references and serials remain pending. Key flags require actual DDIC validation. |
| TaskConfirm | NATIVE_DRAFT | /SCWM/ORDIM_C | Confirmed tasks only, retaining TAPOS. Open tasks are delivered separately at LGNUM/TANUM grain. Quantity and serial payload remain pending. |
| WarehouseOrder | NATIVE_DRAFT | /SCWM/WHO | All native warehouse-order records; customer must approve process state and cutover scope. |
| WhDelivery | NATIVE_DRAFT | /SCDL/DB_PROCH_I | Inbound delivery header only. Outbound branch, partner-role selection, status and cutover eligibility remain pending; do not interpret the broad snapshot as open deliveries. |
| WhDeliveryItem | NATIVE_DRAFT | /SCDL/DB_PROCI_I | Inbound items only; DOCID/ITEMID candidate grain must be confirmed in DDIC. Quantities belong to role-qualified /SCDL/DB_ADDMEAS records, not invented item QTY columns. Outbound branch, quantity/date roles, status and parent cohort closure remain pending. |
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


See customer/native-coverage.json for remaining payload and PROVENANCE.md for evidence. No posting adapters.
