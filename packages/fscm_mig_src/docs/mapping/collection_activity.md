# Migration interface: collection_activity

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `ContactUUID` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger during loading.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFCX_C_CollectContactMig`

- Source: `ZFCX_I_CollectContact`
- Keys: `ContactUUID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Contact attributes only; associated items and resubmissions remain pending. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ContactUUID` | UDM_CCT_ATTR-CCT_GUID | Native target evidence: ZFCT_B_CollectContactCompare.ContactUUID | information only |
| `ContactDate` | UDM_CCT_ATTR-CCT_DATE | Native target evidence: ZFCT_B_CollectContactCompare.ContactDate | information only |
| `ContactResult` | UDM_CCT_ATTR-CCT_RESULT | Native target evidence: ZFCT_B_CollectContactCompare.ContactResult | information only |
| `ContactType` | UDM_CCT_ATTR-CCT_TYPE | Native target evidence: ZFCT_B_CollectContactCompare.ContactType | information only |
| `ContactDirection` | UDM_CCT_ATTR-CCT_DIRECTION | Native target evidence: ZFCT_B_CollectContactCompare.ContactDirection | information only |
| `Reached` | UDM_CCT_ATTR-XREACHED | Native target evidence: ZFCT_B_CollectContactCompare.Reached | information only |
| `CollectionSegment` | UDM_CCT_ATTR-COLL_SEGMENT | Native target evidence: ZFCT_B_CollectContactCompare.CollectionSegment | information only |
| `CollectionSpecialist` | UDM_CCT_ATTR-COLL_SPECIALIST | Native target evidence: ZFCT_B_CollectContactCompare.CollectionSpecialist | information only |
| `BusinessPartner` | UDM_CCT_ATTR-CUSTOMER | Native target evidence: ZFCT_B_CollectContactCompare.BusinessPartner | information only |
| `ContactName` | UDM_CCT_ATTR-CCT_NAME | Native target evidence: ZFCT_B_CollectContactCompare.ContactName | information only |
| `ChangedAt` | UDM_CCT_ATTR-CHANGED_AT | Native target evidence: ZFCT_B_CollectContactCompare.ChangedAt | information only |

## Source controls

- Source count view: `ZFCX_C_CollectContactMigCount`

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- CollectContact: Contact attributes only; associated items and resubmissions remain pending.
- CollectTask: Public worklist fields do not establish the planned resubmission/follow-up task structure; substituting another business object would change scope.
