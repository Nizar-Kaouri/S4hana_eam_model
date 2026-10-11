# ModuPorter Erweiterte Lagerverwaltung â€” nativer Entwurf 0.3.0

Ersetzt die Staging-Architektur von 0.1.0. Dokumentierte Strukturen folgen SAP-Systemtabelle â†’ Basic â†’ Composite â†’ Consumption. Zielvergleichsviews lesen native Tabellen. Keine kundeneigenen Stagingtabellen oder Ladeberichte.

**Paket noch unvollstÃ¤ndig:** 4 native StrukturentwÃ¼rfe; 12 offene Strukturen. Weitere fehlende Nutzdaten stehen in customer/native-coverage.json. Kopf-/Wurzelviews sind keine vollstÃ¤ndigen GeschÃ¤ftsobjekte.

## Vorgehen

Anwendung und Release feststellen: EWM ist nicht LE-WM, klassische EHS-Spezifikationen sind nicht moderne EHSM-VorfÃ¤lle. Tabellen, Felder und vollstÃ¤ndige DDIC-SchlÃ¼ssel in SE11/ADT prÃ¼fen; die gelieferten SchlÃ¼ssel sind ungetestete EntwÃ¼rfe. Den nativen Lesebericht zum Export der tatsÃ¤chlichen DDIC-Feldliste nutzen und migration_ddic.py ausfÃ¼hren. Keine erfundenen Metadaten als Nachweis verwenden.

Quell- und Zielpaket getrennt importieren und ACTIVATION_ORDER.txt befolgen. Native Tabellen mÃ¼ssen vorhanden sein. Klassische CDS-Views in der Quelle, View Entities im Ziel. Konkrete Mindestversionen und SAP-Aktivierung sind ungeprÃ¼ft. Erlaubte/eingeschrÃ¤nkte Benutzer sowie Mandantentrennung testen; keine DCL enthalten. S_TABU_NAM im Lesebericht schÃ¼tzt nicht automatisch alle CDS-Zugriffe.

Consumption-Daten mit CDS-Spaltennamen nach customer/exports exportieren. System, Mandant, Exportzeit und freigegebene Population separat protokollieren. Der Tabellenbericht exportiert Rohspalten und wendet keine Consumption-Filter an. VollstÃ¤ndige native SchlÃ¼ssel in customer/selection eintragen; leere Auswahl erzeugt null Zeilen. `python tools/migration_run.py --project customer/customer-cohort-project.json --out prepared` ausfÃ¼hren. Fachliche ZustÃ¤nde, Stichtag und Eltern-/Kindbeziehungen zusÃ¤tzlich prÃ¼fen.

Dieselbe Zielpopulation aus nativen Vergleichsviews exportieren. Neu erzeugte UUIDs und geÃ¤nderte Nummern vor dem Vergleich anhand einer geprÃ¼ften Zuordnung abgleichen; OriginalschlÃ¼ssel separat erhalten. Gleiche UUIDs in verschiedenen Systemen werden nicht vorausgesetzt. migration_prepare.py compare mit passendem Mapping und View nutzen. ZÃ¤hlviews zÃ¤hlen breite KandidatenbestÃ¤nde; dieselbe Population anwenden.

EHS-Ã„nderungsstÃ¤nde RECN/ACTN, GÃ¼ltigkeit und LÃ¶schkennzeichen erhalten. Kein ungeprÃ¼fter Filter auf den letzten Stand. TM-Kategorien und Lebenszyklus prÃ¼fen; allgemeine Fallattribute enthalten mehrere Fallarten. Fehlende Nutzdaten bleiben offen. Aktivierung, SchlÃ¼sseldeutigkeit, Berechtigungen, ExtraktionsvollstÃ¤ndigkeit und Vergleich in customer/TEST_RESULTS.csv mit tatsÃ¤chlichen SAP-Nachweisen dokumentieren.

Nur Leseextraktion; keine Buchungsadapter oder Anlage von ZielgeschÃ¤ftsobjekten.## Rechercheaktualisierung

7 native Entwürfe; 9 offene Strukturen. Öffentliche Quellen bestätigen Feldverwendung, keine kundenspezifischen DDIC-Schlüssel oder SAP-Aktivierung.
## Rechercheaktualisierung

7 native Entwürfe; 9 offene Strukturen. Öffentliche Quellen bestätigen Feldverwendung, keine kundenspezifischen DDIC-Schlüssel oder SAP-Aktivierung.

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


Tabellen, vollständige Schlüssel, Release, Aktivierung und Berechtigungen in SAP prüfen. Consumption mit CDS-Spaltennamen exportieren; freigegebene vollständige Schlüssel für Auswahl und Vergleich verwenden. UUID-Zuordnungen separat protokollieren. Keine SAP-Laufzeitprüfung durchgeführt.


See customer/native-coverage.json for remaining payload and PROVENANCE.md for evidence. No posting adapters.


# ModuPorter Transportmanagement — nativer Entwurf 0.3.0

Ersetzt die Staging-Architektur von 0.1.0. Dokumentierte Strukturen folgen SAP-Systemtabelle → Basic → Composite → Consumption. Zielvergleichsviews lesen native Tabellen. Keine kundeneigenen Stagingtabellen oder Ladeberichte.

## Rechercheaktualisierung

7 native Entwürfe; 12 offene Strukturen. Öffentliche Quellen bestätigen Feldverwendung, keine kundenspezifischen DDIC-Schlüssel oder SAP-Aktivierung.

| Structure | Status | Native table | Scope and remaining work |
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
| FreightUnit | NATIVE_DRAFT | /SCMTMS/D_TORROT | TOR root plus separately delivered native item/stop drafts; quantities, route traversal, stages and freight bookings remain pending. Verify category and lifecycle scope. |
| FreightUnitItem | NATIVE_DRAFT | /SCMTMS/D_TORITE | Native TOR items. Composite joins the delivered parent Basic on PARENT_KEY = DB_KEY and filters TOR_CAT FU. All item categories retained; product, quantity and unit payload remain pending. Parent UUID must be remapped with the target key ledger. |
| FreightUnitStop | NATIVE_DRAFT | /SCMTMS/D_TORSTP | Native TOR stops filtered through the parent category FU. STOP_ID is not a reliable route sequence; STOP_SEQ_POS classifies first/intermediate/last. Ordered route traversal needs STOP_SUCCESSOR and remains pending. Stop locations and dates remain pending. |
| FreightOrder | NATIVE_DRAFT | /SCMTMS/D_TORROT | TOR root plus separately delivered native item/stop drafts; quantities, route traversal, stages and freight bookings remain pending. Verify category and lifecycle scope. |
| FreightOrdItem | NATIVE_DRAFT | /SCMTMS/D_TORITE | Native TOR items. Composite joins the delivered parent Basic on PARENT_KEY = DB_KEY and filters TOR_CAT TO. All item categories retained; product, quantity and unit payload remain pending. Parent UUID must be remapped with the target key ledger. |
| FreightOrdStop | NATIVE_DRAFT | /SCMTMS/D_TORSTP | Native TOR stops filtered through the parent category TO. STOP_ID is not a reliable route sequence; STOP_SEQ_POS classifies first/intermediate/last. Ordered route traversal needs STOP_SUCCESSOR and remains pending. Stop locations and dates remain pending. |
| FreightStage | PENDING | /SCMTMS/D_TORSTS | STOP_SUCCESSOR existence documented. Exact predecessor/successor native fields, keys and stage interpretation unresolved; STOP_ID order is not a substitute. |
| FreightSettle | PENDING | /SCMTMS/D_SF_ROT | Native settlement-root table and several attributes documented; full key schema, amount/currency relations and settlement item joins still unresolved. |
| SettleItem | PENDING | /SCMTMS/D_SF_ITM | Settlement item schema and root relationship require native field/key evidence. No guessed SFIR table names used. |


Tabellen, vollständige Schlüssel, Release, Aktivierung und Berechtigungen in SAP prüfen. Consumption mit CDS-Spaltennamen exportieren; freigegebene vollständige Schlüssel für Auswahl und Vergleich verwenden. UUID-Zuordnungen separat protokollieren. Keine SAP-Laufzeitprüfung durchgeführt.


See customer/native-coverage.json for remaining payload and PROVENANCE.md for evidence. No posting adapters.


# ModuPorter Finanzielles Supply Chain Management — nativer Entwurf 0.3.0

Ersetzt die Staging-Architektur von 0.1.0. Dokumentierte Strukturen folgen SAP-Systemtabelle → Basic → Composite → Consumption. Zielvergleichsviews lesen native Tabellen. Keine kundeneigenen Stagingtabellen oder Ladeberichte.

## Rechercheaktualisierung

7 native Entwürfe; 7 offene Strukturen. Öffentliche Quellen bestätigen Feldverwendung, keine kundenspezifischen DDIC-Schlüssel oder SAP-Aktivierung.

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


Tabellen, vollständige Schlüssel, Release, Aktivierung und Berechtigungen in SAP prüfen. Consumption mit CDS-Spaltennamen exportieren; freigegebene vollständige Schlüssel für Auswahl und Vergleich verwenden. UUID-Zuordnungen separat protokollieren. Keine SAP-Laufzeitprüfung durchgeführt.


See customer/native-coverage.json for remaining payload and PROVENANCE.md for evidence. No posting adapters.


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
