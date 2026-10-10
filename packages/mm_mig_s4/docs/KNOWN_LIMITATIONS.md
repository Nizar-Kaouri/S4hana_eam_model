# Known limitations

Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

All raw source grain and target CDS fields are candidates pending system verification. Supporting structures have CSV contracts, not invented released SAP views. Selection is intentionally explicit and empty by default. It does not automatically derive business eligibility, dependency closure, historic open items, stock or effective BOM/routing states. Posting and configuration are customer work. These draft packages must pass the customer acceptance test before sale as validated packages.
