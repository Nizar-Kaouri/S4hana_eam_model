# ModuPorter EAM Kundendokumentation

ECC und S4HANA Migration und Kundenprüfung

Version 1.0.0-rc.1 • 10. Oktober 2026 • 

Dieses Handbuch führt SAP Fachberater und ABAP Entwickler durch Installation, Extraktion, Stichtagsaufbereitung und Abgleich des ModuPorter EAM Pakets. Beginnen Sie mit dem mitgelieferten lokalen Beispiel und prüfen Sie anschließend die Vorlagen in einer SAP Entwicklungsumgebung. Eine erfolgreiche SAP Aktivierung oder Beladung ist für diesen Release Candidate noch nicht nachgewiesen.

| Lieferumfang | Umfang |
| --- | --- |
| ECC CDS | 158 Views in 15 Modulen |
| Extraktion | 41 Strukturen, 14 Zählviews, 440 zugeordnete Felder |
| S4HANA | 16 Vergleichs und Zählviews in 8 Modulen |
| Aufbereitung | 15 Stichtagsverträge, Elternkohorten, Joins und Servicepakete |
| ABAP | 2 optionale Berichte für vollständige Tabellen und Langtexte |
| Spezialdaten | 31 Tabellen im ergänzenden DDIC Exportinventar |

## Verantwortung und Freigabestatus

Der Kunde liefert die ausgewählte Objektmenge, bestätigte DDIC Definitionen, SAP native ECM Gültigkeitsentscheidungen, Umsetzungen alter auf neue IDs und die Zielbeladung einschließlich Transaktionen und Fehlerbehandlung. Feldzuordnungen nennen vorläufige Tabellenreferenzen; sie ersetzen keine freigegebene Posting Schnittstelle.

64 lokale Regressionstests und die Paketprüfungen wurden bestanden. Sie belegen keine SAP Laufzeitkompatibilität. 97 offene ECC Prüfmarkierungen und 9 S4 Prüfmarkierungen sind im Ausgangsstand dokumentiert; Berichte benötigen zusätzliche DDIC und Laufzeitprüfungen.

Technischer Ausgangsstand: cc08609d92e6a623412c395f0fac4d6205cf376f

## VDM Architektur und Module

Die Architektur folgt den Modulmanifesten: SAP Quelle → Basic → Composite → Consumption. Basic kapselt direkte Quellen, Composite verbindet oder selektiert Daten und Consumption stellt Extraktionsverträge oder Zählungen bereit. Beide Quellschichten können ZEMX_I_ verwenden; der Name allein bestimmt die Schicht nicht. ZEMT_ gehört ausschließlich zum Zielbegleiter.

| Modul | Fachobjekt | Views |
| --- | --- | --- |
| classification | Klassifizierung | 8 |
| core | Gemeinsame technische Referenzen | 6 |
| equipment | Equipment | 10 |
| equipment_bom | Equipmentstücklisten | 13 |
| functional_location | Technische Plätze | 9 |
| long_text | Langtextindex | 3 |
| maintenance_notification | Instandhaltungsmeldungen | 17 |
| maintenance_order | Instandhaltungsaufträge | 19 |
| maintenance_plan | Wartungspläne | 11 |
| measurement_document | Messbelege | 7 |
| measuring_point | Messpunkte | 4 |
| object_partner | Objektpartner | 3 |
| object_status | Objektstatus | 6 |
| task_list | Instandhaltungsarbeitspläne | 27 |
| work_center | Arbeitsplätze | 15 |

## Diagramm und Objektkatalog

Das separate VDM Diagramm enthält alle 174 ausgelieferten CDS Views, ihre direkten Datenquellen, Associations, Schlüssel und Prüfmarkierungen. Wählen Sie ein Objekt, um seine Abhängigkeiten hervorzuheben. Die ergänzenden Tabellen, Berichte und Python Werkzeuge sind getrennt gekennzeichnet. Die Beziehungen zeigen Datenherkunft, keine freigegebene Ladefolge.

Der S4 Begleiter deckt Hauptobjekte ab. Für weitere Kindstrukturen exportiert der Kunde entsprechende Ziel CSVs mit kanonischen Aliasnamen. Details je View stehen in docs/views; der vollständige maschinenlesbare Katalog steht in moduporter-eam-object-catalog.csv.

## Installation und Berechtigungen

1. Entpacken Sie das äußere Kundenpaket. Importieren Sie dieses Archiv nicht direkt in SAP. Lesen Sie START_HERE.md, docs/SUPPORTED_SCOPE.md und die Lizenz.

1. Prüfen Sie BUILD_MANIFEST.json, OPEN_CHECKS.md und DDIC_REQUIREMENTS.csv im ECC Archiv. ECC 6.0 mit NetWeaver 7.40 SP08 oder höher ist eine Annahme und muss für Ihr System bestätigt werden.

1. Legen Sie in ECC ein Entwicklungspaket mit Transport an. Importieren Sie src über abapGit und aktivieren Sie nach ACTIVATION_ORDER.txt. Association Zyklen können eine gemeinsame Aktivierung erfordern. Standardpräfix und Paket sind ZEMX_ und ZEMX_MIG.

1. Installieren Sie den getrennten S4 Begleiter im Zielsystem unter ZEMT_ und ZEMT_MIG. S4HANA 2025 On Premise oder Private Edition ist die angenommene Basis. Verfügbarkeit und Freigabestatus der referenzierten SAP Views sind zu prüfen.

1. Erstellen Sie die zwei optionalen Dateien aus helpers als ausführbare SE38 Berichte. Sie liegen bewusst außerhalb von src und werden nicht mit den CDS Views importiert.

1. Prüfen Sie jeden TODO gegen DDIC, Funktionsbausteinsignaturen und das reale Posting Interface. Dokumentieren Sie Befund und Änderung, statt einen Feldnamen zu erraten.

## Zugriff prüfen

Die Migrationsviews besitzen absichtlich keine DCL. Prüfen Sie den tatsächlich verwendeten SQL, RFC oder Exportkanal mit berechtigten und eingeschränkten Benutzern. S_TABU_NAM schützt nicht automatisch jeden eigenen Leser. Der Tabellenbericht prüft explizit S_TABU_NAM mit ACTVT 03; beim Langtextbericht ist zusätzlich das Verhalten von READ_TEXT zu prüfen. Die Berichte verwenden den aktuellen Mandanten und einen interaktiven SAP GUI Dateiexport.

## Erster lokaler Test


```text
python tools/eam_run.py --project customer/examples/workflow.json --out trial-example
```

Python 3.10 oder höher genügt; keine zusätzlichen Python Pakete sind erforderlich. Erwartet werden ein Equipmentsegment für Werk 2000, ein Arbeitsplankopf und zwei verschachtelte Servicezeilen. PREPARATION_AUDIT.json enthält Prüfsummen und Zeilenzahlen. Wählen Sie bei jedem Lauf ein neues Ausgabeverzeichnis.

## Stichtag und Objektumfang

CDS Views mit höchstem gespeichertem Zähler oder offenem Equipmentsegment zeigen eine vorgefilterte Sicht. Für einen historischen Stichtag müssen vollständige Rohhistorien exportiert werden. Das nachträgliche Entfernen zukünftiger Zeilen stellt bereits verworfene ältere Zustände nicht wieder her.

1. Vereinbaren Sie Stichtag, Mandant, ausgewählte Hauptobjekte und vorhandene Zielreferenzen. Bewahren Sie interne IDs und führende Nullen.

1. Exportieren Sie vollständige relevante Tabellenzustände. Bestätigen Sie alle 15 snapshot Verträge unter customer/contracts gegen die tatsächlichen Identitätsspalten und Gültigkeitsregeln.

1. Ergänzen Sie bei Änderungsnummern für jeden Zustand Eligible=Y/N aus der nativen SAP ECM Bewertung. Datum, Änderungsstatus und Effektivitätsparameter müssen zum Projekt passen. Unbewertete Zustände werden abgewiesen.

1. Wählen Sie den gültigen Zustand vor der Löschprüfung. Datumsgrenzen sind einschließlich. Überlappende Intervalle und mehrdeutige Ränge führen zum Fehler; ein gelöschter jüngster Zustand reaktiviert keinen Vorgänger. Stornierte Messbelege werden vor der Auswahl ausgeschlossen.

1. Verbinden Sie ausgewählte EQUZ Segmente mit EQUI, ILOA und CRHD sowie PLAS Zuordnungen mit PLPO Details anhand aller Identitätsspalten. Der Join muss many to one sein. Verwaiste Datensätze und Aliaskollisionen werden abgewiesen.

1. Filtern Sie alle Kindstrukturen auf die ausgewählten Eltern. structure-cohorts.json umfasst alle 41 Strukturen. Für Klassifizierung, Status, Partner und Texte sind ausdrücklich typisierte bzw. vollständige Schlüssel nötig.

## Stücklisten und technische IDs

Wählen Sie STKO und STAS/STPO getrennt zum Stichtag. EQST bestimmt Equipment, Werk, Verwendung und Alternative; die überlebenden STAS Zeilen bestimmen die STPO Knoten. STLNR allein reicht nicht zur Abgrenzung von Alternativen. reference_keys erzeugt Referenzmengen und dedupliziert keine Nutzdaten. Halten Sie Umsetzungen für Operationsknoten, Stücklisten, Kapazitäten, Klassifizierung, Abrechnung und Servicepakete fest.


```text
python tools/eam_prepare.py snapshot --input equz.csv
  --contract customer/contracts/equz-snapshot.json
  --cutover 20261010 --out equz_at_cutover.csv
```

Mehrzeilige Befehle sind zur Lesbarkeit umgebrochen und müssen als eine Zeile ausgeführt werden.

## Spezialdaten und Langtexte

Spezialdaten werden über vollständige DDIC Exporte und Aufbereitungsrezepte geliefert. Die Tabellenliste bezeichnet die vorgesehene Abdeckung; tatsächliche Verfügbarkeit und Schlüssel müssen im Kundensystem bestätigt werden.

| Gruppe | Tabellen |
| --- | --- |
| Kapazitäten | KAKO, KAKT, KAZY, KAPA, KAPE |
| Schichtkalender | T550A, T550P |
| Formeln und Vorgaben | TC20, TC20T, TC21, TC21T, TC25, TC25T, CRHD |
| Arbeitsplanbeziehungen | PLAB, PLFL |
| Servicepakete | ESLH, ESLL, ESUH, ESUC, ESUP, ESUS |
| Objektabhängigkeiten | CUOB, CUKB, CUKT, CUKN, CUXREF, CABN, CABNT, CAWN, CAWNT |

## Vollständiger Tabellenexport

ZEMX_EAM_TABLE_EXPORT exportiert alle DDIC Felder und eine benachbarte .fields.csv mit Schlüsseln, Typen, Längen und Dezimalstellen. P_TABLE muss in der Allowlist stehen. P_FIELD und P_KEYS werden gemeinsam angegeben; der Filter unterstützt CHAR oder NUMC und eine UTF8 Datei mit einem internen Schlüssel je Zeile ohne Kopfzeile. Zusammengesetzte Schlüssel sind zusätzlich über Kohorten zu filtern.

P_FILE bezeichnet eine neue lokale CSV Datei. P_MAX ist standardmäßig 10000 und höchstens 1000000. Bei Überschreitung wird kein abgeschnittener Export geschrieben. Prüfen Sie Dezimalzahlen, Fließkomma und Binärdarstellungen gegen DDIC. Der Bericht dekodiert keine Abhängigkeitsquellen und schreibt keine Zieltabellen.

## Langtextinhalt und Servicepakete


```text
python tools/eam_prepare.py text-keys --input selected_text_index.csv
  --out selected_text_keys.tsv
```

Der Langtextindex liefert nur Schlüssel. Übergeben Sie die ausgewählte TSV an ZEMX_EAM_TEXT_EXPORT. READ_TEXT erhält Reihenfolge, Sprache und SAPscript Format; leere Texte haben LineNumber 0. Ein fehlender oder fehlerhafter Text verhindert die Veröffentlichung des gesamten Inhalts. Die Zielanlage erfolgt im Kundenladeprogramm. Vergleichen Sie Format und Text einschließlich signifikanter Leerzeichen.

Starten Sie Servicepakete mit Referenzen der ausgewählten Operationen und verfolgen Sie ESLL.SUB_PACKNO rekursiv. Fehlende Unterpakete oder Zyklen führen zum Fehler. Prüfen Sie Kalender, Formeln, Abhängigkeiten und beide Seiten von Operationsbeziehungen als referenzierte Daten; kopieren Sie Customizing nicht pauschal.

## Aufbereitung und Abgleich

eam_run.py führt ein JSON Projekt mit snapshot, cohort, join, aliases, closure und reference_keys aus. Der Lauf prüft alle Schritte vor Veröffentlichung in einem neuen Verzeichnis. eam_prepare.py führt einzelne Schritte und Abgleiche aus. mig_reconcile.py vergleicht Hauptobjekte und Zählungen anhand der Modulzuordnungen.

## Kanonische Struktur vergleichen


```text
python tools/eam_prepare.py compare --input ecc_items.csv
  --target s4_items.csv
  --mapping mapping/maintenance_notification/mapping.json
  --view ZEMX_C_MaintNotifItemMig --out item_report.md
```

Alle 41 kanonischen Strukturen können verglichen werden. Ziel CSVs benötigen die dokumentierten Aliasnamen. Nutzen Sie --fields nur für eine ausdrücklich begründete Teilmenge und dokumentieren Sie ausgelassene Felder. --maps <folder> --translate wendet bestätigte Umsetzungen an. Die Beispieldateien sind keine Produktivzuordnungen.

## Rohdaten und Langtexte vergleichen


```text
python tools/eam_prepare.py compare-raw --input ecc_kapa.csv
  --target s4_kapa.csv --schema ecc_kapa.csv.fields.csv
  --out capacity_report.md
python tools/eam_prepare.py compare-raw --input ecc_texts.csv
  --target s4_texts.csv --schema customer/contracts/long-text.fields.csv
  --contract customer/contracts/long-text-compare.json --out text_report.md
```

Der Rohvergleich nutzt exportierte DDIC Schlüssel ohne MANDT und fordert alle Quellfelder im Ziel. Wenn technische IDs geändert wurden, definieren Sie einen bestätigten Business Key Vertrag und die erforderlichen Umsetzungen. Es wird keine gemeinsame Feldteilmenge stillschweigend ausgewählt. Langtexte verwenden geordnete Textschlüssel und einen Vergleich mit unveränderten Leerzeichen.

## CSV und Ergebnisinterpretation

CSV Dateien brauchen eine Kopfzeile, eindeutige Spalten und passende Zeilenbreite. Auch ein leerer Export benötigt die Kopfzeile. Doppelte Schlüssel und Kollisionen nach Umsetzung sind Eingabefehler. Führende Nullen bleiben erhalten; --strip-zeros ist keine allgemeine Lösung. Zählwerte müssen endliche, nichtnegative ganze Zahlen sein. Beim Abgleich bedeutet Exitcode 0 keine Differenzen, 1 Differenzen und 2 einen Eingabe oder Aufruffehler. Zwei leere Mengen beweisen keine erfolgreiche Extraktion.

## Kundenprüfung und Fehlerbehebung

1. Erfassen Sie ECC und S4 Release, Support Packages, Mandant, Transport, Präfix, Revision und Stichtag.

1. Protokollieren Sie Aktivierung und DDIC Abweichungen für jedes relevante Objekt. Prüfen Sie Schlüssel, Löschung, Zeitgültigkeit, Elternumfang, Dezimalstellen und Einheiten.

1. Testen Sie berechtigte und eingeschränkte Identitäten sowie Unicode, CSV Quoting, führende Nullen, leere Mengen, Storno und die Überschreitung von Exportgrenzen.

1. Führen Sie eine Probebeladung über das kundeneigene Interface aus. Prüfen Sie Fehlerbehandlung, Commit, Wiederanlauf und alte auf neue IDs, bevor Sie erneut extrahieren.

1. Füllen Sie TEST_RESULTS.csv mit PASS, FAIL, BLOCKED, NOT_TESTED oder NOT_APPLICABLE und einem Nachweis bzw. Grund. Legen Sie Reports, Hashes und anonymisierte Abweichungen bei.

| Befund | Nächster Schritt |
| --- | --- |
| DDIC / Aktivierung | Originalmeldung sichern; DDIC oder SAP View prüfen; Anpassung dokumentieren. |
| Doppelter Schlüssel | Identität, Join, Versionszustand und Umsetzung prüfen; keine Nutzdaten deduplizieren. |
| Eligible fehlt | Native SAP ECM Bewertung ergänzen; Effektivitätsgrenzen dokumentieren. |
| Leerer Export | Auswahl, Berechtigung, Mandant und Löschfilter prüfen; fachliche Leerheit nachweisen. |
| Zieldifferenz | Scope, Ladeprotokoll, Feldumsetzung und technische ID Map prüfen. |

## Lizenz und Abnahme

Die beigefügte LICENSE.md erlaubt unbegrenzte Nutzung und Änderung, einschließlich Kundenimplementierungen, und untersagt den eigenständigen Weiterverkauf der Bibliothek. Die Datei ist für die konkreten Bedingungen maßgeblich. SAP Rechte, kundeneigene Schnittstellen und Projektfreigaben sind separat zu klären. Es wird keine SAP Zertifizierung, Wartung oder erfolgreiche Zielbeladung zugesagt.

Ändern Sie den Status draft-unverified erst nach belegter Systemprüfung. Offene Befunde müssen im Testprotokoll sichtbar bleiben. Eine endgültige Kundenabnahme setzt die dokumentierte Prüfung der tatsächlich benötigten Objekte und Ladeprozesse voraus.

## Kanonische Extraktionsstrukturen 1

Diese 41 Strukturen stammen aus den Modulzuordnungen. Die Feldanzahl umfasst Schlüssel und Nutzfelder. Die vollständigen Schlüssel und Regeln stehen in mapping/<module>/mapping.json und FIELD_CATALOG.csv; die View ist kein Posting API.

| Extraktionsview | Modul | Felder |
| --- | --- | --- |
| ZEMX_C_CharcValueMig | classification | 8 |
| ZEMX_C_ClassAssignmentMig | classification | 4 |
| ZEMX_C_EquipSerialStockMig | equipment | 5 |
| ZEMX_C_EquipmentMig | equipment | 44 |
| ZEMX_C_EquipmentTextMig | equipment | 3 |
| ZEMX_C_BOMHeaderMig | equipment_bom | 8 |
| ZEMX_C_BOMItemMig | equipment_bom | 11 |
| ZEMX_C_BOMSelectionMig | equipment_bom | 7 |
| ZEMX_C_EquipBOMAssignMig | equipment_bom | 5 |
| ZEMX_C_FuncLocLabelMig | functional_location | 4 |
| ZEMX_C_FuncLocMig | functional_location | 29 |
| ZEMX_C_FuncLocTextMig | functional_location | 3 |
| ZEMX_C_LongTextIndexMig | long_text | 4 |
| ZEMX_C_MaintNotifItemMig | maintenance_notification | 7 |
| ZEMX_C_MaintNotificationMig | maintenance_notification | 27 |
| ZEMX_C_NotifActivityMig | maintenance_notification | 8 |
| ZEMX_C_NotifCauseMig | maintenance_notification | 6 |
| ZEMX_C_NotifTaskMig | maintenance_notification | 11 |
| ZEMX_C_MaintOrderComponentMig | maintenance_order | 12 |
| ZEMX_C_MaintOrderMig | maintenance_order | 28 |
| ZEMX_C_MaintOrderOperationMig | maintenance_order | 13 |

## Kanonische Extraktionsstrukturen 2

Diese 41 Strukturen stammen aus den Modulzuordnungen. Die Feldanzahl umfasst Schlüssel und Nutzfelder. Die vollständigen Schlüssel und Regeln stehen in mapping/<module>/mapping.json und FIELD_CATALOG.csv; die View ist kein Posting API.

| Extraktionsview | Modul | Felder |
| --- | --- | --- |
| ZEMX_C_OrderPermitMig | maintenance_order | 3 |
| ZEMX_C_OrderSettlementMig | maintenance_order | 19 |
| ZEMX_C_MaintPlanCycleMig | maintenance_plan | 6 |
| ZEMX_C_MaintenanceItemMig | maintenance_plan | 18 |
| ZEMX_C_MaintenancePlanMig | maintenance_plan | 17 |
| ZEMX_C_MeasReadingMig | measurement_document | 10 |
| ZEMX_C_MeasuringPointMig | measuring_point | 17 |
| ZEMX_C_ObjectPartnerMig | object_partner | 5 |
| ZEMX_C_UserStatusMig | object_status | 4 |
| ZEMX_C_TaskListAllocationMig | task_list | 8 |
| ZEMX_C_TaskListCompMig | task_list | 10 |
| ZEMX_C_TaskListMig | task_list | 14 |
| ZEMX_C_TaskListOperationMig | task_list | 17 |
| ZEMX_C_TaskListPRTMig | task_list | 9 |
| ZEMX_C_TaskListPackageMig | task_list | 6 |
| ZEMX_C_CapacityHeaderMig | work_center | 3 |
| ZEMX_C_WorkCenterCapacityMig | work_center | 8 |
| ZEMX_C_WorkCenterCostCtrMig | work_center | 8 |
| ZEMX_C_WorkCenterMig | work_center | 7 |
| ZEMX_C_WorkCenterTextMig | work_center | 4 |

## Weiterführende Paketdateien

docs/CUSTOMER_WORKFLOW.md • docs/CUSTOMER_TEST.md • docs/KNOWN_LIMITATIONS.md • docs/COMPATIBILITY.md • helpers/README.md • customer/contracts/structure-cohorts.json • customer/contracts/extension-inventory.json • docs/views • FIELD_CATALOG.csv • DDIC_REQUIREMENTS.csv • OPEN_CHECKS.md

