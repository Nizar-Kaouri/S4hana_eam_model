# Public native evidence — research 2026-10-11

Documentary field usage is distinct from exact DDIC key flags, installed application release and SAP runtime verification. SAP Community examples are firsthand code/technical discussion, not released SAP contracts.

## EHSLocation — PENDING

Location/revision tables documented through CDS sources, but plant/type/validity native field mapping and revision selection remain unresolved. A root identity projection would not complete location coverage.

https://help.sap.com/docs/sustainability-data-integration/b15a1be1941c44d4be60ba206536283d/d9e248b0ad88425fbea9284fd51d7.html

## EHSLocHierarchy — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## ChemicalProp — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## PropertyUnit — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## Specification — NATIVE_DRAFT

Classic specification model. Preserve all change states; no unverified latest-record rule.

https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/ff6d35a34fbe4bea99e4ac41b0d5db03/60a5ce5314894208e10000000a174cb4.html

## SpecIdentifier — NATIVE_DRAFT

Native short identifier only; long-text interfaces and effective parent change-state relations remain pending.

https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/ff6d35a34fbe4bea99e4ac41b0d5db03/63a5ce5314894208e10000000a174cb4.html

## SpecProperty — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## Phrase — NATIVE_DRAFT

Phrase header only. ESTPP multilingual text and graphics are pending; no invented Language key on the header.

https://help.sap.com/docs/SAP_ERP/c4e98fcb44e74814b58b61aefc1b1fcb/57a5ce5314894208e10000000a174cb4.html

## PhraseSet — NATIVE_DRAFT

Phrase-set assignment records; not the complete phrase-set definition. Preserve native record and change-state keys.

https://help.sap.com/docs/SAP_ERP/c4e98fcb44e74814b58b61aefc1b1fcb/57a5ce5314894208e10000000a174cb4.html

## Incident — NATIVE_DRAFT

Modern EHSM incident root only. Basic-info child cardinality, title, location and time-zone calculations remain pending. Preserve root UUID; no guessed join to multiply root rows.

https://help.sap.com/docs/EHSM/c2db47abe44e4aa7ab1be93e4c20ae18/d9eb3c50906ea902e10000000a44176f.html


https://community.sap.com/t5/enterprise-resource-planning-q-a/cds-view-fields-reuse/qaq-p/12485627

## IncidentPerson — PENDING

Person identity/name fields are resolved from HCM/business partners/users; roles come from a separate node. Native reference keys, role cardinality and person resolution remain pending.

https://help.sap.com/docs/EHSM/c2db47abe44e4aa7ab1be93e4c20ae18/8eec3c50906ea902e10000000a44176f.html

## IncidentAction — NATIVE_DRAFT

Separate EHSM action business-object root, not an incident child with a guessed PARENT_KEY. Action-to-incident/root-cause reference resolution and incident-only population remain pending. Broad action snapshot includes other reference origins. Title and resolved person names are extractor-derived and excluded.

https://help.sap.com/docs/EHSM/c2db47abe44e4aa7ab1be93e4c20ae18/55ea3c50906ea902e10000000a44176f.html?locale=en-US

## RiskAssessment — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## RiskHazard — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## RiskControl — PENDING

Extractor origin fields are derived/transient rather than a documented physical one-table schema. Native business-object node mapping remains unresolved.

https://help.sap.com/docs/EHSM/cfce61ea9ac64c53a591bfcd66d98f56/021df34fd9c2d247e10000000a44176f.html?version=4.0

## DataClassifier — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## DataCollection — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## Measurement — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## ComplianceReq — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## ComplianceScen — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## ComplianceLink — PENDING

Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.

## DangerousGoods — PENDING

Classic classification records and administration fields documented; material dangerous-goods master mapping, regulation references and complete classification payload remain unresolved.

https://help.sap.com/docs/SAP_ERP/c4f650e3b4ad4c68bcee599cd1d10b07/707fb6535fe6b74ce10000000a174cb4.html

## DGTransport — PENDING

Classic import-format documentation supports regulation/classification payload, but SUBIDREF is an import shorthand rather than established physical column. Complete reference keys and transport-mode mapping remain pending.

https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/ff6d35a34fbe4bea99e4ac41b0d5db03/6ea2ce5314894208e10000000a174cb4.html?version=2023.latest
