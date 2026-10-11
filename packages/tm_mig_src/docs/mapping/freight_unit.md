# Migration interface: freight_unit

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** `transport_location`
- **Business key:** `DocumentUUID` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger during loading.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZTMX_C_FreightUnitMig`

- Source: `ZTMX_I_FreightUnit`
- Keys: `DocumentUUID`
- Scope: `src.DocumentCategory = 'FU'`
- Delivery mode: **process-reference**
- Before posting: Native TOR root; category constants and lifecycle semantics require customer-release verification. Items, stops, stages and freight bookings remain pending. Root DB_KEY evidence: https://community.sap.com/t5/supply-chain-management-blog-posts-by-members/manual-assignment-of-loading-and-truck-resource-to-fo/ba-p/13920402 Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `DocumentUUID` | /SCMTMS/D_TORROT-DB_KEY | Native target evidence: ZTMT_B_FreightUnitCompare.DocumentUUID | information only |
| `DocumentID` | /SCMTMS/D_TORROT-TOR_ID | Native target evidence: ZTMT_B_FreightUnitCompare.DocumentID | information only |
| `DocumentCategory` | /SCMTMS/D_TORROT-TOR_CAT | Native target evidence: ZTMT_B_FreightUnitCompare.DocumentCategory | information only |
| `DocumentType` | /SCMTMS/D_TORROT-TOR_TYPE | Native target evidence: ZTMT_B_FreightUnitCompare.DocumentType | information only |
| `LifecycleStatus` | /SCMTMS/D_TORROT-LIFECYCLE | Native target evidence: ZTMT_B_FreightUnitCompare.LifecycleStatus | information only |

## `ZTMX_C_FreightUnitItemMig`

- Source: `ZTMX_I_FreightUnitItem`
- Keys: `ItemUUID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Native TOR items. Composite joins the delivered parent Basic on PARENT_KEY = DB_KEY and filters TOR_CAT FU. All item categories retained; product, quantity and unit payload remain pending. Parent UUID must be remapped with the target key ledger.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ItemUUID` | /SCMTMS/D_TORITE-DB_KEY | Native target evidence: ZTMT_B_FreightUnitItemCompare.ItemUUID | information only |
| `DocumentUUID` | /SCMTMS/D_TORITE-PARENT_KEY | Native target evidence: ZTMT_B_FreightUnitItemCompare.DocumentUUID | information only |
| `ItemID` | /SCMTMS/D_TORITE-ITEM_ID | Native target evidence: ZTMT_B_FreightUnitItemCompare.ItemID | information only |
| `ItemCategory` | /SCMTMS/D_TORITE-ITEM_CAT | Native target evidence: ZTMT_B_FreightUnitItemCompare.ItemCategory | information only |
| `ItemType` | /SCMTMS/D_TORITE-ITEM_TYPE | Native target evidence: ZTMT_B_FreightUnitItemCompare.ItemType | information only |

## `ZTMX_C_FreightUnitStopMig`

- Source: `ZTMX_I_FreightUnitStop`
- Keys: `StopUUID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Native TOR stops filtered through the parent category FU. STOP_ID is not a reliable route sequence; STOP_SEQ_POS classifies first/intermediate/last. Ordered route traversal needs STOP_SUCCESSOR and remains pending. Stop locations and dates remain pending.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `StopUUID` | /SCMTMS/D_TORSTP-DB_KEY | Native target evidence: ZTMT_B_FreightUnitStopCompare.StopUUID | information only |
| `DocumentUUID` | /SCMTMS/D_TORSTP-PARENT_KEY | Native target evidence: ZTMT_B_FreightUnitStopCompare.DocumentUUID | information only |
| `StopID` | /SCMTMS/D_TORSTP-STOP_ID | Native target evidence: ZTMT_B_FreightUnitStopCompare.StopID | information only |
| `StopCategory` | /SCMTMS/D_TORSTP-STOP_CAT | Native target evidence: ZTMT_B_FreightUnitStopCompare.StopCategory | information only |
| `SequencePosition` | /SCMTMS/D_TORSTP-STOP_SEQ_POS | Native target evidence: ZTMT_B_FreightUnitStopCompare.SequencePosition | information only |

## Source controls

- Source count view: `ZTMX_C_FreightUnitMigCount`

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- FreightUnit: TOR root plus separately delivered native item/stop drafts; quantities, route traversal, stages and freight bookings remain pending. Verify category and lifecycle scope.
- FreightUnitItem: Native TOR items. Composite joins the delivered parent Basic on PARENT_KEY = DB_KEY and filters TOR_CAT FU. All item categories retained; product, quantity and unit payload remain pending. Parent UUID must be remapped with the target key ledger.
- FreightUnitStop: Native TOR stops filtered through the parent category FU. STOP_ID is not a reliable route sequence; STOP_SEQ_POS classifies first/intermediate/last. Ordered route traversal needs STOP_SUCCESSOR and remains pending. Stop locations and dates remain pending.
