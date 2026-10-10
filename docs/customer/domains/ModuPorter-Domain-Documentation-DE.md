# ModuPorter SAP Domain Migration Guides DE

Version 0.1.0. KAOURI INNOVATECH. Eight domain drafts. No SAP runtime validation.


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
