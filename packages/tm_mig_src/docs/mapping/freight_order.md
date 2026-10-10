# Migration interface: freight_order

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `transport_location`, `transport_resource`, `freight_unit`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `FreightOrderID` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZTMX_C_FreightOrderMig`

- Source: `ZTMX_I_FreightOrder`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `FreightOrderID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS014-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZTMX_TMS014-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZTMX_TMS014-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `FreightOrderID` | ZTMX_TMS014-F004 | Customer native interface: FreightOrderID (adapter required) | information only | yes |
| `NativeGUID` | ZTMX_TMS014-F005 | Customer native interface: NativeGUID (adapter required) | information only | yes |
| `DocumentCategory` | ZTMX_TMS014-F006 | Customer native interface: DocumentCategory (adapter required) | information only | yes |
| `OrderType` | ZTMX_TMS014-F007 | Customer native interface: OrderType (adapter required) | information only | yes |
| `Carrier` | ZTMX_TMS014-F008 | Customer native interface: Carrier (adapter required) | information only | yes |
| `ResourceID` | ZTMX_TMS014-F009 | Customer native interface: ResourceID (adapter required) | information only | yes |
| `ExecutionStatus` | ZTMX_TMS014-F010 | Customer native interface: ExecutionStatus (adapter required) | information only | yes |
| `SettlementStatus` | ZTMX_TMS014-F011 | Customer native interface: SettlementStatus (adapter required) | information only | yes |

## `ZTMX_C_FreightOrdItemMig`

- Source: `ZTMX_I_FreightOrdItem`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `FreightOrderID`, `ItemID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS015-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZTMX_TMS015-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZTMX_TMS015-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `FreightOrderID` | ZTMX_TMS015-F004 | Customer native interface: FreightOrderID (adapter required) | information only | yes |
| `ItemID` | ZTMX_TMS015-F005 | Customer native interface: ItemID (adapter required) | information only | yes |
| `FreightUnitID` | ZTMX_TMS015-F006 | Customer native interface: FreightUnitID (adapter required) | information only | yes |
| `Product` | ZTMX_TMS015-F007 | Customer native interface: Product (adapter required) | information only | yes |
| `Quantity` | ZTMX_TMS015-F008 | Customer native interface: Quantity (adapter required) | information only | yes |
| `QuantityUnit` | ZTMX_TMS015-F009 | Customer native interface: QuantityUnit (adapter required) | information only | yes |

## `ZTMX_C_FreightOrdStopMig`

- Source: `ZTMX_I_FreightOrdStop`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `FreightOrderID`, `StopID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS016-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZTMX_TMS016-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZTMX_TMS016-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `FreightOrderID` | ZTMX_TMS016-F004 | Customer native interface: FreightOrderID (adapter required) | information only | yes |
| `StopID` | ZTMX_TMS016-F005 | Customer native interface: StopID (adapter required) | information only | yes |
| `LocationID` | ZTMX_TMS016-F006 | Customer native interface: LocationID (adapter required) | information only | yes |
| `Sequence` | ZTMX_TMS016-F007 | Customer native interface: Sequence (adapter required) | information only | yes |
| `StopRole` | ZTMX_TMS016-F008 | Customer native interface: StopRole (adapter required) | information only | yes |
| `PlannedAtUTC` | ZTMX_TMS016-F009 | Customer native interface: PlannedAtUTC (adapter required) | information only | yes |
| `ActualAtUTC` | ZTMX_TMS016-F010 | Customer native interface: ActualAtUTC (adapter required) | information only | yes |
| `TimeZone` | ZTMX_TMS016-F011 | Customer native interface: TimeZone (adapter required) | information only | yes |

## `ZTMX_C_FreightStageMig`

- Source: `ZTMX_I_FreightStage`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `FreightOrderID`, `StageID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS017-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZTMX_TMS017-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZTMX_TMS017-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `FreightOrderID` | ZTMX_TMS017-F004 | Customer native interface: FreightOrderID (adapter required) | information only | yes |
| `StageID` | ZTMX_TMS017-F005 | Customer native interface: StageID (adapter required) | information only | yes |
| `FromStop` | ZTMX_TMS017-F006 | Customer native interface: FromStop (adapter required) | information only | yes |
| `ToStop` | ZTMX_TMS017-F007 | Customer native interface: ToStop (adapter required) | information only | yes |
| `Distance` | ZTMX_TMS017-F008 | Customer native interface: Distance (adapter required) | information only | yes |
| `DistanceUnit` | ZTMX_TMS017-F009 | Customer native interface: DistanceUnit (adapter required) | information only | yes |
| `TransportMode` | ZTMX_TMS017-F010 | Customer native interface: TransportMode (adapter required) | information only | yes |

## Reconciliation

- Counts: `ZTMX_C_FreightOrderMigCount` (ECC) vs `ZTMT_I_FreightOrderCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZTMX_C_FreightOrderMig` vs `ZTMT_I_FreightOrderCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `FreightOrderID`; compared: `NativeGUID`, `DocumentCategory`, `OrderType`, `Carrier`, `ResourceID`, `ExecutionStatus`, `SettlementStatus`

```bash
python3 tools/mig_reconcile.py counts --product tm_mig_src --module freight_order --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product tm_mig_src --module freight_order --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.
- Native export adapters and target business posting are customer implementations.
