# Migration interface: transport_schedule

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `transport_location`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `ScheduleID`, `Version` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZTMX_C_ScheduleMig`

- Source: `ZTMX_I_Schedule`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `ScheduleID`, `Version`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS006-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZTMX_TMS006-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZTMX_TMS006-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `ScheduleID` | ZTMX_TMS006-F004 | Customer native interface: ScheduleID (adapter required) | copy | yes |
| `Version` | ZTMX_TMS006-F005 | Customer native interface: Version (adapter required) | copy | yes |
| `Description` | ZTMX_TMS006-F006 | Customer native interface: Description (adapter required) | copy | yes |
| `TransportMode` | ZTMX_TMS006-F007 | Customer native interface: TransportMode (adapter required) | copy | yes |
| `Carrier` | ZTMX_TMS006-F008 | Customer native interface: Carrier (adapter required) | copy | yes |
| `ValidityStartDate` | ZTMX_TMS006-F009 | Customer native interface: ValidityStartDate (adapter required) | copy | yes |
| `ValidityEndDate` | ZTMX_TMS006-F010 | Customer native interface: ValidityEndDate (adapter required) | copy | yes |

## `ZTMX_C_ScheduleStopMig`

- Source: `ZTMX_I_ScheduleStop`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `ScheduleID`, `Version`, `StopID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS007-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZTMX_TMS007-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZTMX_TMS007-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `ScheduleID` | ZTMX_TMS007-F004 | Customer native interface: ScheduleID (adapter required) | copy | yes |
| `Version` | ZTMX_TMS007-F005 | Customer native interface: Version (adapter required) | copy | yes |
| `StopID` | ZTMX_TMS007-F006 | Customer native interface: StopID (adapter required) | copy | yes |
| `LocationID` | ZTMX_TMS007-F007 | Customer native interface: LocationID (adapter required) | copy | yes |
| `Sequence` | ZTMX_TMS007-F008 | Customer native interface: Sequence (adapter required) | copy | yes |
| `ArrivalLocal` | ZTMX_TMS007-F009 | Customer native interface: ArrivalLocal (adapter required) | copy | yes |
| `DepartureLocal` | ZTMX_TMS007-F010 | Customer native interface: DepartureLocal (adapter required) | copy | yes |
| `TimeZone` | ZTMX_TMS007-F011 | Customer native interface: TimeZone (adapter required) | copy | yes |

## Reconciliation

- Counts: `ZTMX_C_ScheduleMigCount` (ECC) vs `ZTMT_I_ScheduleCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZTMX_C_ScheduleMig` vs `ZTMT_I_ScheduleCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `ScheduleID`, `Version`; compared: `Description`, `TransportMode`, `Carrier`, `ValidityStartDate`, `ValidityEndDate`

```bash
python3 tools/mig_reconcile.py counts --product tm_mig_src --module transport_schedule --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product tm_mig_src --module transport_schedule --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.
- Native export adapters and target business posting are customer implementations.
