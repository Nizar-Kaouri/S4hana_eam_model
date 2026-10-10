# Migration interface: collection_activity

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `collections_profile`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner`, `CollectionSegment`, `ContactID` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFCX_C_CollectContactMig`

- Source: `ZFCX_I_CollectContact`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner`, `CollectionSegment`, `ContactID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZFCX_FCS007-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZFCX_FCS007-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZFCX_FCS007-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `BusinessPartner` | ZFCX_FCS007-F004 | Customer native interface: BusinessPartner (adapter required) | information only | yes |
| `CollectionSegment` | ZFCX_FCS007-F005 | Customer native interface: CollectionSegment (adapter required) | information only | yes |
| `ContactID` | ZFCX_FCS007-F006 | Customer native interface: ContactID (adapter required) | information only | yes |
| `ContactAtUTC` | ZFCX_FCS007-F007 | Customer native interface: ContactAtUTC (adapter required) | information only | yes |
| `ContactType` | ZFCX_FCS007-F008 | Customer native interface: ContactType (adapter required) | information only | yes |
| `ContactResult` | ZFCX_FCS007-F009 | Customer native interface: ContactResult (adapter required) | information only | yes |
| `Specialist` | ZFCX_FCS007-F010 | Customer native interface: Specialist (adapter required) | information only | yes |

## `ZFCX_C_CollectTaskMig`

- Source: `ZFCX_I_CollectTask`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner`, `CollectionSegment`, `TaskID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZFCX_FCS008-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZFCX_FCS008-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZFCX_FCS008-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `BusinessPartner` | ZFCX_FCS008-F004 | Customer native interface: BusinessPartner (adapter required) | information only | yes |
| `CollectionSegment` | ZFCX_FCS008-F005 | Customer native interface: CollectionSegment (adapter required) | information only | yes |
| `TaskID` | ZFCX_FCS008-F006 | Customer native interface: TaskID (adapter required) | information only | yes |
| `Reason` | ZFCX_FCS008-F007 | Customer native interface: Reason (adapter required) | information only | yes |
| `DueAtUTC` | ZFCX_FCS008-F008 | Customer native interface: DueAtUTC (adapter required) | information only | yes |
| `TaskStatus` | ZFCX_FCS008-F009 | Customer native interface: TaskStatus (adapter required) | information only | yes |
| `RelatedContact` | ZFCX_FCS008-F010 | Customer native interface: RelatedContact (adapter required) | information only | yes |

## Reconciliation

- Counts: `ZFCX_C_CollectContactMigCount` (ECC) vs `ZFCT_I_CollectContactCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZFCX_C_CollectContactMig` vs `ZFCT_I_CollectContactCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner`, `CollectionSegment`, `ContactID`; compared: `ContactAtUTC`, `ContactType`, `ContactResult`, `Specialist`

```bash
python3 tools/mig_reconcile.py counts --product fscm_mig_src --module collection_activity --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product fscm_mig_src --module collection_activity --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.
- Native export adapters and target business posting are customer implementations.
