# ModuPorter Extended Warehouse Management

Version 0.1.0. Draft templates, never activated or tested on SAP. Source path: ECC LE-WM or Business Suite/decentralized/embedded EWM; record which native export produced each cohort.

| Module | ID | Structures | Mode |
|---|---|---|---|
| Storage bins and sorting | storage_bin | 2 | master |
| Warehouse products and fixed bins | warehouse_product | 2 | master |
| Warehouse stock and serials | warehouse_stock | 2 | balance |
| Handling units and contents | handling_unit | 2 | process-reference |
| Warehouse tasks and confirmations | warehouse_task | 2 | process-reference |
| Warehouse orders | warehouse_order | 1 | process-reference |
| Inbound and outbound warehouse deliveries | warehouse_delivery | 2 | process-reference |
| Packaging specifications | pack_specification | 3 | master |

LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.

These packs define canonical export contracts and customer-owned staging DDIC tables. They do not directly query or change native SAP business tables. Basic → Composite → Consumption preserves each contract's grain. The target stages and comparison views contain exported target evidence; a stage insert is not a business migration. All values are text to preserve IDs, decimal representations and UTC/time-zone evidence. Use approved currency/unit totals; no mathematical meaning is implied by a CHAR field. Long texts, binaries, all customizing and every industry/application feature are outside this explicitly catalogued scope.
