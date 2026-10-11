# Supported scope

ModuPorter Financial Accounting version 1.0.0.

| Module | ID | Extraction structures |
|---|---|---:|
| Bank master | bank | 2 |
| Customer source data | customer | 4 |
| G/L accounts | gl_account | 3 |
| Accounting document history | gl_line_item | 2 |
| Dedicated G/L opening balances | gl_opening_balance | 2 |
| Current and cleared item indexes | open_items | 6 |
| Supplier source data | supplier | 4 |

## Delivery boundaries

Read-only extraction and comparison templates. Histories, balances and process references are not automatically posted as master data. Business eligibility, effectivity, cutover and target posting interfaces are customer configuration decisions.

## Domain details

# Supported scope

Financial Accounting has 7 modules and 20 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Dedicated G/L opening balances | gl_opening_balance | 2 | balance |
| Bank master | bank | 2 | master |
| G/L accounts | gl_account | 3 | master |
| Supplier source data | supplier | 4 | master |
| Customer source data | customer | 4 | master |
| Accounting document history | gl_line_item | 2 | reference |
| Current and cleared item indexes | open_items | 6 | open-item |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented extraction structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/fi; they are not duplicated as migration payloads.

Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

This scope does not imply every SAP feature is covered. Full-row allowlisted exports retain additional DDIC fields for customer extension. No posting program, customizing migration, business status replay, delta synchronization, clean-core certification or SAP runtime certification is supplied.

## Coverage additions — 0.2.0

### Bank master (`bank`)

Bank country and key identify the bank; preserve country-specific key formats and deletion status. House banks, house-bank accounts, bank account management and customer/supplier bank details are distinct objects and require their own approved interface/configuration. Do not treat bank master as a bank account balance.

### Dedicated G/L opening balances (`gl_opening_balance`)

Choose classic OR new G/L for each ledger population; do not union both. DDIC must confirm all ledger dimensions and include any additional keys. Period 00 is carryforward, not period 01; calculate cutoff totals from the approved fiscal-year/period contract, including special periods only as intended. Enrich currency types from ledger/company configuration and classify accounts from SKB1. Exclude balances already supplied by FI-AA/AP/AR/open-item migration; reconcile migration clearing accounts to zero. No automatic totals-to-posting transformation is supplied.

Master and child preparation follows MASTER_CHILD_ARCHITECTURE.md; full source keys and selected parent populations are preserved.
