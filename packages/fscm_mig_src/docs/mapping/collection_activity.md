# Migration interface: collection_activity

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `ContactUUID` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger before comparison.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFCX_C_CollectContactMig`

- Source: `ZFCX_I_CollectContact`
- Keys: `ContactUUID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Contact attributes only; associated items and resubmissions remain pending. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ContactUUID` | UDM_CCT_ATTR-CCT_GUID | Native target evidence: ZFCT_I_CollectContactCompare.ContactUUID | information only | yes |
| `ContactDate` | UDM_CCT_ATTR-CCT_DATE | Native target evidence: ZFCT_I_CollectContactCompare.ContactDate | information only | yes |
| `ContactResult` | UDM_CCT_ATTR-CCT_RESULT | Native target evidence: ZFCT_I_CollectContactCompare.ContactResult | information only | yes |
| `ContactType` | UDM_CCT_ATTR-CCT_TYPE | Native target evidence: ZFCT_I_CollectContactCompare.ContactType | information only | yes |
| `ContactDirection` | UDM_CCT_ATTR-CCT_DIRECTION | Native target evidence: ZFCT_I_CollectContactCompare.ContactDirection | information only | yes |
| `Reached` | UDM_CCT_ATTR-XREACHED | Native target evidence: ZFCT_I_CollectContactCompare.Reached | information only | yes |
| `CollectionSegment` | UDM_CCT_ATTR-COLL_SEGMENT | Native target evidence: ZFCT_I_CollectContactCompare.CollectionSegment | information only | yes |
| `CollectionSpecialist` | UDM_CCT_ATTR-COLL_SPECIALIST | Native target evidence: ZFCT_I_CollectContactCompare.CollectionSpecialist | information only | yes |
| `BusinessPartner` | UDM_CCT_ATTR-CUSTOMER | Native target evidence: ZFCT_I_CollectContactCompare.BusinessPartner | information only | yes |
| `ContactName` | UDM_CCT_ATTR-CCT_NAME | Native target evidence: ZFCT_I_CollectContactCompare.ContactName | information only | yes |
| `ChangedAt` | UDM_CCT_ATTR-CHANGED_AT | Native target evidence: ZFCT_I_CollectContactCompare.ChangedAt | information only | yes |

## Reconciliation

- Counts: `ZFCX_C_CollectContactMigCount` (SAP source) vs `ZFCT_I_CollectContactCount` (S/4HANA) as global candidate counts
- Records and fields: `ZFCX_C_CollectContactMig` vs `ZFCT_I_CollectContactCompare` on `ContactUUID`; compared: `ContactDate`, `ContactResult`, `ContactType`, `ContactDirection`, `Reached`, `CollectionSegment`, `CollectionSpecialist`, `BusinessPartner`, `ContactName`, `ChangedAt`

```bash
python3 tools/mig_reconcile.py counts --product fscm_mig_src --module collection_activity --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product fscm_mig_src --module collection_activity --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- CollectContact: Contact attributes only; associated items and resubmissions remain pending.
- CollectTask: Public worklist fields do not establish the planned resubmission/follow-up task structure; substituting another business object would change scope.
