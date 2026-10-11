# Migration interface: transport_location

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `LocationUUID` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger before comparison.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZTMX_C_TransportLocMig`

- Source: `ZTMX_I_TransportLoc`
- Keys: `LocationUUID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Internal location UUID is preserved. Address, location type and time zone payload remain pending. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `LocationUUID` | /SAPAPO/LOC-LOCID | Native target evidence: ZTMT_B_TransportLocCompare.LocationUUID | copy | yes |
| `LocationID` | /SAPAPO/LOC-LOCNO | Native target evidence: ZTMT_B_TransportLocCompare.LocationID | copy | yes |
| `DeletionFlag` | /SAPAPO/LOC-LVORM | Native target evidence: ZTMT_B_TransportLocCompare.DeletionFlag | copy | yes |
| `Longitude` | /SAPAPO/LOC-XPOS | Native target evidence: ZTMT_B_TransportLocCompare.Longitude | copy | yes |
| `Latitude` | /SAPAPO/LOC-YPOS | Native target evidence: ZTMT_B_TransportLocCompare.Latitude | copy | yes |

## Reconciliation

- Counts: `ZTMX_C_TransportLocMigCount` (SAP source) vs `ZTMT_I_TransportLocCount` (S/4HANA) as global candidate counts
- Records and fields: `ZTMX_C_TransportLocMig` vs `ZTMT_B_TransportLocCompare` on `LocationUUID`; compared: `LocationID`, `DeletionFlag`, `Longitude`, `Latitude`

```bash
python3 tools/mig_reconcile.py counts --product tm_mig_src --module transport_location --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product tm_mig_src --module transport_location --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- TransportLoc: Internal location UUID is preserved. Address, location type and time zone payload remain pending.
