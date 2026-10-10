# Supported scope

Financial Accounting has 5 modules and 17 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| G/L accounts | gl_account | 3 | master |
| Supplier source data | supplier | 3 | master |
| Customer source data | customer | 3 | master |
| Accounting document history | gl_line_item | 2 | reference |
| Current and cleared item indexes | open_items | 6 | open-item |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented candidate structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/fi; they are not duplicated as migration payloads.

Customers and suppliers require Business Partner/CVI mapping, roles and numbering. FI BSEG may be a cluster table in ECC and therefore cannot be assumed readable by CDS; use the full-row ABAP helper or a verified extraction interface when necessary. Open-at-cutover means posted by cutover and not cleared by cutover, including subsequently cleared items. Separate currencies, debit/credit signs, ledgers and fiscal periods; prevent double-counting subledger openings in G/L balances.

This scope does not imply every SAP feature is covered. Full-row allowlisted exports retain additional DDIC fields for customer extension. No posting program, customizing migration, business status replay, delta synchronization, clean-core certification or SAP runtime certification is supplied.
