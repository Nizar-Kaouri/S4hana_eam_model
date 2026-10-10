# ModuPorter domain migration packs

Eight domain drafts using ECC Basic, Composite and Consumption layers, with target CDS candidates and CSV adapters. None has been activated on SAP.

| Domain | Modules | Structures | ECC views | S4 views |
|---|---|---|---|---|
| Asset Accounting | 3 | 5 | 18 | 2 |
| Materials Management | 5 | 21 | 68 | 6 |
| Quality Management | 4 | 15 | 49 | 4 |
| Project System | 3 | 4 | 15 | 4 |
| Production Planning | 4 | 15 | 49 | 2 |
| Controlling | 5 | 9 | 32 | 6 |
| Financial Accounting | 5 | 17 | 56 | 6 |
| Sales and Distribution | 3 | 12 | 39 | 6 |

Every pack includes mappings, scope CSV headers, a synthetic walkthrough, customer tests, bilingual Markdown manuals and its VDM map. Reference history and balances require verified business adapters. Existing analytics report modules remain in their original packages.

Offline evidence: parser and repository/mapping checks; synthetic scope preparation for all eight domains; identical, changed-value and duplicate-key comparisons for all 98 structures. This is not SAP runtime evidence.

See ModuPorter-Domains-VDM.html for all objects and each product CUSTOMER_TEST.md for acceptance steps.
