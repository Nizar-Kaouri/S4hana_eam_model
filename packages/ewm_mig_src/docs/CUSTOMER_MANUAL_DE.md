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
