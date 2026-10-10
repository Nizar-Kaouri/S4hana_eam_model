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
