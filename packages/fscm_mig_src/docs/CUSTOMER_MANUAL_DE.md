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
