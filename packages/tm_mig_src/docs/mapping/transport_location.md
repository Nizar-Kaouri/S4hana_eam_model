# Migration interface: transport_location

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `LocationUUID` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger during loading.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZTMX_C_TransportLocMig`

- Source: `ZTMX_I_TransportLoc`
- Keys: `LocationUUID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Internal location UUID is preserved. Address, location type and time zone payload remain pending. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `LocationUUID` | /SAPAPO/LOC-LOCID | Native target evidence: ZTMT_B_TransportLocCompare.LocationUUID | copy |
| `LocationID` | /SAPAPO/LOC-LOCNO | Native target evidence: ZTMT_B_TransportLocCompare.LocationID | copy |
| `DeletionFlag` | /SAPAPO/LOC-LVORM | Native target evidence: ZTMT_B_TransportLocCompare.DeletionFlag | copy |
| `Longitude` | /SAPAPO/LOC-XPOS | Native target evidence: ZTMT_B_TransportLocCompare.Longitude | copy |
| `Latitude` | /SAPAPO/LOC-YPOS | Native target evidence: ZTMT_B_TransportLocCompare.Latitude | copy |

## Source controls

- Source count view: `ZTMX_C_TransportLocMigCount`

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- TransportLoc: Internal location UUID is preserved. Address, location type and time zone payload remain pending.
