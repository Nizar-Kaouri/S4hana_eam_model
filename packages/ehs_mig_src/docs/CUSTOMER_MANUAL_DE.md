# ModuPorter Umwelt Gesundheit und Sicherheit — nativer Entwurf 0.3.0

Ersetzt die Staging-Architektur von 0.1.0. Dokumentierte Strukturen folgen SAP-Systemtabelle → Basic → Composite → Consumption. Zielvergleichsviews lesen native Tabellen. Keine kundeneigenen Stagingtabellen oder Ladeberichte.

## Rechercheaktualisierung

6 native Entwürfe; 17 offene Strukturen. Öffentliche Quellen bestätigen Feldverwendung, keine kundenspezifischen DDIC-Schlüssel oder SAP-Aktivierung.

| Structure | Status | Native table | Scope and remaining work |
|---|---|---|---|
| EHSLocation | PENDING | EHFNDD_LOC_ROOT; EHFNDD_LOC_REV | Location/revision tables documented through CDS sources, but plant/type/validity native field mapping and revision selection remain unresolved. A root identity projection would not complete location coverage. |
| EHSLocHierarchy | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| ChemicalProp | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| PropertyUnit | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| Specification | NATIVE_DRAFT | ESTRH | Classic specification model. Preserve all change states; no unverified latest-record rule. |
| SpecIdentifier | NATIVE_DRAFT | ESTRI | Native short identifier only; long-text interfaces and effective parent change-state relations remain pending. |
| SpecProperty | PENDING | ESTVH; ESTVA; classification value relations unresolved | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| Phrase | NATIVE_DRAFT | ESTPH | Phrase header only. ESTPP multilingual text and graphics are pending; no invented Language key on the header. |
| PhraseSet | NATIVE_DRAFT | ESTPJ | Phrase-set assignment records; not the complete phrase-set definition. Preserve native record and change-state keys. |
| Incident | NATIVE_DRAFT | EHHSSD_INC_ROOT | Modern EHSM incident root only. Basic-info child cardinality, title, location and time-zone calculations remain pending. Preserve root UUID; no guessed join to multiply root rows. |
| IncidentPerson | PENDING | EHHSSD_INC_PINV; EHHSSD_INC_PROLE | Person identity/name fields are resolved from HCM/business partners/users; roles come from a separate node. Native reference keys, role cardinality and person resolution remain pending. |
| IncidentAction | NATIVE_DRAFT | EHHSSD_IAC_ROOT | Separate EHSM action business-object root, not an incident child with a guessed PARENT_KEY. Action-to-incident/root-cause reference resolution and incident-only population remain pending. Broad action snapshot includes other reference origins. Title and resolved person names are extractor-derived and excluded. |
| RiskAssessment | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| RiskHazard | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| RiskControl | PENDING | Transient EHSM risk-control extractor | Extractor origin fields are derived/transient rather than a documented physical one-table schema. Native business-object node mapping remains unresolved. |
| DataClassifier | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| DataCollection | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| Measurement | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| ComplianceReq | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| ComplianceScen | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| ComplianceLink | PENDING | Not yet established | Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied. |
| DangerousGoods | PENDING | EST0D | Classic classification records and administration fields documented; material dangerous-goods master mapping, regulation references and complete classification payload remain unresolved. |
| DGTransport | PENDING | EST0F | Classic import-format documentation supports regulation/classification payload, but SUBIDREF is an import shorthand rather than established physical column. Complete reference keys and transport-mode mapping remain pending. |


Tabellen, vollständige Schlüssel, Release, Aktivierung und Berechtigungen in SAP prüfen. Consumption mit CDS-Spaltennamen exportieren; freigegebene vollständige Schlüssel für Auswahl und Vergleich verwenden. UUID-Zuordnungen separat protokollieren. Keine SAP-Laufzeitprüfung durchgeführt.


See customer/native-coverage.json for remaining payload and PROVENANCE.md for evidence. No posting adapters.
