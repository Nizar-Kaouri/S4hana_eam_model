# Known limitations

Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

All raw source grain and target CDS fields are candidates pending system verification. Supporting structures have CSV contracts, not invented released SAP views. Selection is intentionally explicit and empty by default. It does not automatically derive business eligibility, dependency closure, historic open items, stock or effective BOM/routing states. Posting and configuration are customer work. These draft packages must pass the customer acceptance test before sale as validated packages.

## Coverage additions — 0.2.0

### Bank master (`bank`)

Bank country and key identify the bank; preserve country-specific key formats and deletion status. House banks, house-bank accounts, bank account management and customer/supplier bank details are distinct objects and require their own approved interface/configuration. Do not treat bank master as a bank account balance.

### Dedicated G/L opening balances (`gl_opening_balance`)

Choose classic OR new G/L for each ledger population; do not union both. DDIC must confirm all ledger dimensions and include any additional keys. Period 00 is carryforward, not period 01; calculate cutoff totals from the approved fiscal-year/period contract, including special periods only as intended. Enrich currency types from ledger/company configuration and classify accounts from SKB1. Exclude balances already supplied by FI-AA/AP/AR/open-item migration; reconcile migration clearing accounts to zero. No automatic totals-to-posting transformation is supplied.
