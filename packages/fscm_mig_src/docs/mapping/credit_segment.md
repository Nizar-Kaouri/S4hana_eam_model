# Migration interface: credit_segment

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `credit_profile`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner`, `CreditSegment` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFCX_C_CreditSegmentMig`

- Source: `ZFCX_I_CreditSegment`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner`, `CreditSegment`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZFCX_FCS003-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZFCX_FCS003-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZFCX_FCS003-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `BusinessPartner` | ZFCX_FCS003-F004 | Customer native interface: BusinessPartner (adapter required) | copy | yes |
| `CreditSegment` | ZFCX_FCS003-F005 | Customer native interface: CreditSegment (adapter required) | copy | yes |
| `CreditLimit` | ZFCX_FCS003-F006 | Customer native interface: CreditLimit (adapter required) | copy | yes |
| `Currency` | ZFCX_FCS003-F007 | Customer native interface: Currency (adapter required) | copy | yes |
| `LimitValidTo` | ZFCX_FCS003-F008 | Customer native interface: LimitValidTo (adapter required) | copy | yes |
| `Blocked` | ZFCX_FCS003-F009 | Customer native interface: Blocked (adapter required) | copy | yes |
| `CreditControlArea` | ZFCX_FCS003-F010 | Customer native interface: CreditControlArea (adapter required) | copy | yes |

## Reconciliation

- Counts: `ZFCX_C_CreditSegmentMigCount` (ECC) vs `ZFCT_I_CreditSegmentCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZFCX_C_CreditSegmentMig` vs `ZFCT_I_CreditSegmentCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner`, `CreditSegment`; compared: `CreditLimit`, `Currency`, `LimitValidTo`, `Blocked`, `CreditControlArea`

```bash
python3 tools/mig_reconcile.py counts --product fscm_mig_src --module credit_segment --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product fscm_mig_src --module credit_segment --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.
- Native export adapters and target business posting are customer implementations.
