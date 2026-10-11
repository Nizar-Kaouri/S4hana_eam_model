# ModuPorter Financial Supply Chain Management — native draft 0.3.0

This replaces the 0.1.0 staging architecture. Native SAP table → Basic → Composite → Consumption is supplied for documented structures. No customer staging tables or write loaders are included.

## Research update

7 native drafts; 7 pending structures. Public documents establish field usage, not customer DDIC flags or SAP activation.

| Structure | Status | Native table | Scope and remaining work |
|---|---|---|---|
| CreditProfile | NATIVE_DRAFT | UKMBP_CMS | CLIENT is the implicit current-client field. Credit relationships remain pending. |
| CreditRelation | PENDING | BUT050 (credit-specific relationship selection unresolved) | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| CreditSegment | NATIVE_DRAFT | UKMBP_CMS_SGM | CreditLimit currency context remains pending: extractor documentation names segment CURRENCY while other releases use UKMCRED_SGM0C currency customizing. Resolve this release-specific contradiction before projecting amounts. |
| CreditExposure | NATIVE_DRAFT | UKM_TOTALS | Native liability snapshot in stored currency; not a delta feed or posting payload. Declared grain including currency is a DDIC candidate. Derived currency-type and message-party fields are excluded; cross-segment/report-currency aggregation remains pending. |
| CollectProfile | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| CollectSegment | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| CollectContact | NATIVE_DRAFT | UDM_CCT_ATTR | Contact attributes only; associated items and resubmissions remain pending. |
| CollectTask | PENDING | UDM_WL_ITEM is worklist, not a proven resubmission/task table | Public worklist fields do not establish the planned resubmission/follow-up task structure; substituting another business object would change scope. |
| PaymentPromise | NATIVE_DRAFT | UDM_P2P_ATTR | Documented native financial attributes with amounts and stored currency. Invoice/item relationships remain pending; compare currencies unchanged. Auto-written-off field naming conflicts across sources and is excluded. |
| PromiseItem | PENDING | Native case-to-invoice relations unresolved | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| DisputeCase | NATIVE_DRAFT | UDMCASEATTR00 | Documented native financial attributes with amounts and stored currency. Invoice/item relationships remain pending; compare currencies unchanged. Auto-written-off field naming conflicts across sources and is excluded. |
| DisputeItem | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| CaseAttribute | NATIVE_DRAFT | SCMG_T_CASE_ATTR | One wide native record per case UUID; not synthetic attribute-name/value rows. Includes general cases, not only disputes; approve case-type scope. |
| CaseAttachment | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |

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


See customer/native-coverage.json for remaining payload and PROVENANCE.md for evidence. No posting adapters.
