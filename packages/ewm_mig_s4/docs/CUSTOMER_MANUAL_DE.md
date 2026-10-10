# ModuPorter Erweiterte Lagerverwaltung — nativer Entwurf 0.2.0

Ersetzt die Staging-Architektur von 0.1.0. Dokumentierte Strukturen folgen SAP-Systemtabelle → Basic → Composite → Consumption. Zielvergleichsviews lesen native Tabellen. Keine kundeneigenen Stagingtabellen oder Ladeberichte.

**Paket noch unvollständig:** 4 native Strukturentwürfe; 12 offene Strukturen. Weitere fehlende Nutzdaten stehen in customer/native-coverage.json. Kopf-/Wurzelviews sind keine vollständigen Geschäftsobjekte.

## Vorgehen

Anwendung und Release feststellen: EWM ist nicht LE-WM, klassische EHS-Spezifikationen sind nicht moderne EHSM-Vorfälle. Tabellen, Felder und vollständige DDIC-Schlüssel in SE11/ADT prüfen; die gelieferten Schlüssel sind ungetestete Entwürfe. Den nativen Lesebericht zum Export der tatsächlichen DDIC-Feldliste nutzen und migration_ddic.py ausführen. Keine erfundenen Metadaten als Nachweis verwenden.

Quell- und Zielpaket getrennt importieren und ACTIVATION_ORDER.txt befolgen. Native Tabellen müssen vorhanden sein. Klassische CDS-Views in der Quelle, View Entities im Ziel. Konkrete Mindestversionen und SAP-Aktivierung sind ungeprüft. Erlaubte/eingeschränkte Benutzer sowie Mandantentrennung testen; keine DCL enthalten. S_TABU_NAM im Lesebericht schützt nicht automatisch alle CDS-Zugriffe.

Consumption-Daten mit CDS-Spaltennamen nach customer/exports exportieren. System, Mandant, Exportzeit und freigegebene Population separat protokollieren. Der Tabellenbericht exportiert Rohspalten und wendet keine Consumption-Filter an. Vollständige native Schlüssel in customer/selection eintragen; leere Auswahl erzeugt null Zeilen. `python tools/migration_run.py --project customer/customer-cohort-project.json --out prepared` ausführen. Fachliche Zustände, Stichtag und Eltern-/Kindbeziehungen zusätzlich prüfen.

Dieselbe Zielpopulation aus nativen Vergleichsviews exportieren. Neu erzeugte UUIDs und geänderte Nummern vor dem Vergleich anhand einer geprüften Zuordnung abgleichen; Originalschlüssel separat erhalten. Gleiche UUIDs in verschiedenen Systemen werden nicht vorausgesetzt. migration_prepare.py compare mit passendem Mapping und View nutzen. Zählviews zählen breite Kandidatenbestände; dieselbe Population anwenden.

EHS-Änderungsstände RECN/ACTN, Gültigkeit und Löschkennzeichen erhalten. Kein ungeprüfter Filter auf den letzten Stand. TM-Kategorien und Lebenszyklus prüfen; allgemeine Fallattribute enthalten mehrere Fallarten. Fehlende Nutzdaten bleiben offen. Aktivierung, Schlüsseldeutigkeit, Berechtigungen, Extraktionsvollständigkeit und Vergleich in customer/TEST_RESULTS.csv mit tatsächlichen SAP-Nachweisen dokumentieren.

Nur Leseextraktion; keine Buchungsadapter oder Anlage von Zielgeschäftsobjekten.
