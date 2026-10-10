# ModuPorter Extended Warehouse Management — native draft 0.2.0

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


# ModuPorter Transportation Management — native draft 0.2.0

This replaces the 0.1.0 staging architecture. Native SAP table → Basic → Composite → Consumption is supplied for documented structures. Target comparison views read native tables. No customer staging tables or write loaders are included.

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
3. Import SOURCE and TARGET into the appropriate systems and follow ACTIVATION_ORDER.txt. Native tables must already exist. Source uses classic CDS; target uses view entities. Exact minimum application/ABAP releases remain pending. No SAP activation/runtime has been performed.
4. Verify permitted and restricted users and current-client behavior. No DCL is supplied. The helper checks S_TABU_NAM display authorization; this does not authorize every CDS extraction channel.
5. Export native consumption data with CDS aliases into customer/exports. Record system, client, export time and approved business population outside the CDS. Origin metadata is no longer an invented table key. The helper exports raw TABLE-FIELD columns, not consumption aliases or consumption filters.
6. Fill customer/selection with approved complete native keys. Empty selections yield zero rows. Run `python tools/migration_run.py --project customer/customer-cohort-project.json --out prepared`. The selection pipeline is not a business-state, dependency-closure or cutover calculation. Approve those separately.
7. Export the same target population using native comparison views. Map changed business identifiers and regenerated UUIDs before comparing; retain an audit ledger. Native UUID equality across systems is not assumed. Use migration_prepare.py compare with the relevant mapping and view. Count views are broad candidate counts; apply the same population before using totals.
8. Preserve EHS RECN/ACTN history and validity/deletion flags; no latest-record filter is asserted. Verify TM category constants and lifecycle scope. General case attributes include multiple case types. Payload absent from a native draft is pending, not successfully migrated.
9. Record activation, key uniqueness, authorization, extraction completeness, selection and source/target comparison in customer/TEST_RESULTS.csv. Real SAP evidence is required before acceptance.

Extraction views are read-only. No posting adapter or target business-object creation is supplied.


# ModuPorter Financial Supply Chain Management — native draft 0.2.0

This replaces the 0.1.0 staging architecture. Native SAP table → Basic → Composite → Consumption is supplied for documented structures. Target comparison views read native tables. No customer staging tables or write loaders are included.

**Not a complete pack:** 6 native structure drafts; 8 pending structures. Native drafts also have pending payload listed in customer/native-coverage.json. Do not interpret a root/header projection as a complete business object.

| Structure | Status | Native table / candidate | Scope and pending work |
|---|---|---|---|
| CreditProfile | NATIVE_DRAFT | UKMBP_CMS | CLIENT is the implicit current-client field. Credit relationships remain pending. |
| CreditRelation | PENDING | BUT050 (credit-specific relationship selection unresolved) | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| CreditSegment | NATIVE_DRAFT | UKMBP_CMS_SGM | CreditLimit and its currency context require UKMCRED_SGM0C verification; no fictitious segment currency column is supplied. |
| CreditExposure | PENDING | UKM_TOTALS | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| CollectProfile | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| CollectSegment | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| CollectContact | NATIVE_DRAFT | UDM_CCT_ATTR | Contact attributes only; associated items and resubmissions remain pending. |
| CollectTask | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| PaymentPromise | NATIVE_DRAFT | UDM_P2P_ATTR | Financial amount annotations, logical-system naming and invoice relations require DDIC verification. Invoice number is not assumed to be a native attribute field. |
| PromiseItem | PENDING | Native case-to-invoice relations unresolved | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| DisputeCase | NATIVE_DRAFT | UDMCASEATTR00 | Financial dispute attributes; amount payload, item relations and attachments remain pending. |
| DisputeItem | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| CaseAttribute | NATIVE_DRAFT | SCMG_T_CASE_ATTR | One wide native record per case UUID; not synthetic attribute-name/value rows. Includes general cases, not only disputes; approve case-type scope. |
| CaseAttachment | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |

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


# ModuPorter Environment Health and Safety — native draft 0.2.0

This replaces the 0.1.0 staging architecture. Native SAP table → Basic → Composite → Consumption is supplied for documented structures. Target comparison views read native tables. No customer staging tables or write loaders are included.

**Not a complete pack:** 4 native structure drafts; 19 pending structures. Native drafts also have pending payload listed in customer/native-coverage.json. Do not interpret a root/header projection as a complete business object.

| Structure | Status | Native table / candidate | Scope and pending work |
|---|---|---|---|
| EHSLocation | PENDING | EHFNDD_LOC_ROOT; EHFNDD_LOC_REV | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| EHSLocHierarchy | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| ChemicalProp | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| PropertyUnit | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| Specification | NATIVE_DRAFT | ESTRH | Classic specification model. Preserve all change states; no unverified latest-record rule. |
| SpecIdentifier | NATIVE_DRAFT | ESTRI | Native short identifier only; long-text interfaces and effective parent change-state relations remain pending. |
| SpecProperty | PENDING | ESTVH; ESTVA; classification value relations unresolved | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| Phrase | NATIVE_DRAFT | ESTPH | Phrase header only. ESTPP multilingual text and graphics are pending; no invented Language key on the header. |
| PhraseSet | NATIVE_DRAFT | ESTPJ | Phrase-set assignment records; not the complete phrase-set definition. Preserve native record and change-state keys. |
| Incident | PENDING | EHHSSD_INC_ROOT; EHHSSD_INC_BINFA | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| IncidentPerson | PENDING | EHHSSD_INC_PINV | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| IncidentAction | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| RiskAssessment | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| RiskHazard | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| RiskControl | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| DataClassifier | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| DataCollection | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| Measurement | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| ComplianceReq | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| ComplianceScen | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| ComplianceLink | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| DangerousGoods | PENDING | EST0D | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| DGTransport | PENDING | EST0F | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |

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
