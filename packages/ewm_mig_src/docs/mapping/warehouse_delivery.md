# Migration interface: warehouse_delivery

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `DeliveryUUID` · numbering **keep**
- **Key rule:** Map regenerated target UUIDs before comparing; current client is implicit.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZWMX_C_WhDeliveryMig`

- Source: `ZWMX_I_WhDelivery`
- Keys: `DeliveryUUID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Inbound delivery header only. Outbound branch, partner-role selection, status and cutover eligibility remain pending; do not interpret the broad snapshot as open deliveries.

| Element | Source (SAP source) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `DeliveryUUID` | /SCDL/DB_PROCH_I-DOCID | Native target evidence: ZWMT_B_WhDeliveryCompare.DeliveryUUID | information only | yes |
| `Delivery` | /SCDL/DB_PROCH_I-DOCNO | Native target evidence: ZWMT_B_WhDeliveryCompare.Delivery | information only | yes |
| `DeliveryType` | /SCDL/DB_PROCH_I-DOCTYPE | Native target evidence: ZWMT_B_WhDeliveryCompare.DeliveryType | information only | yes |
| `DeliveryCategory` | /SCDL/DB_PROCH_I-DOCCAT | Native target evidence: ZWMT_B_WhDeliveryCompare.DeliveryCategory | information only | yes |
| `Incoterms` | /SCDL/DB_PROCH_I-INCO1 | Native target evidence: ZWMT_B_WhDeliveryCompare.Incoterms | information only | yes |
| `IncotermsLocation` | /SCDL/DB_PROCH_I-INCO2 | Native target evidence: ZWMT_B_WhDeliveryCompare.IncotermsLocation | information only | yes |
| `CreatedBy` | /SCDL/DB_PROCH_I-CREUSER | Native target evidence: ZWMT_B_WhDeliveryCompare.CreatedBy | information only | yes |
| `CreatedAt` | /SCDL/DB_PROCH_I-CRETST | Native target evidence: ZWMT_B_WhDeliveryCompare.CreatedAt | information only | yes |

## `ZWMX_C_WhDeliveryItemMig`

- Source: `ZWMX_I_WhDeliveryItem`
- Keys: `DeliveryUUID`, `DeliveryItemUUID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Inbound items only; DOCID/ITEMID candidate grain must be confirmed in DDIC. Quantities belong to role-qualified /SCDL/DB_ADDMEAS records, not invented item QTY columns. Outbound branch, quantity/date roles, status and parent cohort closure remain pending.

| Element | Source (SAP source) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `DeliveryUUID` | /SCDL/DB_PROCI_I-DOCID | Native target evidence: ZWMT_B_WhDeliveryItemCompare.DeliveryUUID | information only | yes |
| `DeliveryItemUUID` | /SCDL/DB_PROCI_I-ITEMID | Native target evidence: ZWMT_B_WhDeliveryItemCompare.DeliveryItemUUID | information only | yes |
| `DeliveryItem` | /SCDL/DB_PROCI_I-ITEMNO | Native target evidence: ZWMT_B_WhDeliveryItemCompare.DeliveryItem | information only | yes |
| `ItemType` | /SCDL/DB_PROCI_I-ITEMTYPE | Native target evidence: ZWMT_B_WhDeliveryItemCompare.ItemType | information only | yes |
| `ItemCategory` | /SCDL/DB_PROCI_I-ITEMCAT | Native target evidence: ZWMT_B_WhDeliveryItemCompare.ItemCategory | information only | yes |
| `ProductUUID` | /SCDL/DB_PROCI_I-PRODUCTID | Native target evidence: ZWMT_B_WhDeliveryItemCompare.ProductUUID | information only | yes |
| `Product` | /SCDL/DB_PROCI_I-PRODUCTNO | Native target evidence: ZWMT_B_WhDeliveryItemCompare.Product | information only | yes |
| `EnteredProduct` | /SCDL/DB_PROCI_I-PRODUCTENT | Native target evidence: ZWMT_B_WhDeliveryItemCompare.EnteredProduct | information only | yes |
| `Priority` | /SCDL/DB_PROCI_I-PRIORITY | Native target evidence: ZWMT_B_WhDeliveryItemCompare.Priority | information only | yes |
| `Batch` | /SCDL/DB_PROCI_I-BATCHNO | Native target evidence: ZWMT_B_WhDeliveryItemCompare.Batch | information only | yes |
| `StockUsage` | /SCDL/DB_PROCI_I-STOCK_USAGE | Native target evidence: ZWMT_B_WhDeliveryItemCompare.StockUsage | information only | yes |
| `StockCategory` | /SCDL/DB_PROCI_I-STOCK_CATEGORY | Native target evidence: ZWMT_B_WhDeliveryItemCompare.StockCategory | information only | yes |
| `StockOwner` | /SCDL/DB_PROCI_I-STOCK_OWNER | Native target evidence: ZWMT_B_WhDeliveryItemCompare.StockOwner | information only | yes |
| `StockOwnerRole` | /SCDL/DB_PROCI_I-STOCK_OWNER_ROLE | Native target evidence: ZWMT_B_WhDeliveryItemCompare.StockOwnerRole | information only | yes |
| `EntitledParty` | /SCDL/DB_PROCI_I-ENTITLED | Native target evidence: ZWMT_B_WhDeliveryItemCompare.EntitledParty | information only | yes |
| `EntitledPartyRole` | /SCDL/DB_PROCI_I-ENTITLED_ROLE | Native target evidence: ZWMT_B_WhDeliveryItemCompare.EntitledPartyRole | information only | yes |
| `Warehouse` | /SCDL/DB_PROCI_I-LGNUM | Native target evidence: ZWMT_B_WhDeliveryItemCompare.Warehouse | information only | yes |

## Reconciliation

- Counts: `ZWMX_C_WhDeliveryMigCount` (SAP source) vs `ZWMT_I_WhDeliveryCount` (S/4HANA) as global candidate counts
- Records and fields: `ZWMX_C_WhDeliveryMig` vs `ZWMT_B_WhDeliveryCompare` on `DeliveryUUID`; compared: `Delivery`, `DeliveryType`, `DeliveryCategory`, `Incoterms`, `IncotermsLocation`, `CreatedBy`, `CreatedAt`

```bash
python3 tools/mig_reconcile.py counts --product ewm_mig_src --module warehouse_delivery --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ewm_mig_src --module warehouse_delivery --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- WhDelivery: Inbound delivery header only. Outbound branch, partner-role selection, status and cutover eligibility remain pending; do not interpret the broad snapshot as open deliveries.
- WhDeliveryItem: Inbound items only; DOCID/ITEMID candidate grain must be confirmed in DDIC. Quantities belong to role-qualified /SCDL/DB_ADDMEAS records, not invented item QTY columns. Outbound branch, quantity/date roles, status and parent cohort closure remain pending.
