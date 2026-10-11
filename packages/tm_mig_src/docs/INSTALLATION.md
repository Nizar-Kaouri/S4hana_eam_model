# ModuPorter Transportation Management — native draft 0.3.0

This replaces the 0.1.0 staging architecture. Native SAP table → Basic → Composite → Consumption is supplied for documented structures. No customer staging tables or write loaders are included.

**Not a complete pack:** 3 native structure drafts; 16 pending structures. Native drafts also have pending payload listed in customer/native-coverage.json. Do not interpret a root/header projection as a complete business object.

| Structure | Status | Native table / candidate | Scope and pending work |
|---|---|---|---|
| TransportLoc | NATIVE_DRAFT | /SAPAPO/LOC | Internal location UUID is preserved. Address, location type and time zone payload remain pending. |
| TransportRes | PENDING | /SAPAPO/RES_HEAD | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| ResCapacity | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| TransportLane | PENDING | /SAPAPO/TR | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| LaneCarrier | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| Schedule | PENDING | /SCMTMS/D_SCHROT | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| ScheduleStop | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| FreightAgree | PENDING | /SCMTMS/D_FAGROT | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| FreightRate | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| FreightScale | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| FreightUnit | NATIVE_DRAFT | /SCMTMS/D_TORROT | Native TOR root; category constants and lifecycle semantics require customer-release verification. Items, stops, stages and freight bookings remain pending. Root DB_KEY evidence: https://community.sap.com/t5/supply-chain-management-blog-posts-by-members/manual-assignment-of-loading-and-truck-resource-to-fo/ba-p/13920402 |
| FreightUnitItem | PENDING | /SCMTMS/D_TORITE | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| FreightUnitStop | PENDING | /SCMTMS/D_TORSTP | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| FreightOrder | NATIVE_DRAFT | /SCMTMS/D_TORROT | Native TOR root; category constants and lifecycle semantics require customer-release verification. Items, stops, stages and freight bookings remain pending. Root DB_KEY evidence: https://community.sap.com/t5/supply-chain-management-blog-posts-by-members/manual-assignment-of-loading-and-truck-resource-to-fo/ba-p/13920402 |
| FreightOrdItem | PENDING | /SCMTMS/D_TORITE | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| FreightOrdStop | PENDING | /SCMTMS/D_TORSTP | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| FreightStage | PENDING | /SCMTMS/D_TORSTS | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| FreightSettle | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| SettleItem | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |

## Installation and verification

1. Confirm the installed application and release. EWM is not LE-WM; classic EHS specifications are not modern EHSM incidents. Direct table extraction assumes on-premise/private-cloud or compatible decentralized ABAP systems. Public Cloud developer restrictions are not resolved by these templates.
2. Verify each native table, every field and its complete DDIC keys through SE11/ADT. The shipped key declarations are draft candidates, not SAP-tested metadata. Use the read-only full-row helper to export DDIC fields; run tools/migration_ddic.py against the actual .fields.csv and the structure mapping. Do not fabricate a schema export.
3. Import SOURCE into the source system and follow ACTIVATION_ORDER.txt. Native tables must already exist. Source uses classic CDS. Exact minimum application/ABAP releases remain pending. No SAP activation/runtime has been performed.
4. Verify permitted and restricted users and current-client behavior. No DCL is supplied. The helper checks S_TABU_NAM display authorization; this does not authorize every CDS extraction channel.
5. Export native consumption data with CDS aliases into customer/exports. Record system, client, export time and approved business population outside the CDS. Origin metadata is no longer an invented table key. The helper exports raw TABLE-FIELD columns, not consumption aliases or consumption filters.
6. Fill customer/selection with approved complete native keys. Empty selections yield zero rows. Run `python tools/migration_run.py --project customer/customer-cohort-project.json --out prepared`. The selection pipeline is not a business-state, dependency-closure or cutover calculation. Approve those separately.
8. Preserve EHS RECN/ACTN history and validity/deletion flags; no latest-record filter is asserted. Verify TM category constants and lifecycle scope. General case attributes include multiple case types. Payload absent from a native draft is pending, not successfully migrated.
9. Record activation, key uniqueness, authorization, extraction completeness, selection and source preparation in customer/TEST_RESULTS.csv. Real SAP evidence is required before acceptance.

Extraction views are read-only. No posting adapter or target business-object creation is supplied.
