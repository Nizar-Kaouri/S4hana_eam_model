# Supported scope

ModuPorter Materials Management version 1.0.0.

| Module | ID | Objects |
|---|---|---:|
| Goods movement history target comparison | goods_movement | 0 |
| Inventory balances target comparison | material_stock | 0 |
| Material master target comparison | product | 2 |
| Purchase orders target comparison | purchase_order | 2 |
| Purchase requisitions target comparison | purchase_requisition | 2 |
| Purchasing contracts target comparison | purchasing_contract | 0 |
| Purchasing info records target comparison | purchasing_info_record | 0 |

## Delivery boundaries

Read-only extraction and comparison templates. Histories, balances and process references are not automatically posted as master data. Business eligibility, effectivity, cutover and target posting interfaces are customer configuration decisions.

## Domain details

# Supported scope

Materials Management has 7 modules and 26 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Purchasing contracts | purchasing_contract | 3 | open-document |
| Purchasing info records | purchasing_info_record | 2 | master |
| Material master | product | 8 | master |
| Inventory balances | material_stock | 4 | balance |
| Goods movement history | goods_movement | 2 | reference |
| Purchase requisitions | purchase_requisition | 2 | open-document |
| Purchase orders | purchase_order | 5 | open-document |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented extraction structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/mm; they are not duplicated as migration payloads.

Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

This scope does not imply every SAP feature is covered. Full-row allowlisted exports retain additional DDIC fields for customer extension. No posting program, customizing migration, business status replay, delta synchronization, clean-core certification or SAP runtime certification is supplied.

## Coverage additions — 0.2.0

### Purchasing info records (`purchasing_info_record`)

Migrate general and purchasing-organization data at their separate grains. Supplier/business-partner mapping and units are prerequisites. EINE current net price does not supply complete time-dependent conditions: export the configured purchasing condition tables, KONH/KONP and scales as a linked set with validity, access key and deletion checks. Do not claim complete condition coverage from EINA/EINE alone.

### Purchasing contracts (`purchasing_contract`)

Select EKKO document category K and approved contract types; exclude purchase orders and scheduling agreements. Verify validity, value versus quantity contract, remaining target obligation and releases against the contract. Link account assignments and time-dependent conditions; release history is evidence, not a second purchase-order load. Supplier, CO/PS and account mappings require cross-domain approval.
