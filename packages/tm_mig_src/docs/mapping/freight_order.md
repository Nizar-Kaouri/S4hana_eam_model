# Migration interface: freight_order

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** `transport_location`, `freight_unit`
- **Business key:** `DocumentUUID` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger during loading.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZTMX_C_FreightOrderMig`

- Source: `ZTMX_I_FreightOrder`
- Keys: `DocumentUUID`
- Scope: `src.DocumentCategory = 'TO'`
- Delivery mode: **process-reference**
- Before posting: Native TOR root; category constants and lifecycle semantics require customer-release verification. Items, stops, stages and freight bookings remain pending. Root DB_KEY evidence: https://community.sap.com/t5/supply-chain-management-blog-posts-by-members/manual-assignment-of-loading-and-truck-resource-to-fo/ba-p/13920402 Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `DocumentUUID` | /SCMTMS/D_TORROT-DB_KEY | Native target evidence: ZTMT_B_FreightOrderCompare.DocumentUUID | information only |
| `DocumentID` | /SCMTMS/D_TORROT-TOR_ID | Native target evidence: ZTMT_B_FreightOrderCompare.DocumentID | information only |
| `DocumentCategory` | /SCMTMS/D_TORROT-TOR_CAT | Native target evidence: ZTMT_B_FreightOrderCompare.DocumentCategory | information only |
| `DocumentType` | /SCMTMS/D_TORROT-TOR_TYPE | Native target evidence: ZTMT_B_FreightOrderCompare.DocumentType | information only |
| `LifecycleStatus` | /SCMTMS/D_TORROT-LIFECYCLE | Native target evidence: ZTMT_B_FreightOrderCompare.LifecycleStatus | information only |

## `ZTMX_C_FreightOrdItemMig`

- Source: `ZTMX_I_FreightOrdItem`
- Keys: `ItemUUID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Native TOR items. Composite joins the delivered parent Basic on PARENT_KEY = DB_KEY and filters TOR_CAT TO. All item categories retained; product, quantity and unit payload remain pending. Parent UUID must be remapped with the target key ledger.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ItemUUID` | /SCMTMS/D_TORITE-DB_KEY | Native target evidence: ZTMT_B_FreightOrdItemCompare.ItemUUID | information only |
| `DocumentUUID` | /SCMTMS/D_TORITE-PARENT_KEY | Native target evidence: ZTMT_B_FreightOrdItemCompare.DocumentUUID | information only |
| `ItemID` | /SCMTMS/D_TORITE-ITEM_ID | Native target evidence: ZTMT_B_FreightOrdItemCompare.ItemID | information only |
| `ItemCategory` | /SCMTMS/D_TORITE-ITEM_CAT | Native target evidence: ZTMT_B_FreightOrdItemCompare.ItemCategory | information only |
| `ItemType` | /SCMTMS/D_TORITE-ITEM_TYPE | Native target evidence: ZTMT_B_FreightOrdItemCompare.ItemType | information only |

## `ZTMX_C_FreightOrdStopMig`

- Source: `ZTMX_I_FreightOrdStop`
- Keys: `StopUUID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Native TOR stops filtered through the parent category TO. STOP_ID is not a reliable route sequence; STOP_SEQ_POS classifies first/intermediate/last. Ordered route traversal needs STOP_SUCCESSOR and remains pending. Stop locations and dates remain pending.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `StopUUID` | /SCMTMS/D_TORSTP-DB_KEY | Native target evidence: ZTMT_B_FreightOrdStopCompare.StopUUID | information only |
| `DocumentUUID` | /SCMTMS/D_TORSTP-PARENT_KEY | Native target evidence: ZTMT_B_FreightOrdStopCompare.DocumentUUID | information only |
| `StopID` | /SCMTMS/D_TORSTP-STOP_ID | Native target evidence: ZTMT_B_FreightOrdStopCompare.StopID | information only |
| `StopCategory` | /SCMTMS/D_TORSTP-STOP_CAT | Native target evidence: ZTMT_B_FreightOrdStopCompare.StopCategory | information only |
| `SequencePosition` | /SCMTMS/D_TORSTP-STOP_SEQ_POS | Native target evidence: ZTMT_B_FreightOrdStopCompare.SequencePosition | information only |

## Source controls

- Source count view: `ZTMX_C_FreightOrderMigCount`

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- FreightOrder: TOR root plus separately delivered native item/stop drafts; quantities, route traversal, stages and freight bookings remain pending. Verify category and lifecycle scope.
- FreightOrdItem: Native TOR items. Composite joins the delivered parent Basic on PARENT_KEY = DB_KEY and filters TOR_CAT TO. All item categories retained; product, quantity and unit payload remain pending. Parent UUID must be remapped with the target key ledger.
- FreightOrdStop: Native TOR stops filtered through the parent category TO. STOP_ID is not a reliable route sequence; STOP_SEQ_POS classifies first/intermediate/last. Ordered route traversal needs STOP_SUCCESSOR and remains pending. Stop locations and dates remain pending.
- FreightStage: STOP_SUCCESSOR existence documented. Exact predecessor/successor native fields, keys and stage interpretation unresolved; STOP_ID order is not a substitute.
