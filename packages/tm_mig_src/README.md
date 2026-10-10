# ModuPorter Transportation Management

Version 0.1.0. Draft templates, never activated or tested on SAP. Source path: SAP TM 9.x standalone or S/4HANA embedded/decentralized TM; ECC shipments are a separate predecessor model.

| Module | ID | Structures | Mode |
|---|---|---|---|
| Transportation locations | transport_location | 1 | master |
| Vehicles trailers and capacities | transport_resource | 2 | master |
| Transportation lanes | transport_lane | 2 | master |
| Transportation schedules and stops | transport_schedule | 2 | master |
| Freight agreements rates and scales | freight_agreement | 3 | master |
| Freight units items and stops | freight_unit | 3 | process-reference |
| Freight orders and bookings | freight_order | 4 | process-reference |
| Freight settlement references | freight_settlement | 2 | reference |

Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

These packs define canonical export contracts and customer-owned staging DDIC tables. They do not directly query or change native SAP business tables. Basic → Composite → Consumption preserves each contract's grain. The target stages and comparison views contain exported target evidence; a stage insert is not a business migration. All values are text to preserve IDs, decimal representations and UTC/time-zone evidence. Use approved currency/unit totals; no mathematical meaning is implied by a CHAR field. Long texts, binaries, all customizing and every industry/application feature are outside this explicitly catalogued scope.
