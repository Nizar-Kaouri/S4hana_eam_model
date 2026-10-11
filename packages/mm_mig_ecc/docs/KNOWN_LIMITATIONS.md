# Known limitations

Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

All raw source grain and target CDS fields are candidates pending system verification. Supporting structures have CSV contracts, not invented released SAP views. Selection is intentionally explicit and empty by default. It does not automatically derive business eligibility, dependency closure, historic open items, stock or effective BOM/routing states. Posting and configuration are customer work. These release packages must pass the customer acceptance test before sale as validated packages.

## Coverage additions — 0.2.0

### Purchasing info records (`purchasing_info_record`)

Migrate general and purchasing-organization data at their separate grains. Supplier/business-partner mapping and units are prerequisites. EINE current net price does not supply complete time-dependent conditions: export the configured purchasing condition tables, KONH/KONP and scales as a linked set with validity, access key and deletion checks. Do not claim complete condition coverage from EINA/EINE alone.

### Purchasing contracts (`purchasing_contract`)

Select EKKO document category K and approved contract types; exclude purchase orders and scheduling agreements. Verify validity, value versus quantity contract, remaining target obligation and releases against the contract. Link account assignments and time-dependent conditions; release history is evidence, not a second purchase-order load. Supplier, CO/PS and account mappings require cross-domain approval.
