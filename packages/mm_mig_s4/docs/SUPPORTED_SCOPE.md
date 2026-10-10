# Supported scope

Materials Management has 5 modules and 21 extraction structures.

| Module | ID | Structures | Delivery mode |
|---|---|---|---|
| Material master | product | 8 | master |
| Inventory balances | material_stock | 4 | balance |
| Goods movement history | goods_movement | 2 | reference |
| Purchase requisitions | purchase_requisition | 2 | open-document |
| Purchase orders | purchase_order | 5 | open-document |

The Basic layer preserves native table grain; Composite prepares a stable alias contract; Consumption exposes an explicitly documented candidate structure. Separate child structures preserve keys and multiplicity. Candidate data requires customer scope approval before posting. Existing analytical report modules remain in packages/mm; they are not duplicated as migration payloads.

Stock is a frozen, reconciled inventory population, including batch and special stock. MARD quantities alone do not establish complete inventory. Physical inventory, valuation, units and currency conversion need business sign-off. Historical goods movements are reference data. Open purchasing scope requires item status, receipts, invoices, deletion, returns and remaining quantities; it is not inferred from the header alone.

This scope does not imply every SAP feature is covered. Full-row allowlisted exports retain additional DDIC fields for customer extension. No posting program, customizing migration, business status replay, delta synchronization, clean-core certification or SAP runtime certification is supplied.
