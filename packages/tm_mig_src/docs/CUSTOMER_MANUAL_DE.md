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
