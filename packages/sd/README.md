# Sales and Distribution (SD) - CDS virtual data model

Naming: **B_ = Basic, I_ = Interface (Composite), C_ = Consumption**. See [naming guidance](../../docs/NAMING.md).

> **Status: draft-unverified.** Written without an SAP system; nothing has been activated or tested.
> Every uncertain element carries a `TODO-VERIFY` marker, ranked in [`BATCH_REPORT.md`](BATCH_REPORT.md).

| | |
|---|---|
| Product folder | `packages/sd` |
| Object prefix | `ZSDV_` (replaced per customer by the build) |
| ABAP package | `ZSDV_VDM` |
| Target release | SAP S/4HANA 2025 (on-premise / Private Cloud Edition) |
| Entity map | [`docs/model_map.html`](docs/model_map.html) |

Same architecture and rules as the EAM product (see `packages/eam/README.md`): basic `ZSDV_B_*`,
composite `ZSDV_I_*` (cubes), consumption `ZSDV_C_*Q` (analytical queries); one self-contained module
per business object; hard dependencies added by the build. **2 intra-product link object(s)** ship
only when all their modules are selected; links to other products live in `packages/bridge`.

## Link views (ship only when all listed modules are selected)

| Link object | Requires modules |
|---|---|
| `ZSDV_B_SOItemWithBilling` | billing_document, sales_order |
| `ZSDV_B_SOItemWithDelivery` | outbound_delivery, sales_order |

## Data model in one paragraph

Sales orders come from `I_SalesDocument` / `I_SalesDocumentItem` restricted to document category C. Outbound deliveries carry planned and actual goods issue dates for on-time delivery. Billing items give revenue with a sign (credit memos and cancellations negative, cancelled documents excluded). The open sales order report shows the order backlog with age buckets. Pricing conditions and profitability (margin) are not modeled yet.

## Modules (4 modules, 15 views)

| Module | Batch | Hard dependencies | Views |
|---|---|---|---|
| `sales_order` | 1 | - | `ZSDV_B_SalesOrder`, `ZSDV_B_SalesOrderItem`, `ZSDV_B_SalesOrderVH`, `ZSDV_I_SalesOrderItem`, `ZSDV_C_SalesOrderQ` |
| `outbound_delivery` | 2 | - | `ZSDV_B_OutboundDelivery`, `ZSDV_B_DeliveryItem`, `ZSDV_I_DeliveryItem`, `ZSDV_C_DeliveryQ` |
| `billing_document` | 2 | - | `ZSDV_B_BillingDocument`, `ZSDV_B_BillingDocumentItem`, `ZSDV_I_Revenue`, `ZSDV_C_RevenueQ` |
| `rpt_open_sales_orders` | 3 | `sales_order` | `ZSDV_I_OpenSalesOrder`, `ZSDV_C_OpenSalesOrderQ` |

## Commands

```bash
python3 tools/check_all.py --only sd
python3 build_package.py --product sd --list
python3 build_package.py --product sd --all --prefix ZACME_ --package ZACME_SD
```
