# ModuPorter SAP Domain Migration Guides DE

Version 0.2.0. Eight domain drafts. No SAP runtime validation.


# ModuPorter Asset Accounting Migrationspaket

Dieses Paket enthält Entwürfe für die Extraktion aus ECC, die Aufbereitung und den Vergleich mit S/4HANA. Es wurde noch nicht in SAP aktiviert oder getestet. Es liefert keinen Ladeprozess.

## Aufbau

Die Basic Schicht liest Kandidaten mit ihrem ursprünglichen Tabellenschlüssel. Die Composite Schicht legt die Feldnamen fest. Die Consumption Schicht stellt getrennte Strukturen für Kopf und Detail bereit. Unterstützte Objekte und Feldzuordnungen stehen in SUPPORTED_SCOPE.md und mapping. Historische Daten sind Referenzen und dürfen nicht automatisch erneut gebucht werden.

## Vorgehen

Prüfen Sie Release, Mandant, Berechtigungen, DDIC Schlüssel und Zielfelder. Aktivieren Sie die Objekte in der gelieferten Reihenfolge. Exportieren Sie UTF-8 CSV Dateien mit internen Schlüsseln und führenden Nullen. Legen Sie einen fachlich freigegebenen Stichtag fest. Tragen Sie die vollständigen freigegebenen Schlüssel jeder Struktur in customer/selection ein. Leere Dateien liefern keine aufbereiteten Zeilen. Prüfen Sie abhängige Details gegen ihre freigegebenen Eltern.

Lösen Sie Zeitintervalle und Änderungsstände vor der Schlüsselfreigabe auf. NativeEligible benötigt eine geprüfte Auswertung in SAP. Führen Sie `python tools/migration_run.py --project customer/customer-cohort-project.json --out prepared` mit einem neuen Ausgabeverzeichnis aus. Übertragen Sie ausschließlich fachlich freigegebene Daten über eine unterstützte Zielschnittstelle. Protokollieren Sie neue Nummern und Fehler.

Exportieren Sie dieselbe Zielpopulation mit den Namen und Schlüsseln aus customer/target-adapters.json. Vergleichen Sie jede relevante Struktur mit migration_prepare.py compare und der passenden mapping.json. Die CDS Zählansicht zählt ungefilterte Kandidaten; für die Abnahme sind die aufbereiteten Daten maßgeblich. Gleiche Zeilenanzahlen allein sind kein Nachweis. Prüfen Sie Beträge, Vorzeichen, Währungen, Mengeneinheiten und Rundung fachlich.

## Grenzen und Abnahme

Abschreibungsbereiche, Geschäftsjahre und Übernahmedatum müssen feststehen. ANLC ist keine fertige Buchungsdatei. Anlagenbestände dürfen nicht zusätzlich als Sachkontenanfangsbestand übernommen werden. Universal Parallel Accounting benötigt eine gesonderte Schnittstellenprüfung.

Unterstützende Strukturen haben CSV Vergleichsverträge; dafür werden keine ungeprüften SAP CDS Namen als fertige Schnittstellen behauptet. Testen Sie Berechtigungen, geänderte Nummern, fehlende Felder, doppelte Schlüssel und abgewiesene Buchungen. Archivieren Sie Prüfberichte, Eingabehashes, Anwendungsprotokolle und die fachliche Freigabe. Diese Entwürfe sind noch keine SAP geprüften verkaufsfertigen Pakete.

## Beträge und Mengen

Das Werkzeug migration_business.py totals verwendet Dezimalarithmetik und getrennte Währungs oder Einheitengruppen. Doppelte Schlüssel, unbekannte Vorzeichen und ungültige Zahlen werden abgewiesen. Passen Sie currency-totals-example.json an Ihre geprüften Felder, Vorzeichen und Gruppierungen an. Fehlende Einheiten oder Währungen müssen aus freigegebenen Stammdaten ergänzt werden. Es erfolgt keine Währungsumrechnung.

## Native DDIC Vorprüfung

Vor der Nutzung einer Kandidatenstruktur die native Tabelle und `.fields.csv`-Metadaten mit dem ABAP Bericht exportieren. `python tools/migration_ddic.py --mapping mapping/<module>/mapping.json --view <consumption view> --schema <table.csv.fields.csv> --out ddic-report.json` ausführen. Bei Fehlern zuerst Quellfelder und vollständige Schlüssel korrigieren und regenerieren. Nur ein als CLNT typisiertes MANDT darf im aktuellen Mandanten implizit bleiben. Die Prüfung bestätigt keine Zielunterstützung, Aktivierung oder fachliche Buchungsfreigabe.


# ModuPorter Materials Management Migrationspaket

Dieses Paket enthält Entwürfe für die Extraktion aus ECC, die Aufbereitung und den Vergleich mit S/4HANA. Es wurde noch nicht in SAP aktiviert oder getestet. Es liefert keinen Ladeprozess.

## Aufbau

Die Basic Schicht liest Kandidaten mit ihrem ursprünglichen Tabellenschlüssel. Die Composite Schicht legt die Feldnamen fest. Die Consumption Schicht stellt getrennte Strukturen für Kopf und Detail bereit. Unterstützte Objekte und Feldzuordnungen stehen in SUPPORTED_SCOPE.md und mapping. Historische Daten sind Referenzen und dürfen nicht automatisch erneut gebucht werden.

## Vorgehen

Prüfen Sie Release, Mandant, Berechtigungen, DDIC Schlüssel und Zielfelder. Aktivieren Sie die Objekte in der gelieferten Reihenfolge. Exportieren Sie UTF-8 CSV Dateien mit internen Schlüsseln und führenden Nullen. Legen Sie einen fachlich freigegebenen Stichtag fest. Tragen Sie die vollständigen freigegebenen Schlüssel jeder Struktur in customer/selection ein. Leere Dateien liefern keine aufbereiteten Zeilen. Prüfen Sie abhängige Details gegen ihre freigegebenen Eltern.

Lösen Sie Zeitintervalle und Änderungsstände vor der Schlüsselfreigabe auf. NativeEligible benötigt eine geprüfte Auswertung in SAP. Führen Sie `python tools/migration_run.py --project customer/customer-cohort-project.json --out prepared` mit einem neuen Ausgabeverzeichnis aus. Übertragen Sie ausschließlich fachlich freigegebene Daten über eine unterstützte Zielschnittstelle. Protokollieren Sie neue Nummern und Fehler.

Exportieren Sie dieselbe Zielpopulation mit den Namen und Schlüsseln aus customer/target-adapters.json. Vergleichen Sie jede relevante Struktur mit migration_prepare.py compare und der passenden mapping.json. Die CDS Zählansicht zählt ungefilterte Kandidaten; für die Abnahme sind die aufbereiteten Daten maßgeblich. Gleiche Zeilenanzahlen allein sind kein Nachweis. Prüfen Sie Beträge, Vorzeichen, Währungen, Mengeneinheiten und Rundung fachlich.

## Grenzen und Abnahme

Bestände benötigen einen eingefrorenen und abgestimmten Stichtag einschließlich Chargen und Sonderbeständen. MARD allein deckt nicht alle Bestände ab. Offene Einkaufsbelege erfordern die Prüfung von Löschung, Wareneingang, Rechnung und Restmengen.

Unterstützende Strukturen haben CSV Vergleichsverträge; dafür werden keine ungeprüften SAP CDS Namen als fertige Schnittstellen behauptet. Testen Sie Berechtigungen, geänderte Nummern, fehlende Felder, doppelte Schlüssel und abgewiesene Buchungen. Archivieren Sie Prüfberichte, Eingabehashes, Anwendungsprotokolle und die fachliche Freigabe. Diese Entwürfe sind noch keine SAP geprüften verkaufsfertigen Pakete.

## Beträge und Mengen

Das Werkzeug migration_business.py totals verwendet Dezimalarithmetik und getrennte Währungs oder Einheitengruppen. Doppelte Schlüssel, unbekannte Vorzeichen und ungültige Zahlen werden abgewiesen. Passen Sie currency-totals-example.json an Ihre geprüften Felder, Vorzeichen und Gruppierungen an. Fehlende Einheiten oder Währungen müssen aus freigegebenen Stammdaten ergänzt werden. Es erfolgt keine Währungsumrechnung.

## Erweiterungen — 0.2.0

### purchasing_info_record

Allgemeine und Einkaufsorganisationsdaten mit getrennten Schlüsseln übernehmen. Lieferanten-/Geschäftspartner- und Mengeneinheitenzuordnung vorbereiten. EINE-Nettopreis ersetzt keine vollständigen zeitabhängigen Konditionen; konfigurierte Konditionstabellen, KONH/KONP und Staffeln samt Gültigkeit und Zugriffsschlüsseln ergänzen.

### purchasing_contract

EKKO-Belegkategorie K und freigegebene Vertragsarten auswählen. Bestellungen und Lieferpläne ausschließen. Gültigkeit, Wert-/Mengenvertrag, Restverpflichtung und Abrufe prüfen. Kontierung und zeitabhängige Konditionen verknüpfen; Abrufhistorie nicht erneut als Bestellung laden.


## Native DDIC Vorprüfung

Vor der Nutzung einer Kandidatenstruktur die native Tabelle und `.fields.csv`-Metadaten mit dem ABAP Bericht exportieren. `python tools/migration_ddic.py --mapping mapping/<module>/mapping.json --view <consumption view> --schema <table.csv.fields.csv> --out ddic-report.json` ausführen. Bei Fehlern zuerst Quellfelder und vollständige Schlüssel korrigieren und regenerieren. Nur ein als CLNT typisiertes MANDT darf im aktuellen Mandanten implizit bleiben. Die Prüfung bestätigt keine Zielunterstützung, Aktivierung oder fachliche Buchungsfreigabe.


# ModuPorter Quality Management Migrationspaket

Dieses Paket enthält Entwürfe für die Extraktion aus ECC, die Aufbereitung und den Vergleich mit S/4HANA. Es wurde noch nicht in SAP aktiviert oder getestet. Es liefert keinen Ladeprozess.

## Aufbau

Die Basic Schicht liest Kandidaten mit ihrem ursprünglichen Tabellenschlüssel. Die Composite Schicht legt die Feldnamen fest. Die Consumption Schicht stellt getrennte Strukturen für Kopf und Detail bereit. Unterstützte Objekte und Feldzuordnungen stehen in SUPPORTED_SCOPE.md und mapping. Historische Daten sind Referenzen und dürfen nicht automatisch erneut gebucht werden.

## Vorgehen

Prüfen Sie Release, Mandant, Berechtigungen, DDIC Schlüssel und Zielfelder. Aktivieren Sie die Objekte in der gelieferten Reihenfolge. Exportieren Sie UTF-8 CSV Dateien mit internen Schlüsseln und führenden Nullen. Legen Sie einen fachlich freigegebenen Stichtag fest. Tragen Sie die vollständigen freigegebenen Schlüssel jeder Struktur in customer/selection ein. Leere Dateien liefern keine aufbereiteten Zeilen. Prüfen Sie abhängige Details gegen ihre freigegebenen Eltern.

Lösen Sie Zeitintervalle und Änderungsstände vor der Schlüsselfreigabe auf. NativeEligible benötigt eine geprüfte Auswertung in SAP. Führen Sie `python tools/migration_run.py --project customer/customer-cohort-project.json --out prepared` mit einem neuen Ausgabeverzeichnis aus. Übertragen Sie ausschließlich fachlich freigegebene Daten über eine unterstützte Zielschnittstelle. Protokollieren Sie neue Nummern und Fehler.

Exportieren Sie dieselbe Zielpopulation mit den Namen und Schlüsseln aus customer/target-adapters.json. Vergleichen Sie jede relevante Struktur mit migration_prepare.py compare und der passenden mapping.json. Die CDS Zählansicht zählt ungefilterte Kandidaten; für die Abnahme sind die aufbereiteten Daten maßgeblich. Gleiche Zeilenanzahlen allein sind kein Nachweis. Prüfen Sie Beträge, Vorzeichen, Währungen, Mengeneinheiten und Rundung fachlich.

## Grenzen und Abnahme

Prüflose, Ergebnisse und Verwendungsentscheide benötigen passende Prozesszustände. Prüfpläne benötigen wirksame Vorgänge, Merkmale und Materialzuordnungen. Ergebnisse bleiben Referenzdaten bis zur Freigabe einer unterstützten Schnittstelle.

Unterstützende Strukturen haben CSV Vergleichsverträge; dafür werden keine ungeprüften SAP CDS Namen als fertige Schnittstellen behauptet. Testen Sie Berechtigungen, geänderte Nummern, fehlende Felder, doppelte Schlüssel und abgewiesene Buchungen. Archivieren Sie Prüfberichte, Eingabehashes, Anwendungsprotokolle und die fachliche Freigabe. Diese Entwürfe sind noch keine SAP geprüften verkaufsfertigen Pakete.

## Beträge und Mengen

Das Werkzeug migration_business.py totals verwendet Dezimalarithmetik und getrennte Währungs oder Einheitengruppen. Doppelte Schlüssel, unbekannte Vorzeichen und ungültige Zahlen werden abgewiesen. Passen Sie currency-totals-example.json an Ihre geprüften Felder, Vorzeichen und Gruppierungen an. Fehlende Einheiten oder Währungen müssen aus freigegebenen Stammdaten ergänzt werden. Es erfolgt keine Währungsumrechnung.

## Erweiterungen — 0.2.0

### master_inspection_characteristic

Werk, Stammprüfmerkmal, Version und Sprache erhalten. Freigabestatus, quantitative/qualitative Steuerung, Grenzen, Einheiten, Prüfmethoden und Katalogabhängigkeiten im vollständigen Export prüfen. Kurztexte sind enthalten; Langtexte über die native Textschnittstelle ergänzen. Aktive Version nicht allein aus höchster Versionsnummer ableiten.

### sampling_procedure

QDSV-Schlüssel und Stichproben-/Bewertungsfelder im DDIC bestätigen. Stichprobenumfang, Stichprobenpläne, Dynamisierung und Bewertung über die native QM-Konfiguration ergänzen. Ein Verfahrenskopf ist kein vollständiger statistischer Stichprobenplan.


## Native DDIC Vorprüfung

Vor der Nutzung einer Kandidatenstruktur die native Tabelle und `.fields.csv`-Metadaten mit dem ABAP Bericht exportieren. `python tools/migration_ddic.py --mapping mapping/<module>/mapping.json --view <consumption view> --schema <table.csv.fields.csv> --out ddic-report.json` ausführen. Bei Fehlern zuerst Quellfelder und vollständige Schlüssel korrigieren und regenerieren. Nur ein als CLNT typisiertes MANDT darf im aktuellen Mandanten implizit bleiben. Die Prüfung bestätigt keine Zielunterstützung, Aktivierung oder fachliche Buchungsfreigabe.


# ModuPorter Project System Migrationspaket

Dieses Paket enthält Entwürfe für die Extraktion aus ECC, die Aufbereitung und den Vergleich mit S/4HANA. Es wurde noch nicht in SAP aktiviert oder getestet. Es liefert keinen Ladeprozess.

## Aufbau

Die Basic Schicht liest Kandidaten mit ihrem ursprünglichen Tabellenschlüssel. Die Composite Schicht legt die Feldnamen fest. Die Consumption Schicht stellt getrennte Strukturen für Kopf und Detail bereit. Unterstützte Objekte und Feldzuordnungen stehen in SUPPORTED_SCOPE.md und mapping. Historische Daten sind Referenzen und dürfen nicht automatisch erneut gebucht werden.

## Vorgehen

Prüfen Sie Release, Mandant, Berechtigungen, DDIC Schlüssel und Zielfelder. Aktivieren Sie die Objekte in der gelieferten Reihenfolge. Exportieren Sie UTF-8 CSV Dateien mit internen Schlüsseln und führenden Nullen. Legen Sie einen fachlich freigegebenen Stichtag fest. Tragen Sie die vollständigen freigegebenen Schlüssel jeder Struktur in customer/selection ein. Leere Dateien liefern keine aufbereiteten Zeilen. Prüfen Sie abhängige Details gegen ihre freigegebenen Eltern.

Lösen Sie Zeitintervalle und Änderungsstände vor der Schlüsselfreigabe auf. NativeEligible benötigt eine geprüfte Auswertung in SAP. Führen Sie `python tools/migration_run.py --project customer/customer-cohort-project.json --out prepared` mit einem neuen Ausgabeverzeichnis aus. Übertragen Sie ausschließlich fachlich freigegebene Daten über eine unterstützte Zielschnittstelle. Protokollieren Sie neue Nummern und Fehler.

Exportieren Sie dieselbe Zielpopulation mit den Namen und Schlüsseln aus customer/target-adapters.json. Vergleichen Sie jede relevante Struktur mit migration_prepare.py compare und der passenden mapping.json. Die CDS Zählansicht zählt ungefilterte Kandidaten; für die Abnahme sind die aufbereiteten Daten maßgeblich. Gleiche Zeilenanzahlen allein sind kein Nachweis. Prüfen Sie Beträge, Vorzeichen, Währungen, Mengeneinheiten und Rundung fachlich.

## Grenzen und Abnahme

Externe Projekt und PSP Kennungen sind von internen Schlüsseln zu unterscheiden. Hierarchie und neue interne Nummern benötigen Zuordnungstabellen. Kostenhistorie ist Referenzmaterial; Budget, Netzpläne und Abrechnung benötigen gesonderte Schnittstellen.

Unterstützende Strukturen haben CSV Vergleichsverträge; dafür werden keine ungeprüften SAP CDS Namen als fertige Schnittstellen behauptet. Testen Sie Berechtigungen, geänderte Nummern, fehlende Felder, doppelte Schlüssel und abgewiesene Buchungen. Archivieren Sie Prüfberichte, Eingabehashes, Anwendungsprotokolle und die fachliche Freigabe. Diese Entwürfe sind noch keine SAP geprüften verkaufsfertigen Pakete.

## Beträge und Mengen

Das Werkzeug migration_business.py totals verwendet Dezimalarithmetik und getrennte Währungs oder Einheitengruppen. Doppelte Schlüssel, unbekannte Vorzeichen und ungültige Zahlen werden abgewiesen. Passen Sie currency-totals-example.json an Ihre geprüften Felder, Vorzeichen und Gruppierungen an. Fehlende Einheiten oder Währungen müssen aus freigegebenen Stammdaten ergänzt werden. Es erfolgt keine Währungsumrechnung.

## Erweiterungen — 0.2.0

### network

AUFK enthält auch andere Auftragsarten. Netzplanarten anhand des geprüften Customizings auswählen und AFKO/AFVC/AFVV auf diese Netzpläne begrenzen. Interne Arbeitsplan-, PSP- und Arbeitsplatznummern zuordnen. Beziehungen, Kapazitäten, Termine und Status benötigen eine freigegebene Geschäftsschnittstelle.

### budget

Originalbudget, Nachträge, Rückgaben, Freigaben und Umbuchungen nach Werttyp und Vorgangssemantik trennen. Nicht alle BPGE/BPJA-Zeilen zum verfügbaren Budget addieren. Währung, Objektzuordnung, Geschäftsjahr und Verfügbarkeitskontrolle prüfen. Gesamt- und Jahresbudget getrennt abstimmen.

### commitment

COOI-Schlüssel und Felder vor der Extraktion im DDIC bestätigen. Obligos auf freigegebene Bestellanforderungen und Bestellpositionen mit Restverpflichtung beziehen. Obligos werden aus Einkaufsbelegen neu erzeugt; Historie und Einkaufsursprung nicht doppelt buchen. Objekt- und Kostenrechnungskreiswährungen ergänzen.

### investment_measure

Programmhierarchie, Genehmigungsjahr, PSP-/Auftragszuordnung, Investitionsprofile, Budgetverteilung und Abrechnung auf Anlagen im Bau prüfen. IMTP/IMPR/IMZO sind Kandidaten für Konfigurations- und Referenzdaten. Externe Kennungen erhalten und interne Objektnummern zuordnen.


## Native DDIC Vorprüfung

Vor der Nutzung einer Kandidatenstruktur die native Tabelle und `.fields.csv`-Metadaten mit dem ABAP Bericht exportieren. `python tools/migration_ddic.py --mapping mapping/<module>/mapping.json --view <consumption view> --schema <table.csv.fields.csv> --out ddic-report.json` ausführen. Bei Fehlern zuerst Quellfelder und vollständige Schlüssel korrigieren und regenerieren. Nur ein als CLNT typisiertes MANDT darf im aktuellen Mandanten implizit bleiben. Die Prüfung bestätigt keine Zielunterstützung, Aktivierung oder fachliche Buchungsfreigabe.


# ModuPorter Production Planning Migrationspaket

Dieses Paket enthält Entwürfe für die Extraktion aus ECC, die Aufbereitung und den Vergleich mit S/4HANA. Es wurde noch nicht in SAP aktiviert oder getestet. Es liefert keinen Ladeprozess.

## Aufbau

Die Basic Schicht liest Kandidaten mit ihrem ursprünglichen Tabellenschlüssel. Die Composite Schicht legt die Feldnamen fest. Die Consumption Schicht stellt getrennte Strukturen für Kopf und Detail bereit. Unterstützte Objekte und Feldzuordnungen stehen in SUPPORTED_SCOPE.md und mapping. Historische Daten sind Referenzen und dürfen nicht automatisch erneut gebucht werden.

## Vorgehen

Prüfen Sie Release, Mandant, Berechtigungen, DDIC Schlüssel und Zielfelder. Aktivieren Sie die Objekte in der gelieferten Reihenfolge. Exportieren Sie UTF-8 CSV Dateien mit internen Schlüsseln und führenden Nullen. Legen Sie einen fachlich freigegebenen Stichtag fest. Tragen Sie die vollständigen freigegebenen Schlüssel jeder Struktur in customer/selection ein. Leere Dateien liefern keine aufbereiteten Zeilen. Prüfen Sie abhängige Details gegen ihre freigegebenen Eltern.

Lösen Sie Zeitintervalle und Änderungsstände vor der Schlüsselfreigabe auf. NativeEligible benötigt eine geprüfte Auswertung in SAP. Führen Sie `python tools/migration_run.py --project customer/customer-cohort-project.json --out prepared` mit einem neuen Ausgabeverzeichnis aus. Übertragen Sie ausschließlich fachlich freigegebene Daten über eine unterstützte Zielschnittstelle. Protokollieren Sie neue Nummern und Fehler.

Exportieren Sie dieselbe Zielpopulation mit den Namen und Schlüsseln aus customer/target-adapters.json. Vergleichen Sie jede relevante Struktur mit migration_prepare.py compare und der passenden mapping.json. Die CDS Zählansicht zählt ungefilterte Kandidaten; für die Abnahme sind die aufbereiteten Daten maßgeblich. Gleiche Zeilenanzahlen allein sind kein Nachweis. Prüfen Sie Beträge, Vorzeichen, Währungen, Mengeneinheiten und Rundung fachlich.

## Grenzen und Abnahme

Stücklisten und Arbeitspläne benötigen Stichtag, Änderungsdienst, Alternativen und Knotenauswahl. Fertigungsaufträge sind Prozessreferenzen bis zur Schnittstellenfreigabe. Rückmeldungen und Warenbewegungen dürfen nicht als Stammdaten erneut gebucht werden.

Unterstützende Strukturen haben CSV Vergleichsverträge; dafür werden keine ungeprüften SAP CDS Namen als fertige Schnittstellen behauptet. Testen Sie Berechtigungen, geänderte Nummern, fehlende Felder, doppelte Schlüssel und abgewiesene Buchungen. Archivieren Sie Prüfberichte, Eingabehashes, Anwendungsprotokolle und die fachliche Freigabe. Diese Entwürfe sind noch keine SAP geprüften verkaufsfertigen Pakete.

## Beträge und Mengen

Das Werkzeug migration_business.py totals verwendet Dezimalarithmetik und getrennte Währungs oder Einheitengruppen. Doppelte Schlüssel, unbekannte Vorzeichen und ungültige Zahlen werden abgewiesen. Passen Sie currency-totals-example.json an Ihre geprüften Felder, Vorzeichen und Gruppierungen an. Fehlende Einheiten oder Währungen müssen aus freigegebenen Stammdaten ergänzt werden. Es erfolgt keine Währungsumrechnung.

## Erweiterungen — 0.2.0

### production_version

Gültigkeit, Losgrößen, Sperr-/Prüfstatus sowie wirksame Stücklisten-/Arbeitsplankombination prüfen. Material und Werk sind Voraussetzungen. Verschiedene Fertigungsversionen dürfen sich bewusst überlappen; Gültigkeit pro Version prüfen. REM-Planungsebenen benötigen eine releasespezifische Schnittstellenprüfung.

### production_confirmation

Rückmeldungsnummer/-zähler und Stornobeziehungen erhalten. Stornos nicht einfach entfernen. Zielauftrag/-vorgang und Buchungsperioden prüfen. Erneute Rückmeldung kann Rückspülung, Warenbewegungen, Leistungsverrechnung und Buchhaltung auslösen; Historie nur nach ausdrücklicher Prozessfreigabe erneut buchen.


## Native DDIC Vorprüfung

Vor der Nutzung einer Kandidatenstruktur die native Tabelle und `.fields.csv`-Metadaten mit dem ABAP Bericht exportieren. `python tools/migration_ddic.py --mapping mapping/<module>/mapping.json --view <consumption view> --schema <table.csv.fields.csv> --out ddic-report.json` ausführen. Bei Fehlern zuerst Quellfelder und vollständige Schlüssel korrigieren und regenerieren. Nur ein als CLNT typisiertes MANDT darf im aktuellen Mandanten implizit bleiben. Die Prüfung bestätigt keine Zielunterstützung, Aktivierung oder fachliche Buchungsfreigabe.


# ModuPorter Controlling Migrationspaket

Dieses Paket enthält Entwürfe für die Extraktion aus ECC, die Aufbereitung und den Vergleich mit S/4HANA. Es wurde noch nicht in SAP aktiviert oder getestet. Es liefert keinen Ladeprozess.

## Aufbau

Die Basic Schicht liest Kandidaten mit ihrem ursprünglichen Tabellenschlüssel. Die Composite Schicht legt die Feldnamen fest. Die Consumption Schicht stellt getrennte Strukturen für Kopf und Detail bereit. Unterstützte Objekte und Feldzuordnungen stehen in SUPPORTED_SCOPE.md und mapping. Historische Daten sind Referenzen und dürfen nicht automatisch erneut gebucht werden.

## Vorgehen

Prüfen Sie Release, Mandant, Berechtigungen, DDIC Schlüssel und Zielfelder. Aktivieren Sie die Objekte in der gelieferten Reihenfolge. Exportieren Sie UTF-8 CSV Dateien mit internen Schlüsseln und führenden Nullen. Legen Sie einen fachlich freigegebenen Stichtag fest. Tragen Sie die vollständigen freigegebenen Schlüssel jeder Struktur in customer/selection ein. Leere Dateien liefern keine aufbereiteten Zeilen. Prüfen Sie abhängige Details gegen ihre freigegebenen Eltern.

Lösen Sie Zeitintervalle und Änderungsstände vor der Schlüsselfreigabe auf. NativeEligible benötigt eine geprüfte Auswertung in SAP. Führen Sie `python tools/migration_run.py --project customer/customer-cohort-project.json --out prepared` mit einem neuen Ausgabeverzeichnis aus. Übertragen Sie ausschließlich fachlich freigegebene Daten über eine unterstützte Zielschnittstelle. Protokollieren Sie neue Nummern und Fehler.

Exportieren Sie dieselbe Zielpopulation mit den Namen und Schlüsseln aus customer/target-adapters.json. Vergleichen Sie jede relevante Struktur mit migration_prepare.py compare und der passenden mapping.json. Die CDS Zählansicht zählt ungefilterte Kandidaten; für die Abnahme sind die aufbereiteten Daten maßgeblich. Gleiche Zeilenanzahlen allein sind kein Nachweis. Prüfen Sie Beträge, Vorzeichen, Währungen, Mengeneinheiten und Rundung fachlich.

## Grenzen und Abnahme

Zeitabhängige Kostenstellen und Profitcenter benötigen eine Stichtagsprüfung. Kostenarten werden mit Sachkonten abgestimmt. COEP Historie ist keine Buchungsvorlage für das Universal Journal. Planung und Verrechnung erfordern zusätzliche Schnittstellen.

Unterstützende Strukturen haben CSV Vergleichsverträge; dafür werden keine ungeprüften SAP CDS Namen als fertige Schnittstellen behauptet. Testen Sie Berechtigungen, geänderte Nummern, fehlende Felder, doppelte Schlüssel und abgewiesene Buchungen. Archivieren Sie Prüfberichte, Eingabehashes, Anwendungsprotokolle und die fachliche Freigabe. Diese Entwürfe sind noch keine SAP geprüften verkaufsfertigen Pakete.

## Beträge und Mengen

Das Werkzeug migration_business.py totals verwendet Dezimalarithmetik und getrennte Währungs oder Einheitengruppen. Doppelte Schlüssel, unbekannte Vorzeichen und ungültige Zahlen werden abgewiesen. Passen Sie currency-totals-example.json an Ihre geprüften Felder, Vorzeichen und Gruppierungen an. Fehlende Einheiten oder Währungen müssen aus freigegebenen Stammdaten ergänzt werden. Es erfolgt keine Währungsumrechnung.

## Erweiterungen — 0.2.0

### planning

COSP/COSS enthalten auch Istwerte. Planwerttypen und Versionen ausdrücklich freigeben. Periodenblock, Perioden 01–16, Geschäftsjahresvariante, Währungen und Soll-/Haben-Semantik erhalten. ACDOCP ist keine direkte Kopie dieser Summen; eine unterstützte Planschnittstelle und Perioden-/Währungstypzuordnung festlegen.

### allocation_cycle

Zyklus- und Segmentköpfe reichen nicht aus. Sender-/Empfängerregeln, Sets, Bezugsgrößen, Konten, Plan-/Ist-Kontext, Iterationen und Gesellschaftsgrenzen über einen geprüften nativen Konfigurationsexport ergänzen. T811*-Tabellentyp und Schlüssel prüfen. Keine direkten Tabelleninserts; Zielzyklus fachlich prüfen und testweise ausführen.


## Native DDIC Vorprüfung

Vor der Nutzung einer Kandidatenstruktur die native Tabelle und `.fields.csv`-Metadaten mit dem ABAP Bericht exportieren. `python tools/migration_ddic.py --mapping mapping/<module>/mapping.json --view <consumption view> --schema <table.csv.fields.csv> --out ddic-report.json` ausführen. Bei Fehlern zuerst Quellfelder und vollständige Schlüssel korrigieren und regenerieren. Nur ein als CLNT typisiertes MANDT darf im aktuellen Mandanten implizit bleiben. Die Prüfung bestätigt keine Zielunterstützung, Aktivierung oder fachliche Buchungsfreigabe.


# ModuPorter Financial Accounting Migrationspaket

Dieses Paket enthält Entwürfe für die Extraktion aus ECC, die Aufbereitung und den Vergleich mit S/4HANA. Es wurde noch nicht in SAP aktiviert oder getestet. Es liefert keinen Ladeprozess.

## Aufbau

Die Basic Schicht liest Kandidaten mit ihrem ursprünglichen Tabellenschlüssel. Die Composite Schicht legt die Feldnamen fest. Die Consumption Schicht stellt getrennte Strukturen für Kopf und Detail bereit. Unterstützte Objekte und Feldzuordnungen stehen in SUPPORTED_SCOPE.md und mapping. Historische Daten sind Referenzen und dürfen nicht automatisch erneut gebucht werden.

## Vorgehen

Prüfen Sie Release, Mandant, Berechtigungen, DDIC Schlüssel und Zielfelder. Aktivieren Sie die Objekte in der gelieferten Reihenfolge. Exportieren Sie UTF-8 CSV Dateien mit internen Schlüsseln und führenden Nullen. Legen Sie einen fachlich freigegebenen Stichtag fest. Tragen Sie die vollständigen freigegebenen Schlüssel jeder Struktur in customer/selection ein. Leere Dateien liefern keine aufbereiteten Zeilen. Prüfen Sie abhängige Details gegen ihre freigegebenen Eltern.

Lösen Sie Zeitintervalle und Änderungsstände vor der Schlüsselfreigabe auf. NativeEligible benötigt eine geprüfte Auswertung in SAP. Führen Sie `python tools/migration_run.py --project customer/customer-cohort-project.json --out prepared` mit einem neuen Ausgabeverzeichnis aus. Übertragen Sie ausschließlich fachlich freigegebene Daten über eine unterstützte Zielschnittstelle. Protokollieren Sie neue Nummern und Fehler.

Exportieren Sie dieselbe Zielpopulation mit den Namen und Schlüsseln aus customer/target-adapters.json. Vergleichen Sie jede relevante Struktur mit migration_prepare.py compare und der passenden mapping.json. Die CDS Zählansicht zählt ungefilterte Kandidaten; für die Abnahme sind die aufbereiteten Daten maßgeblich. Gleiche Zeilenanzahlen allein sind kein Nachweis. Prüfen Sie Beträge, Vorzeichen, Währungen, Mengeneinheiten und Rundung fachlich.

## Grenzen und Abnahme

Kunden und Lieferanten benötigen Geschäftspartner und CVI Zuordnungen. BSEG kann in ECC eine Clustertabelle sein; CDS Zugriff ist nicht vorausgesetzt. Für offene Posten am Stichtag sind auch später ausgeglichene Posten relevant. Währungen, Vorzeichen und Nebenbuchabgrenzung müssen abgestimmt werden.

Unterstützende Strukturen haben CSV Vergleichsverträge; dafür werden keine ungeprüften SAP CDS Namen als fertige Schnittstellen behauptet. Testen Sie Berechtigungen, geänderte Nummern, fehlende Felder, doppelte Schlüssel und abgewiesene Buchungen. Archivieren Sie Prüfberichte, Eingabehashes, Anwendungsprotokolle und die fachliche Freigabe. Diese Entwürfe sind noch keine SAP geprüften verkaufsfertigen Pakete.

## Beträge und Mengen

Das Werkzeug migration_business.py totals verwendet Dezimalarithmetik und getrennte Währungs oder Einheitengruppen. Doppelte Schlüssel, unbekannte Vorzeichen und ungültige Zahlen werden abgewiesen. Passen Sie currency-totals-example.json an Ihre geprüften Felder, Vorzeichen und Gruppierungen an. Fehlende Einheiten oder Währungen müssen aus freigegebenen Stammdaten ergänzt werden. Es erfolgt keine Währungsumrechnung.

## Erweiterungen — 0.2.0

### bank

Bankland und Bankschlüssel identifizieren die Bank. Länderspezifische Formate und Löschstatus erhalten. Hausbanken, Hausbankkonten, Bank Account Management und Partnerbankdaten sind eigenständige Objekte. Bankstamm nicht mit Bankkontostand verwechseln.

### gl_opening_balance

Pro Ledgerpopulation klassisches ODER neues Hauptbuch verwenden, nicht beide vereinigen. Sämtliche DDIC-Schlüsseldimensionen bestätigen. Periode 00 ist Vortrag; Stichtagswerte anhand freigegebener Periodenregeln einschließlich Sonderperioden berechnen. Währungstypen ergänzen und Konten anhand SKB1 klassifizieren. Bereits durch Anlagen, Debitoren, Kreditoren oder offene Posten übernommene Salden ausschließen. Migrationsverrechnungskonten auf null abstimmen.


## Native DDIC Vorprüfung

Vor der Nutzung einer Kandidatenstruktur die native Tabelle und `.fields.csv`-Metadaten mit dem ABAP Bericht exportieren. `python tools/migration_ddic.py --mapping mapping/<module>/mapping.json --view <consumption view> --schema <table.csv.fields.csv> --out ddic-report.json` ausführen. Bei Fehlern zuerst Quellfelder und vollständige Schlüssel korrigieren und regenerieren. Nur ein als CLNT typisiertes MANDT darf im aktuellen Mandanten implizit bleiben. Die Prüfung bestätigt keine Zielunterstützung, Aktivierung oder fachliche Buchungsfreigabe.


# ModuPorter Sales and Distribution Migrationspaket

Dieses Paket enthält Entwürfe für die Extraktion aus ECC, die Aufbereitung und den Vergleich mit S/4HANA. Es wurde noch nicht in SAP aktiviert oder getestet. Es liefert keinen Ladeprozess.

## Aufbau

Die Basic Schicht liest Kandidaten mit ihrem ursprünglichen Tabellenschlüssel. Die Composite Schicht legt die Feldnamen fest. Die Consumption Schicht stellt getrennte Strukturen für Kopf und Detail bereit. Unterstützte Objekte und Feldzuordnungen stehen in SUPPORTED_SCOPE.md und mapping. Historische Daten sind Referenzen und dürfen nicht automatisch erneut gebucht werden.

## Vorgehen

Prüfen Sie Release, Mandant, Berechtigungen, DDIC Schlüssel und Zielfelder. Aktivieren Sie die Objekte in der gelieferten Reihenfolge. Exportieren Sie UTF-8 CSV Dateien mit internen Schlüsseln und führenden Nullen. Legen Sie einen fachlich freigegebenen Stichtag fest. Tragen Sie die vollständigen freigegebenen Schlüssel jeder Struktur in customer/selection ein. Leere Dateien liefern keine aufbereiteten Zeilen. Prüfen Sie abhängige Details gegen ihre freigegebenen Eltern.

Lösen Sie Zeitintervalle und Änderungsstände vor der Schlüsselfreigabe auf. NativeEligible benötigt eine geprüfte Auswertung in SAP. Führen Sie `python tools/migration_run.py --project customer/customer-cohort-project.json --out prepared` mit einem neuen Ausgabeverzeichnis aus. Übertragen Sie ausschließlich fachlich freigegebene Daten über eine unterstützte Zielschnittstelle. Protokollieren Sie neue Nummern und Fehler.

Exportieren Sie dieselbe Zielpopulation mit den Namen und Schlüsseln aus customer/target-adapters.json. Vergleichen Sie jede relevante Struktur mit migration_prepare.py compare und der passenden mapping.json. Die CDS Zählansicht zählt ungefilterte Kandidaten; für die Abnahme sind die aufbereiteten Daten maßgeblich. Gleiche Zeilenanzahlen allein sind kein Nachweis. Prüfen Sie Beträge, Vorzeichen, Währungen, Mengeneinheiten und Rundung fachlich.

## Grenzen und Abnahme

Offene Kundenaufträge benötigen Positionsstatus, Absagegründe, Belegfluss und Restmengen. Lieferungen und Fakturen sind Historienreferenzen. Ihre Neuerstellung kann Logistik und Buchhaltung auslösen. Partner, Konditionen, Texte und Steuern benötigen Schnittstellenfreigabe.

Unterstützende Strukturen haben CSV Vergleichsverträge; dafür werden keine ungeprüften SAP CDS Namen als fertige Schnittstellen behauptet. Testen Sie Berechtigungen, geänderte Nummern, fehlende Felder, doppelte Schlüssel und abgewiesene Buchungen. Archivieren Sie Prüfberichte, Eingabehashes, Anwendungsprotokolle und die fachliche Freigabe. Diese Entwürfe sind noch keine SAP geprüften verkaufsfertigen Pakete.

## Beträge und Mengen

Das Werkzeug migration_business.py totals verwendet Dezimalarithmetik und getrennte Währungs oder Einheitengruppen. Doppelte Schlüssel, unbekannte Vorzeichen und ungültige Zahlen werden abgewiesen. Passen Sie currency-totals-example.json an Ihre geprüften Felder, Vorzeichen und Gruppierungen an. Fehlende Einheiten oder Währungen müssen aus freigegebenen Stammdaten ergänzt werden. Es erfolgt keine Währungsumrechnung.

## Erweiterungen — 0.2.0

### pricing_condition

Alle konfigurierten Konditionszugriffstabellen mit tatsächlichem DDIC-Schlüssel exportieren und KNUMH mit KONH/KONP/Staffeln verknüpfen. KONH allein verliert Kunden-/Material-/Vertriebsbereichsschlüssel. Ergänzungen, Ausschlüsse, Löschung, Gültigkeit, Berechnungsart, Währungen/Einheiten und Staffelart prüfen. Stammkonditionen nicht mit Belegkonditionen verwechseln; keinen universellen Ratenfaktor anwenden.


## Native DDIC Vorprüfung

Vor der Nutzung einer Kandidatenstruktur die native Tabelle und `.fields.csv`-Metadaten mit dem ABAP Bericht exportieren. `python tools/migration_ddic.py --mapping mapping/<module>/mapping.json --view <consumption view> --schema <table.csv.fields.csv> --out ddic-report.json` ausführen. Bei Fehlern zuerst Quellfelder und vollständige Schlüssel korrigieren und regenerieren. Nur ein als CLNT typisiertes MANDT darf im aktuellen Mandanten implizit bleiben. Die Prüfung bestätigt keine Zielunterstützung, Aktivierung oder fachliche Buchungsfreigabe.
