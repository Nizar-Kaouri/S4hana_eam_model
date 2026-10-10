# Migration interface: freight_order

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** `transport_location`, `freight_unit`
- **Business key:** `DocumentUUID` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger before comparison.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZTMX_C_FreightOrderMig`

- Source: `ZTMX_I_FreightOrder`
- Keys: `DocumentUUID`
- Scope: `src.DocumentCategory = 'TO'`
- Delivery mode: **process-reference**
- Before posting: Native TOR root; category constants and lifecycle semantics require customer-release verification. Items, stops, stages and freight bookings remain pending. Root DB_KEY evidence: https://community.sap.com/t5/supply-chain-management-blog-posts-by-members/manual-assignment-of-loading-and-truck-resource-to-fo/ba-p/13920402 Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `DocumentUUID` | /SCMTMS/D_TORROT-DB_KEY | Native target evidence: ZTMT_I_FreightOrderCompare.DocumentUUID | information only | yes |
| `DocumentID` | /SCMTMS/D_TORROT-TOR_ID | Native target evidence: ZTMT_I_FreightOrderCompare.DocumentID | information only | yes |
| `DocumentCategory` | /SCMTMS/D_TORROT-TOR_CAT | Native target evidence: ZTMT_I_FreightOrderCompare.DocumentCategory | information only | yes |
| `DocumentType` | /SCMTMS/D_TORROT-TOR_TYPE | Native target evidence: ZTMT_I_FreightOrderCompare.DocumentType | information only | yes |
| `LifecycleStatus` | /SCMTMS/D_TORROT-LIFECYCLE | Native target evidence: ZTMT_I_FreightOrderCompare.LifecycleStatus | information only | yes |

## Reconciliation

- Counts: `ZTMX_C_FreightOrderMigCount` (SAP source) vs `ZTMT_I_FreightOrderCount` (S/4HANA) as global candidate counts
- Records and fields: `ZTMX_C_FreightOrderMig` vs `ZTMT_I_FreightOrderCompare` on `DocumentUUID`; compared: `DocumentID`, `DocumentCategory`, `DocumentType`, `LifecycleStatus`

```bash
python3 tools/mig_reconcile.py counts --product tm_mig_src --module freight_order --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product tm_mig_src --module freight_order --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Native field/key/release verification and SAP activation pending. No posting adapter.
- FreightOrdItem: Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.
- FreightOrdStop: Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.
- FreightStage: Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.
- Pending native dependency: transport_resource
