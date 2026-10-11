# ModuPorter Erweiterte Lagerverwaltung — nativer Entwurf 0.3.0

Ersetzt die Staging-Architektur von 0.1.0. Dokumentierte Strukturen folgen SAP-Systemtabelle → Basic → Composite → Consumption. Zielvergleichsviews lesen native Tabellen. Keine kundeneigenen Stagingtabellen oder Ladeberichte.

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
