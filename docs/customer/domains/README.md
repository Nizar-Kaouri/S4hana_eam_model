# ModuPorter domain migration packs

Eight domain drafts using ECC Basic, Composite and Consumption layers, with target CDS candidates and CSV adapters. None has been activated on SAP.

| Domain | Modules | Structures | ECC views | S4 views |
|---|---|---|---|---|
| Asset Accounting | 3 | 5 | 18 | 2 |
| Materials Management | 7 | 26 | 85 | 6 |
| Quality Management | 6 | 18 | 60 | 4 |
| Project System | 7 | 14 | 49 | 4 |
| Production Planning | 6 | 17 | 57 | 2 |
| Controlling | 7 | 13 | 46 | 6 |
| Financial Accounting | 7 | 20 | 67 | 6 |
| Sales and Distribution | 4 | 16 | 52 | 6 |

Every pack includes mappings, scope CSV headers, a synthetic walkthrough, customer tests, bilingual Markdown manuals and its VDM map. Reference history and balances require verified business adapters. Existing analytics report modules remain in their original packages.

Offline evidence: parser and repository/mapping checks; synthetic scope preparation for all eight domains; identical, changed-value and duplicate-key comparisons for all 129 structures. This is not SAP runtime evidence.

See ModuPorter-Domains-VDM.html for all objects and each product CUSTOMER_TEST.md for acceptance steps.
