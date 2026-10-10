# ModuPorter EWM TM FSCM EHS

Version 0.1.0. 32 modules / 72 structures / 352 CDS / 144 customer staging tables.

# ModuPorter Erweiterte Lagerverwaltung

Version 0.1.0. Nicht in SAP aktiviert oder getestet.

LE-WM und EWM besitzen unterschiedliche Quellmodelle. Lagernummer, Verfügungsberechtigter, Eigentümer, Bestandsart, Charge, HU und Seriennummern zuordnen. Bestände einfrieren und MM/IM mit EWM ohne Doppelbeladung abstimmen. Offene Lageraufgaben, Lageraufträge und Lieferungen benötigen freigegebene Geschäftsprozesse. Packvorschriften und Lagertyp-Customizing separat prüfen.

## Module

- storage_bin: 2 Strukturen; master.
- warehouse_product: 2 Strukturen; master.
- warehouse_stock: 2 Strukturen; balance.
- handling_unit: 2 Strukturen; process-reference.
- warehouse_task: 2 Strukturen; process-reference.
- warehouse_order: 1 Strukturen; process-reference.
- warehouse_delivery: 2 Strukturen; process-reference.
- pack_specification: 3 Strukturen; master.

## Vorgehen

Native Leseadapter für die tatsächliche Quell-/Zielversion implementieren und fachlich freigeben. source-adapters.json und target-adapters.json beschreiben Verträge, keine fertigen SAP Konnektoren. Die kundeneigenen Stagingtabellen übernehmen normalisierte Exportdaten; ihre Befüllung ist keine Geschäftsobjektbeladung.

SourceSystem, SourceClient und ExportBatch kennzeichnen die Ursprungspopulation. Auch Zieldaten verwenden diese Ursprungskennungen. Neue Zielnummern für den Vergleich auf Quellschlüssel zurückführen und die Zuordnung separat protokollieren. Pro Datei ist nur eine Ursprungspopulation erlaubt.

Freigegebene vollständige Schlüssel in customer/selection eintragen. Eltern-/Kindbeziehungen und fachliche Stichtagsregeln unabhängig prüfen. Leere Auswahldateien liefern null Zeilen. migration_run.py erzeugt die geprüfte Auswahl mit Hash-Audit; das synthetische Beispiel in customer/examples/project.json zuerst lokal ausführen.

migration_stage.py mit customer/staging-contracts.json prüft Spaltenreihenfolge, vollständige eindeutige Schlüssel, Feldlängen und Herkunft. Die Ausgabe enthält canonical.csv, stage.tsv ohne Kopfzeile und audit.json. Tabulatoren, Zeilenumbrüche, NUL und abschließende Leerzeichen sind unzulässig; Langtexte und Anlagen benötigen native Schnittstellen.

Quell- und Ziel-ZIP separat importieren. Gemäß ACTIVATION_ORDER zuerst Stagingtabellen, dann Basic, Composite und Consumption aktivieren. Berichte separat in SE38 anlegen. Der Ladebericht simuliert standardmäßig. Nur freigegebene kundeneigene Tabellen sind erlaubt; tatsächliche Ausführung fügt neue Zeilen ein, lehnt Duplikate ab und rollt Datenbankfehler zurück. Keine Geschäftsobjekttabellen werden verändert. GUI UTF-8, Tabulatoren und Rollback-Verhalten in SAP prüfen. Alternativ die CSV Werkzeuge ohne SAP Staging nutzen.

Den vollständigen Stagingexport mit migration_stage.py --physical in kanonische Spalten zurückführen. migration_ddic.py prüft die Stagingmetadaten, nicht die Vollständigkeit des nativen Geschäftsobjektexports. Erst danach eine unterstützte Zielgeschäftsschnittstelle verwenden. Referenzhistorie nicht automatisch buchen.

Dieselbe Zielpopulation nativ exportieren und mit migration_prepare.py compare vergleichen. Optionale Ziel-CDS Views zeigen nur Staging-Belege, keine live ausgelesenen Geschäftsobjekte. Beträge, Mengen, Währungen und Vorzeichen zusätzlich mit migration_business.py totals abstimmen. Gleiche Stagingzeilen beweisen keine erfolgreiche Geschäftsobjektmigration. Tests, fachliche Freigabe und offene Adapteranforderungen dokumentieren.

## Staging TSV Format

stage.tsv unverändert verwenden. Die Datei enthält keine Kopfzeile; jede Zeile endet nach dem letzten Tabulator mit #MODUPORTER_END#. Der Bericht prüft und entfernt die Markierung, damit leere Endwerte erhalten bleiben. canonical.csv nicht als TSV laden. Kodierung und SPLIT Verhalten der SAP GUI müssen im Kundensystem geprüft werden.

---

# ModuPorter Transportmanagement

Version 0.1.0. Nicht in SAP aktiviert oder getestet.

Freigegebene Geschäftsdienste oder geprüfte native Geschäftsobjektexporte verwenden. Interne GUIDs, Elternbeziehungen, UTC-Zeitpunkte und Zeitzonen erhalten. Frachtbelege besitzen Ausführungs- und Abrechnungswirkungen und bleiben bis zur Schnittstellenfreigabe Prozessreferenzen. Vereinbarungen, Staffeln, Währungen und Rating separat prüfen. Upgrade-XPRA-Berichte sind keine allgemeinen systemübergreifenden Migrationsschnittstellen.

## Module

- transport_location: 1 Strukturen; master.
- transport_resource: 2 Strukturen; master.
- transport_lane: 2 Strukturen; master.
- transport_schedule: 2 Strukturen; master.
- freight_agreement: 3 Strukturen; master.
- freight_unit: 3 Strukturen; process-reference.
- freight_order: 4 Strukturen; process-reference.
- freight_settlement: 2 Strukturen; reference.

## Vorgehen

Native Leseadapter für die tatsächliche Quell-/Zielversion implementieren und fachlich freigeben. source-adapters.json und target-adapters.json beschreiben Verträge, keine fertigen SAP Konnektoren. Die kundeneigenen Stagingtabellen übernehmen normalisierte Exportdaten; ihre Befüllung ist keine Geschäftsobjektbeladung.

SourceSystem, SourceClient und ExportBatch kennzeichnen die Ursprungspopulation. Auch Zieldaten verwenden diese Ursprungskennungen. Neue Zielnummern für den Vergleich auf Quellschlüssel zurückführen und die Zuordnung separat protokollieren. Pro Datei ist nur eine Ursprungspopulation erlaubt.

Freigegebene vollständige Schlüssel in customer/selection eintragen. Eltern-/Kindbeziehungen und fachliche Stichtagsregeln unabhängig prüfen. Leere Auswahldateien liefern null Zeilen. migration_run.py erzeugt die geprüfte Auswahl mit Hash-Audit; das synthetische Beispiel in customer/examples/project.json zuerst lokal ausführen.

migration_stage.py mit customer/staging-contracts.json prüft Spaltenreihenfolge, vollständige eindeutige Schlüssel, Feldlängen und Herkunft. Die Ausgabe enthält canonical.csv, stage.tsv ohne Kopfzeile und audit.json. Tabulatoren, Zeilenumbrüche, NUL und abschließende Leerzeichen sind unzulässig; Langtexte und Anlagen benötigen native Schnittstellen.

Quell- und Ziel-ZIP separat importieren. Gemäß ACTIVATION_ORDER zuerst Stagingtabellen, dann Basic, Composite und Consumption aktivieren. Berichte separat in SE38 anlegen. Der Ladebericht simuliert standardmäßig. Nur freigegebene kundeneigene Tabellen sind erlaubt; tatsächliche Ausführung fügt neue Zeilen ein, lehnt Duplikate ab und rollt Datenbankfehler zurück. Keine Geschäftsobjekttabellen werden verändert. GUI UTF-8, Tabulatoren und Rollback-Verhalten in SAP prüfen. Alternativ die CSV Werkzeuge ohne SAP Staging nutzen.

Den vollständigen Stagingexport mit migration_stage.py --physical in kanonische Spalten zurückführen. migration_ddic.py prüft die Stagingmetadaten, nicht die Vollständigkeit des nativen Geschäftsobjektexports. Erst danach eine unterstützte Zielgeschäftsschnittstelle verwenden. Referenzhistorie nicht automatisch buchen.

Dieselbe Zielpopulation nativ exportieren und mit migration_prepare.py compare vergleichen. Optionale Ziel-CDS Views zeigen nur Staging-Belege, keine live ausgelesenen Geschäftsobjekte. Beträge, Mengen, Währungen und Vorzeichen zusätzlich mit migration_business.py totals abstimmen. Gleiche Stagingzeilen beweisen keine erfolgreiche Geschäftsobjektmigration. Tests, fachliche Freigabe und offene Adapteranforderungen dokumentieren.

## Staging TSV Format

stage.tsv unverändert verwenden. Die Datei enthält keine Kopfzeile; jede Zeile endet nach dem letzten Tabulator mit #MODUPORTER_END#. Der Bericht prüft und entfernt die Markierung, damit leere Endwerte erhalten bleiben. canonical.csv nicht als TSV laden. Kodierung und SPLIT Verhalten der SAP GUI müssen im Kundensystem geprüft werden.

---

# ModuPorter Finanzielles Supply Chain Management

Version 0.1.0. Nicht in SAP aktiviert oder getestet.

Klassische Kreditkontrollbereiche auf FSCM-Kreditsegmente und Geschäftspartner abbilden. Kreditobligo wird aus operativen Quellen neu erzeugt und darf nicht zusätzlich als Anfangsschuld gebucht werden. Collections und Streitfälle auf dieselbe FI-Forderungspopulation beziehen. Status, Zusagen, Kontakte, Notizen und Anlagen benötigen freigegebene Schnittstellen und Berechtigungen. Collections and Dispute Automation in Public Cloud ist ein eigener Nachfolger mit geordneten Migrationsjobs.

## Module

- credit_profile: 2 Strukturen; master.
- credit_segment: 1 Strukturen; master.
- credit_exposure: 1 Strukturen; reference.
- collections_profile: 2 Strukturen; master.
- collection_activity: 2 Strukturen; process-reference.
- promise_to_pay: 2 Strukturen; process-reference.
- dispute_case: 4 Strukturen; process-reference.

## Vorgehen

Native Leseadapter für die tatsächliche Quell-/Zielversion implementieren und fachlich freigeben. source-adapters.json und target-adapters.json beschreiben Verträge, keine fertigen SAP Konnektoren. Die kundeneigenen Stagingtabellen übernehmen normalisierte Exportdaten; ihre Befüllung ist keine Geschäftsobjektbeladung.

SourceSystem, SourceClient und ExportBatch kennzeichnen die Ursprungspopulation. Auch Zieldaten verwenden diese Ursprungskennungen. Neue Zielnummern für den Vergleich auf Quellschlüssel zurückführen und die Zuordnung separat protokollieren. Pro Datei ist nur eine Ursprungspopulation erlaubt.

Freigegebene vollständige Schlüssel in customer/selection eintragen. Eltern-/Kindbeziehungen und fachliche Stichtagsregeln unabhängig prüfen. Leere Auswahldateien liefern null Zeilen. migration_run.py erzeugt die geprüfte Auswahl mit Hash-Audit; das synthetische Beispiel in customer/examples/project.json zuerst lokal ausführen.

migration_stage.py mit customer/staging-contracts.json prüft Spaltenreihenfolge, vollständige eindeutige Schlüssel, Feldlängen und Herkunft. Die Ausgabe enthält canonical.csv, stage.tsv ohne Kopfzeile und audit.json. Tabulatoren, Zeilenumbrüche, NUL und abschließende Leerzeichen sind unzulässig; Langtexte und Anlagen benötigen native Schnittstellen.

Quell- und Ziel-ZIP separat importieren. Gemäß ACTIVATION_ORDER zuerst Stagingtabellen, dann Basic, Composite und Consumption aktivieren. Berichte separat in SE38 anlegen. Der Ladebericht simuliert standardmäßig. Nur freigegebene kundeneigene Tabellen sind erlaubt; tatsächliche Ausführung fügt neue Zeilen ein, lehnt Duplikate ab und rollt Datenbankfehler zurück. Keine Geschäftsobjekttabellen werden verändert. GUI UTF-8, Tabulatoren und Rollback-Verhalten in SAP prüfen. Alternativ die CSV Werkzeuge ohne SAP Staging nutzen.

Den vollständigen Stagingexport mit migration_stage.py --physical in kanonische Spalten zurückführen. migration_ddic.py prüft die Stagingmetadaten, nicht die Vollständigkeit des nativen Geschäftsobjektexports. Erst danach eine unterstützte Zielgeschäftsschnittstelle verwenden. Referenzhistorie nicht automatisch buchen.

Dieselbe Zielpopulation nativ exportieren und mit migration_prepare.py compare vergleichen. Optionale Ziel-CDS Views zeigen nur Staging-Belege, keine live ausgelesenen Geschäftsobjekte. Beträge, Mengen, Währungen und Vorzeichen zusätzlich mit migration_business.py totals abstimmen. Gleiche Stagingzeilen beweisen keine erfolgreiche Geschäftsobjektmigration. Tests, fachliche Freigabe und offene Adapteranforderungen dokumentieren.

## Staging TSV Format

stage.tsv unverändert verwenden. Die Datei enthält keine Kopfzeile; jede Zeile endet nach dem letzten Tabulator mit #MODUPORTER_END#. Der Bericht prüft und entfernt die Markierung, damit leere Endwerte erhalten bleiben. canonical.csv nicht als TSV laden. Kodierung und SPLIT Verhalten der SAP GUI müssen im Kundensystem geprüft werden.

---

# ModuPorter Umwelt Gesundheit und Sicherheit

Version 0.1.0. Nicht in SAP aktiviert oder getestet.

Klassische Spezifikationen und moderne EHSM-Objekte sind nicht austauschbar. Version, Gültigkeit, Rechtsraum, Einheiten, mehrsprachige Phrasen und Bewertungssemantik erhalten. Personen-/Gesundheitsdaten in Ereignissen restriktiv schützen; Anlagen und Langtexte über freigegebene Schnittstellen übertragen. Historische Bewertungen, Messungen und Ereignisse bleiben bis zur Zielobjektfreigabe Referenzdaten. Product Compliance und Dangerous Goods besitzen eigene Release- und Objektgrenzen; das Format bestätigt keine Rechtskonformität.

## Module

- ehs_location: 2 Strukturen; master.
- chemical_property: 2 Strukturen; master.
- specification: 3 Strukturen; master.
- phrase: 2 Strukturen; master.
- incident: 3 Strukturen; process-reference.
- risk_assessment: 3 Strukturen; reference.
- environmental_data: 3 Strukturen; reference.
- compliance: 3 Strukturen; master.
- dangerous_goods: 2 Strukturen; regulatory-reference.

## Vorgehen

Native Leseadapter für die tatsächliche Quell-/Zielversion implementieren und fachlich freigeben. source-adapters.json und target-adapters.json beschreiben Verträge, keine fertigen SAP Konnektoren. Die kundeneigenen Stagingtabellen übernehmen normalisierte Exportdaten; ihre Befüllung ist keine Geschäftsobjektbeladung.

SourceSystem, SourceClient und ExportBatch kennzeichnen die Ursprungspopulation. Auch Zieldaten verwenden diese Ursprungskennungen. Neue Zielnummern für den Vergleich auf Quellschlüssel zurückführen und die Zuordnung separat protokollieren. Pro Datei ist nur eine Ursprungspopulation erlaubt.

Freigegebene vollständige Schlüssel in customer/selection eintragen. Eltern-/Kindbeziehungen und fachliche Stichtagsregeln unabhängig prüfen. Leere Auswahldateien liefern null Zeilen. migration_run.py erzeugt die geprüfte Auswahl mit Hash-Audit; das synthetische Beispiel in customer/examples/project.json zuerst lokal ausführen.

migration_stage.py mit customer/staging-contracts.json prüft Spaltenreihenfolge, vollständige eindeutige Schlüssel, Feldlängen und Herkunft. Die Ausgabe enthält canonical.csv, stage.tsv ohne Kopfzeile und audit.json. Tabulatoren, Zeilenumbrüche, NUL und abschließende Leerzeichen sind unzulässig; Langtexte und Anlagen benötigen native Schnittstellen.

Quell- und Ziel-ZIP separat importieren. Gemäß ACTIVATION_ORDER zuerst Stagingtabellen, dann Basic, Composite und Consumption aktivieren. Berichte separat in SE38 anlegen. Der Ladebericht simuliert standardmäßig. Nur freigegebene kundeneigene Tabellen sind erlaubt; tatsächliche Ausführung fügt neue Zeilen ein, lehnt Duplikate ab und rollt Datenbankfehler zurück. Keine Geschäftsobjekttabellen werden verändert. GUI UTF-8, Tabulatoren und Rollback-Verhalten in SAP prüfen. Alternativ die CSV Werkzeuge ohne SAP Staging nutzen.

Den vollständigen Stagingexport mit migration_stage.py --physical in kanonische Spalten zurückführen. migration_ddic.py prüft die Stagingmetadaten, nicht die Vollständigkeit des nativen Geschäftsobjektexports. Erst danach eine unterstützte Zielgeschäftsschnittstelle verwenden. Referenzhistorie nicht automatisch buchen.

Dieselbe Zielpopulation nativ exportieren und mit migration_prepare.py compare vergleichen. Optionale Ziel-CDS Views zeigen nur Staging-Belege, keine live ausgelesenen Geschäftsobjekte. Beträge, Mengen, Währungen und Vorzeichen zusätzlich mit migration_business.py totals abstimmen. Gleiche Stagingzeilen beweisen keine erfolgreiche Geschäftsobjektmigration. Tests, fachliche Freigabe und offene Adapteranforderungen dokumentieren.

## Staging TSV Format

stage.tsv unverändert verwenden. Die Datei enthält keine Kopfzeile; jede Zeile endet nach dem letzten Tabulator mit #MODUPORTER_END#. Der Bericht prüft und entfernt die Markierung, damit leere Endwerte erhalten bleiben. canonical.csv nicht als TSV laden. Kodierung und SPLIT Verhalten der SAP GUI müssen im Kundensystem geprüft werden.

---
