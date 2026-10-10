# Dedicated G/L opening balances

Status: draft-unverified. Delivery mode: balance.

Choose classic OR new G/L for each ledger population; do not union both. DDIC must confirm all ledger dimensions and include any additional keys. Period 00 is carryforward, not period 01; calculate cutoff totals from the approved fiscal-year/period contract, including special periods only as intended. Enrich currency types from ledger/company configuration and classify accounts from SKB1. Exclude balances already supplied by FI-AA/AP/AR/open-item migration; reconcile migration clearing accounts to zero. No automatic totals-to-posting transformation is supplied.

## Deutsche Anleitung

Pro Ledgerpopulation klassisches ODER neues Hauptbuch verwenden, nicht beide vereinigen. Sämtliche DDIC-Schlüsseldimensionen bestätigen. Periode 00 ist Vortrag; Stichtagswerte anhand freigegebener Periodenregeln einschließlich Sonderperioden berechnen. Währungstypen ergänzen und Konten anhand SKB1 klassifizieren. Bereits durch Anlagen, Debitoren, Kreditoren oder offene Posten übernommene Salden ausschließen. Migrationsverrechnungskonten auf null abstimmen.

See customer/coverage-requirements.json, source mapping and the native DDIC preflight. No SAP activation or posting test has run.
