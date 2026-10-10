# Migration interface: credit_exposure

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `credit_segment`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner`, `CreditSegment`, `ExposureCategory`, `SourceDocument`, `SourceItem` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFCX_C_CreditExposureMig`

- Source: `ZFCX_I_CreditExposure`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner`, `CreditSegment`, `ExposureCategory`, `SourceDocument`, `SourceItem`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZFCX_FCS004-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZFCX_FCS004-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZFCX_FCS004-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `BusinessPartner` | ZFCX_FCS004-F004 | Customer native interface: BusinessPartner (adapter required) | information only | yes |
| `CreditSegment` | ZFCX_FCS004-F005 | Customer native interface: CreditSegment (adapter required) | information only | yes |
| `ExposureCategory` | ZFCX_FCS004-F006 | Customer native interface: ExposureCategory (adapter required) | information only | yes |
| `SourceDocument` | ZFCX_FCS004-F007 | Customer native interface: SourceDocument (adapter required) | information only | yes |
| `SourceItem` | ZFCX_FCS004-F008 | Customer native interface: SourceItem (adapter required) | information only | yes |
| `ExposureAmount` | ZFCX_FCS004-F009 | Customer native interface: ExposureAmount (adapter required) | information only | yes |
| `Currency` | ZFCX_FCS004-F010 | Customer native interface: Currency (adapter required) | information only | yes |
| `AsOfUTC` | ZFCX_FCS004-F011 | Customer native interface: AsOfUTC (adapter required) | information only | yes |

## Reconciliation

- Counts: `ZFCX_C_CreditExposureMigCount` (ECC) vs `ZFCT_I_CreditExposureCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZFCX_C_CreditExposureMig` vs `ZFCT_I_CreditExposureCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner`, `CreditSegment`, `ExposureCategory`, `SourceDocument`, `SourceItem`; compared: `ExposureAmount`, `Currency`, `AsOfUTC`

```bash
python3 tools/mig_reconcile.py counts --product fscm_mig_src --module credit_exposure --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product fscm_mig_src --module credit_exposure --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.
- Native export adapters and target business posting are customer implementations.
