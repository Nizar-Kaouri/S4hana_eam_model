# Migration interface: collections_profile

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** - (first level)
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFCX_C_CollectProfileMig`

- Source: `ZFCX_I_CollectProfile`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZFCX_FCS005-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZFCX_FCS005-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZFCX_FCS005-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `BusinessPartner` | ZFCX_FCS005-F004 | Customer native interface: BusinessPartner (adapter required) | copy | yes |
| `ProfileID` | ZFCX_FCS005-F005 | Customer native interface: ProfileID (adapter required) | copy | yes |
| `CompanyCode` | ZFCX_FCS005-F006 | Customer native interface: CompanyCode (adapter required) | copy | yes |
| `CollectionStrategy` | ZFCX_FCS005-F007 | Customer native interface: CollectionStrategy (adapter required) | copy | yes |

## `ZFCX_C_CollectSegmentMig`

- Source: `ZFCX_I_CollectSegment`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner`, `CollectionSegment`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZFCX_FCS006-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZFCX_FCS006-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZFCX_FCS006-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `BusinessPartner` | ZFCX_FCS006-F004 | Customer native interface: BusinessPartner (adapter required) | copy | yes |
| `CollectionSegment` | ZFCX_FCS006-F005 | Customer native interface: CollectionSegment (adapter required) | copy | yes |
| `CollectionGroup` | ZFCX_FCS006-F006 | Customer native interface: CollectionGroup (adapter required) | copy | yes |
| `Specialist` | ZFCX_FCS006-F007 | Customer native interface: Specialist (adapter required) | copy | yes |
| `ValidityStartDate` | ZFCX_FCS006-F008 | Customer native interface: ValidityStartDate (adapter required) | copy | yes |
| `ValidityEndDate` | ZFCX_FCS006-F009 | Customer native interface: ValidityEndDate (adapter required) | copy | yes |

## Reconciliation

- Counts: `ZFCX_C_CollectProfileMigCount` (ECC) vs `ZFCT_I_CollectProfileCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZFCX_C_CollectProfileMig` vs `ZFCT_I_CollectProfileCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner`; compared: `ProfileID`, `CompanyCode`, `CollectionStrategy`

```bash
python3 tools/mig_reconcile.py counts --product fscm_mig_src --module collections_profile --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product fscm_mig_src --module collections_profile --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.
- Native export adapters and target business posting are customer implementations.
