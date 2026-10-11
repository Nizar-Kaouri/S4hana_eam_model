# Supported scope

ModuPorter Asset Accounting version 1.0.0.

| Module | ID | Extraction structures |
|---|---|---:|
| Asset fiscal year balances | asset_balance | 1 |
| Asset transaction history | asset_transaction | 1 |
| Fixed assets | fixed_asset | 4 |

## Delivery boundaries

Read-only extraction and comparison templates. Histories, balances and process references are not automatically posted as master data. Business eligibility, effectivity, cutover and target posting interfaces are customer configuration decisions.

## Domain details

# Supported scope

Asset Accounting has 3 modules and 5 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Fixed assets | fixed_asset | 4 | master |
| Asset transaction history | asset_transaction | 1 | reference |
| Asset fiscal year balances | asset_balance | 1 | balance |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented extraction structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/fi_aa; they are not duplicated as migration payloads.

Depreciation areas, currencies, fiscal years and transfer dates must be agreed. ANLC values are fiscal-year accumulations, not a ready-made posting file. Asset balances must not also enter the general ledger opening balance. Asset transaction history is reconciliation reference data; Universal Parallel Accounting requires a separate supported interface assessment.

This scope does not imply every SAP feature is covered. Full-row allowlisted exports retain additional DDIC fields for customer extension. No posting program, customizing migration, business status replay, delta synchronization, clean-core certification or SAP runtime certification is supplied.

Master and child preparation follows MASTER_CHILD_ARCHITECTURE.md; full source keys and selected parent populations are preserved.
