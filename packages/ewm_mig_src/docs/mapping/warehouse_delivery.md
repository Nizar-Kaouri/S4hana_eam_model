# Migration interface: warehouse_delivery

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `warehouse_product`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `DeliveryID` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZWMX_C_WhDeliveryMig`

- Source: `ZWMX_I_WhDelivery`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `DeliveryID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZWMX_WMS012-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZWMX_WMS012-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZWMX_WMS012-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `Warehouse` | ZWMX_WMS012-F004 | Customer native interface: Warehouse (adapter required) | information only | yes |
| `DeliveryID` | ZWMX_WMS012-F005 | Customer native interface: DeliveryID (adapter required) | information only | yes |
| `DeliveryCategory` | ZWMX_WMS012-F006 | Customer native interface: DeliveryCategory (adapter required) | information only | yes |
| `ExternalDelivery` | ZWMX_WMS012-F007 | Customer native interface: ExternalDelivery (adapter required) | information only | yes |
| `Partner` | ZWMX_WMS012-F008 | Customer native interface: Partner (adapter required) | information only | yes |
| `DeliveryStatus` | ZWMX_WMS012-F009 | Customer native interface: DeliveryStatus (adapter required) | information only | yes |
| `PlannedAtUTC` | ZWMX_WMS012-F010 | Customer native interface: PlannedAtUTC (adapter required) | information only | yes |

## `ZWMX_C_WhDeliveryItemMig`

- Source: `ZWMX_I_WhDeliveryItem`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `DeliveryID`, `DeliveryItem`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZWMX_WMS013-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZWMX_WMS013-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZWMX_WMS013-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `Warehouse` | ZWMX_WMS013-F004 | Customer native interface: Warehouse (adapter required) | information only | yes |
| `DeliveryID` | ZWMX_WMS013-F005 | Customer native interface: DeliveryID (adapter required) | information only | yes |
| `DeliveryItem` | ZWMX_WMS013-F006 | Customer native interface: DeliveryItem (adapter required) | information only | yes |
| `Product` | ZWMX_WMS013-F007 | Customer native interface: Product (adapter required) | information only | yes |
| `Batch` | ZWMX_WMS013-F008 | Customer native interface: Batch (adapter required) | information only | yes |
| `Quantity` | ZWMX_WMS013-F009 | Customer native interface: Quantity (adapter required) | information only | yes |
| `QuantityUnit` | ZWMX_WMS013-F010 | Customer native interface: QuantityUnit (adapter required) | information only | yes |
| `HandlingUnit` | ZWMX_WMS013-F011 | Customer native interface: HandlingUnit (adapter required) | information only | yes |
| `ReferenceDocument` | ZWMX_WMS013-F012 | Customer native interface: ReferenceDocument (adapter required) | information only | yes |
| `ReferenceItem` | ZWMX_WMS013-F013 | Customer native interface: ReferenceItem (adapter required) | information only | yes |

## Reconciliation

- Counts: `ZWMX_C_WhDeliveryMigCount` (ECC) vs `ZWMT_I_WhDeliveryCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZWMX_C_WhDeliveryMig` vs `ZWMT_I_WhDeliveryCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `Warehouse`, `DeliveryID`; compared: `DeliveryCategory`, `ExternalDelivery`, `Partner`, `DeliveryStatus`, `PlannedAtUTC`

```bash
python3 tools/mig_reconcile.py counts --product ewm_mig_src --module warehouse_delivery --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ewm_mig_src --module warehouse_delivery --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- LE-WM and EWM are distinct source models. Warehouse numbers, entitled-to-dispose party, owner, stock type, batch, HU and serial identities require mapping. Freeze inventory and reconcile MM/IM and EWM without loading stock twice. Open warehouse tasks, orders and deliveries require a verified process migration; recreate or complete them through supported business operations, not table inserts. Packaging specifications and storage-type customizing must be validated independently.
- Native export adapters and target business posting are customer implementations.
