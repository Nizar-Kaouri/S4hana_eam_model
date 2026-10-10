# Migration interface: promise_to_pay

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** `collections_profile`
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner`, `PromiseID` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFCX_C_PaymentPromiseMig`

- Source: `ZFCX_I_PaymentPromise`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner`, `PromiseID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZFCX_FCS009-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZFCX_FCS009-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZFCX_FCS009-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `BusinessPartner` | ZFCX_FCS009-F004 | Customer native interface: BusinessPartner (adapter required) | information only | yes |
| `PromiseID` | ZFCX_FCS009-F005 | Customer native interface: PromiseID (adapter required) | information only | yes |
| `PromiseDate` | ZFCX_FCS009-F006 | Customer native interface: PromiseDate (adapter required) | information only | yes |
| `DueDate` | ZFCX_FCS009-F007 | Customer native interface: DueDate (adapter required) | information only | yes |
| `PromisedAmount` | ZFCX_FCS009-F008 | Customer native interface: PromisedAmount (adapter required) | information only | yes |
| `Currency` | ZFCX_FCS009-F009 | Customer native interface: Currency (adapter required) | information only | yes |
| `PromiseStatus` | ZFCX_FCS009-F010 | Customer native interface: PromiseStatus (adapter required) | information only | yes |

## `ZFCX_C_PromiseItemMig`

- Source: `ZFCX_I_PromiseItem`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner`, `PromiseID`, `CompanyCode`, `FiscalYear`, `AccountingDocument`, `AccountingItem`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZFCX_FCS010-F001 | Customer native interface: SourceSystem (adapter required) | information only | yes |
| `SourceClient` | ZFCX_FCS010-F002 | Customer native interface: SourceClient (adapter required) | information only | yes |
| `ExportBatch` | ZFCX_FCS010-F003 | Customer native interface: ExportBatch (adapter required) | information only | yes |
| `BusinessPartner` | ZFCX_FCS010-F004 | Customer native interface: BusinessPartner (adapter required) | information only | yes |
| `PromiseID` | ZFCX_FCS010-F005 | Customer native interface: PromiseID (adapter required) | information only | yes |
| `CompanyCode` | ZFCX_FCS010-F006 | Customer native interface: CompanyCode (adapter required) | information only | yes |
| `FiscalYear` | ZFCX_FCS010-F007 | Customer native interface: FiscalYear (adapter required) | information only | yes |
| `AccountingDocument` | ZFCX_FCS010-F008 | Customer native interface: AccountingDocument (adapter required) | information only | yes |
| `AccountingItem` | ZFCX_FCS010-F009 | Customer native interface: AccountingItem (adapter required) | information only | yes |
| `AssignedAmount` | ZFCX_FCS010-F010 | Customer native interface: AssignedAmount (adapter required) | information only | yes |
| `Currency` | ZFCX_FCS010-F011 | Customer native interface: Currency (adapter required) | information only | yes |

## Reconciliation

- Counts: `ZFCX_C_PaymentPromiseMigCount` (ECC) vs `ZFCT_I_PaymentPromiseCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZFCX_C_PaymentPromiseMig` vs `ZFCT_I_PaymentPromiseCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `BusinessPartner`, `PromiseID`; compared: `PromiseDate`, `DueDate`, `PromisedAmount`, `Currency`, `PromiseStatus`

```bash
python3 tools/mig_reconcile.py counts --product fscm_mig_src --module promise_to_pay --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product fscm_mig_src --module promise_to_pay --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Classic credit-control areas must be mapped to FSCM credit segments and business partners; the identifiers are not equivalent. Credit exposure is regenerated from integrated operational sources and must not also be posted as opening debt. Collections worklists and dispute amounts depend on the same FI receivable cohort. Status, promises, contacts, notes and attachments require approved business interfaces and access controls. Public Cloud collections and dispute automation is a distinct successor with its own ordered migration jobs, not an assumed on-premise adapter.
- Native export adapters and target business posting are customer implementations.
