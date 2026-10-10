# Migration interface: transport_location

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** - (first level)
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `LocationID` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZTMX_C_TransportLocMig`

- Source: `ZTMX_I_TransportLoc`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `LocationID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZTMX_TMS001-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZTMX_TMS001-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZTMX_TMS001-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `LocationID` | ZTMX_TMS001-F004 | Customer native interface: LocationID (adapter required) | copy | yes |
| `LocationType` | ZTMX_TMS001-F005 | Customer native interface: LocationType (adapter required) | copy | yes |
| `Description` | ZTMX_TMS001-F006 | Customer native interface: Description (adapter required) | copy | yes |
| `BusinessPartner` | ZTMX_TMS001-F007 | Customer native interface: BusinessPartner (adapter required) | copy | yes |
| `Country` | ZTMX_TMS001-F008 | Customer native interface: Country (adapter required) | copy | yes |
| `PostalCode` | ZTMX_TMS001-F009 | Customer native interface: PostalCode (adapter required) | copy | yes |
| `City` | ZTMX_TMS001-F010 | Customer native interface: City (adapter required) | copy | yes |
| `TimeZone` | ZTMX_TMS001-F011 | Customer native interface: TimeZone (adapter required) | copy | yes |
| `Latitude` | ZTMX_TMS001-F012 | Customer native interface: Latitude (adapter required) | copy | yes |
| `Longitude` | ZTMX_TMS001-F013 | Customer native interface: Longitude (adapter required) | copy | yes |

## Reconciliation

- Counts: `ZTMX_C_TransportLocMigCount` (ECC) vs `ZTMT_I_TransportLocCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZTMX_C_TransportLocMig` vs `ZTMT_I_TransportLocCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `LocationID`; compared: `LocationType`, `Description`, `BusinessPartner`, `Country`, `PostalCode`, `City`, `TimeZone`, `Latitude`, `Longitude`

```bash
python3 tools/mig_reconcile.py counts --product tm_mig_src --module transport_location --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product tm_mig_src --module transport_location --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Use released business services or a verified native business-object export. Internal node GUIDs, parent relationships, UTC timestamps and local time zones must survive normalization. Freight units/orders/bookings have execution and settlement effects; treat existing documents as process references until the target interface supports the exact state. Agreements, scales, currencies and charges require separate configuration and rating validation. TM upgrade XPRA reports are not generic cross-system migration interfaces.
- Native export adapters and target business posting are customer implementations.
