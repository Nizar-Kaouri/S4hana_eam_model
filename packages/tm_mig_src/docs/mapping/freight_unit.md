# Migration interface: freight_unit

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `transport_location`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `FreightUnitID` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZTMX_C_FreightUnitMig`

- Source: `ZTMX_I_FreightUnit`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `FreightUnitID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS011-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZTMX_TMS011-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZTMX_TMS011-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `FreightUnitID` | ZTMX_TMS011-F004 | Customer native interface: FreightUnitID (adapter required) | information only | yes |
| `NativeGUID` | ZTMX_TMS011-F005 | Customer native interface: NativeGUID (adapter required) | information only | yes |
| `UnitType` | ZTMX_TMS011-F006 | Customer native interface: UnitType (adapter required) | information only | yes |
| `DocumentStatus` | ZTMX_TMS011-F007 | Customer native interface: DocumentStatus (adapter required) | information only | yes |
| `SourceLocation` | ZTMX_TMS011-F008 | Customer native interface: SourceLocation (adapter required) | information only | yes |
| `DestinationLocation` | ZTMX_TMS011-F009 | Customer native interface: DestinationLocation (adapter required) | information only | yes |

## `ZTMX_C_FreightUnitIteMig`

- Source: `ZTMX_I_FreightUnitIte`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `FreightUnitID`, `ItemID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS012-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZTMX_TMS012-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZTMX_TMS012-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `FreightUnitID` | ZTMX_TMS012-F004 | Customer native interface: FreightUnitID (adapter required) | information only | yes |
| `ItemID` | ZTMX_TMS012-F005 | Customer native interface: ItemID (adapter required) | information only | yes |
| `Product` | ZTMX_TMS012-F006 | Customer native interface: Product (adapter required) | information only | yes |
| `Quantity` | ZTMX_TMS012-F007 | Customer native interface: Quantity (adapter required) | information only | yes |
| `QuantityUnit` | ZTMX_TMS012-F008 | Customer native interface: QuantityUnit (adapter required) | information only | yes |
| `GrossWeight` | ZTMX_TMS012-F009 | Customer native interface: GrossWeight (adapter required) | information only | yes |
| `WeightUnit` | ZTMX_TMS012-F010 | Customer native interface: WeightUnit (adapter required) | information only | yes |
| `ReferenceDocument` | ZTMX_TMS012-F011 | Customer native interface: ReferenceDocument (adapter required) | information only | yes |
| `ReferenceItem` | ZTMX_TMS012-F012 | Customer native interface: ReferenceItem (adapter required) | information only | yes |

## `ZTMX_C_FreightUnitStoMig`

- Source: `ZTMX_I_FreightUnitSto`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `FreightUnitID`, `StopID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS013-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZTMX_TMS013-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZTMX_TMS013-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `FreightUnitID` | ZTMX_TMS013-F004 | Customer native interface: FreightUnitID (adapter required) | information only | yes |
| `StopID` | ZTMX_TMS013-F005 | Customer native interface: StopID (adapter required) | information only | yes |
| `LocationID` | ZTMX_TMS013-F006 | Customer native interface: LocationID (adapter required) | information only | yes |
| `Sequence` | ZTMX_TMS013-F007 | Customer native interface: Sequence (adapter required) | information only | yes |
| `StopRole` | ZTMX_TMS013-F008 | Customer native interface: StopRole (adapter required) | information only | yes |
| `PlannedAtUTC` | ZTMX_TMS013-F009 | Customer native interface: PlannedAtUTC (adapter required) | information only | yes |
| `TimeZone` | ZTMX_TMS013-F010 | Customer native interface: TimeZone (adapter required) | information only | yes |

## Reconciliation

- Counts: `ZTMX_C_FreightUnitMigCount` (ECC) vs `ZTMT_I_FreightUnitCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZTMX_C_FreightUnitMig` vs `ZTMT_I_FreightUnitCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `FreightUnitID`; compared: `NativeGUID`, `UnitType`, `DocumentStatus`, `SourceLocation`, `DestinationLocation`

```bash
python3 tools/mig_reconcile.py counts --product tm_mig_src --module freight_unit --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product tm_mig_src --module freight_unit --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.
- Native export adapters and target business posting are customer implementations.
