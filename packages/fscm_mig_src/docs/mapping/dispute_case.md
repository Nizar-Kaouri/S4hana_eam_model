# Migration interface: dispute_case

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** - (first level)
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `CaseID` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFCX_C_DisputeCaseMig`

- Source: `ZFCX_I_DisputeCase`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `CaseID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZFCX_FCS011-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZFCX_FCS011-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZFCX_FCS011-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `CaseID` | ZFCX_FCS011-F004 | Customer native interface: CaseID (adapter required) | information only | yes |
| `NativeGUID` | ZFCX_FCS011-F005 | Customer native interface: NativeGUID (adapter required) | information only | yes |
| `BusinessPartner` | ZFCX_FCS011-F006 | Customer native interface: BusinessPartner (adapter required) | information only | yes |
| `CaseType` | ZFCX_FCS011-F007 | Customer native interface: CaseType (adapter required) | information only | yes |
| `Reason` | ZFCX_FCS011-F008 | Customer native interface: Reason (adapter required) | information only | yes |
| `CaseStatus` | ZFCX_FCS011-F009 | Customer native interface: CaseStatus (adapter required) | information only | yes |
| `Priority` | ZFCX_FCS011-F010 | Customer native interface: Priority (adapter required) | information only | yes |
| `DisputedAmount` | ZFCX_FCS011-F011 | Customer native interface: DisputedAmount (adapter required) | information only | yes |
| `Currency` | ZFCX_FCS011-F012 | Customer native interface: Currency (adapter required) | information only | yes |
| `CreatedAtUTC` | ZFCX_FCS011-F013 | Customer native interface: CreatedAtUTC (adapter required) | information only | yes |

## `ZFCX_C_DisputeItemMig`

- Source: `ZFCX_I_DisputeItem`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `CaseID`, `CompanyCode`, `FiscalYear`, `AccountingDocument`, `AccountingItem`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZFCX_FCS012-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZFCX_FCS012-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZFCX_FCS012-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `CaseID` | ZFCX_FCS012-F004 | Customer native interface: CaseID (adapter required) | information only | yes |
| `CompanyCode` | ZFCX_FCS012-F005 | Customer native interface: CompanyCode (adapter required) | information only | yes |
| `FiscalYear` | ZFCX_FCS012-F006 | Customer native interface: FiscalYear (adapter required) | information only | yes |
| `AccountingDocument` | ZFCX_FCS012-F007 | Customer native interface: AccountingDocument (adapter required) | information only | yes |
| `AccountingItem` | ZFCX_FCS012-F008 | Customer native interface: AccountingItem (adapter required) | information only | yes |
| `DisputedAmount` | ZFCX_FCS012-F009 | Customer native interface: DisputedAmount (adapter required) | information only | yes |
| `Currency` | ZFCX_FCS012-F010 | Customer native interface: Currency (adapter required) | information only | yes |

## `ZFCX_C_CaseAttributeMig`

- Source: `ZFCX_I_CaseAttribute`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `CaseID`, `AttributeID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZFCX_FCS013-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZFCX_FCS013-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZFCX_FCS013-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `CaseID` | ZFCX_FCS013-F004 | Customer native interface: CaseID (adapter required) | information only | yes |
| `AttributeID` | ZFCX_FCS013-F005 | Customer native interface: AttributeID (adapter required) | information only | yes |
| `AttributeValue` | ZFCX_FCS013-F006 | Customer native interface: AttributeValue (adapter required) | information only | yes |

## `ZFCX_C_CaseAttachmentMig`

- Source: `ZFCX_I_CaseAttachment`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `CaseID`, `AttachmentID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZFCX_FCS014-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZFCX_FCS014-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZFCX_FCS014-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `CaseID` | ZFCX_FCS014-F004 | Customer native interface: CaseID (adapter required) | information only | yes |
| `AttachmentID` | ZFCX_FCS014-F005 | Customer native interface: AttachmentID (adapter required) | information only | yes |
| `DocumentType` | ZFCX_FCS014-F006 | Customer native interface: DocumentType (adapter required) | information only | yes |
| `FileName` | ZFCX_FCS014-F007 | Customer native interface: FileName (adapter required) | information only | yes |
| `ContentHash` | ZFCX_FCS014-F008 | Customer native interface: ContentHash (adapter required) | information only | yes |
| `RepositoryReference` | ZFCX_FCS014-F009 | Customer native interface: RepositoryReference (adapter required) | information only | yes |

## Reconciliation

- Counts: `ZFCX_C_DisputeCaseMigCount` (ECC) vs `ZFCT_I_DisputeCaseCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZFCX_C_DisputeCaseMig` vs `ZFCT_I_DisputeCaseCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `CaseID`; compared: `NativeGUID`, `BusinessPartner`, `CaseType`, `Reason`, `CaseStatus`, `Priority`, `DisputedAmount`, `Currency`, `CreatedAtUTC`

```bash
python3 tools/mig_reconcile.py counts --product fscm_mig_src --module dispute_case --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product fscm_mig_src --module dispute_case --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.
- Native export adapters and target business posting are customer implementations.
