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
