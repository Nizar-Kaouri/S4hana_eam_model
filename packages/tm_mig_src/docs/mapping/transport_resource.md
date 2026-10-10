# Migration interface: transport_resource

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** - (first level)
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `ResourceID` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZTMX_C_TransportResMig`

- Source: `ZTMX_I_TransportRes`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `ResourceID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS002-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZTMX_TMS002-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZTMX_TMS002-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `ResourceID` | ZTMX_TMS002-F004 | Customer native interface: ResourceID (adapter required) | copy | yes |
| `ResourceType` | ZTMX_TMS002-F005 | Customer native interface: ResourceType (adapter required) | copy | yes |
| `Description` | ZTMX_TMS002-F006 | Customer native interface: Description (adapter required) | copy | yes |
| `Carrier` | ZTMX_TMS002-F007 | Customer native interface: Carrier (adapter required) | copy | yes |
| `VehicleType` | ZTMX_TMS002-F008 | Customer native interface: VehicleType (adapter required) | copy | yes |
| `TimeZone` | ZTMX_TMS002-F009 | Customer native interface: TimeZone (adapter required) | copy | yes |

## `ZTMX_C_ResCapacityMig`

- Source: `ZTMX_I_ResCapacity`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `ResourceID`, `CapacityID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS003-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZTMX_TMS003-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZTMX_TMS003-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `ResourceID` | ZTMX_TMS003-F004 | Customer native interface: ResourceID (adapter required) | copy | yes |
| `CapacityID` | ZTMX_TMS003-F005 | Customer native interface: CapacityID (adapter required) | copy | yes |
| `CapacityType` | ZTMX_TMS003-F006 | Customer native interface: CapacityType (adapter required) | copy | yes |
| `CapacityValue` | ZTMX_TMS003-F007 | Customer native interface: CapacityValue (adapter required) | copy | yes |
| `CapacityUnit` | ZTMX_TMS003-F008 | Customer native interface: CapacityUnit (adapter required) | copy | yes |

## Reconciliation

- Counts: `ZTMX_C_TransportResMigCount` (ECC) vs `ZTMT_I_TransportResCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZTMX_C_TransportResMig` vs `ZTMT_I_TransportResCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `ResourceID`; compared: `ResourceType`, `Description`, `Carrier`, `VehicleType`, `TimeZone`

```bash
python3 tools/mig_reconcile.py counts --product tm_mig_src --module transport_resource --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product tm_mig_src --module transport_resource --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.
- Native export adapters and target business posting are customer implementations.
