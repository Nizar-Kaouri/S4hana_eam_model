# Migration interface: transport_lane

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `transport_location`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `LaneID` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZTMX_C_TransportLaneMig`

- Source: `ZTMX_I_TransportLane`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `LaneID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS004-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZTMX_TMS004-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZTMX_TMS004-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `LaneID` | ZTMX_TMS004-F004 | Customer native interface: LaneID (adapter required) | copy | yes |
| `SourceLocation` | ZTMX_TMS004-F005 | Customer native interface: SourceLocation (adapter required) | copy | yes |
| `DestinationLocation` | ZTMX_TMS004-F006 | Customer native interface: DestinationLocation (adapter required) | copy | yes |
| `TransportMode` | ZTMX_TMS004-F007 | Customer native interface: TransportMode (adapter required) | copy | yes |
| `ValidityStartDate` | ZTMX_TMS004-F008 | Customer native interface: ValidityStartDate (adapter required) | copy | yes |
| `ValidityEndDate` | ZTMX_TMS004-F009 | Customer native interface: ValidityEndDate (adapter required) | copy | yes |

## `ZTMX_C_LaneCarrierMig`

- Source: `ZTMX_I_LaneCarrier`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `LaneID`, `CarrierID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS005-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZTMX_TMS005-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZTMX_TMS005-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `LaneID` | ZTMX_TMS005-F004 | Customer native interface: LaneID (adapter required) | copy | yes |
| `CarrierID` | ZTMX_TMS005-F005 | Customer native interface: CarrierID (adapter required) | copy | yes |
| `Priority` | ZTMX_TMS005-F006 | Customer native interface: Priority (adapter required) | copy | yes |
| `ValidityStartDate` | ZTMX_TMS005-F007 | Customer native interface: ValidityStartDate (adapter required) | copy | yes |
| `ValidityEndDate` | ZTMX_TMS005-F008 | Customer native interface: ValidityEndDate (adapter required) | copy | yes |

## Reconciliation

- Counts: `ZTMX_C_TransportLaneMigCount` (ECC) vs `ZTMT_I_TransportLaneCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZTMX_C_TransportLaneMig` vs `ZTMT_I_TransportLaneCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `LaneID`; compared: `SourceLocation`, `DestinationLocation`, `TransportMode`, `ValidityStartDate`, `ValidityEndDate`

```bash
python3 tools/mig_reconcile.py counts --product tm_mig_src --module transport_lane --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product tm_mig_src --module transport_lane --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.
- Native export adapters and target business posting are customer implementations.
