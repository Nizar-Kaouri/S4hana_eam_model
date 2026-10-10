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
