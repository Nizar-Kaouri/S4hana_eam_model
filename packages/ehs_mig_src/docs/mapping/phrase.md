# Migration interface: phrase

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `RecordNumber`, `ChangeState` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger before comparison.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEHX_C_PhraseMig`

- Source: `ZEHX_I_Phrase`
- Keys: `RecordNumber`, `ChangeState`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Phrase header only. ESTPP multilingual text and graphics are pending; no invented Language key on the header. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `RecordNumber` | ESTPH-RECN | Native target evidence: ZEHT_I_PhraseCompare.RecordNumber | copy | yes |
| `ChangeState` | ESTPH-ACTN | Native target evidence: ZEHT_I_PhraseCompare.ChangeState | copy | yes |
| `ValidFrom` | ESTPH-VALFR | Native target evidence: ZEHT_I_PhraseCompare.ValidFrom | copy | yes |
| `ValidTo` | ESTPH-VALTO | Native target evidence: ZEHT_I_PhraseCompare.ValidTo | copy | yes |
| `DeletionFlag` | ESTPH-DELFLG | Native target evidence: ZEHT_I_PhraseCompare.DeletionFlag | copy | yes |
| `PhraseID` | ESTPH-PHRID | Native target evidence: ZEHT_I_PhraseCompare.PhraseID | copy | yes |
| `Remark` | ESTPH-REM | Native target evidence: ZEHT_I_PhraseCompare.Remark | copy | yes |
| `SourceLanguage` | ESTPH-SRLANGU | Native target evidence: ZEHT_I_PhraseCompare.SourceLanguage | copy | yes |
| `UserDefinedName` | ESTPH-USEXNAM | Native target evidence: ZEHT_I_PhraseCompare.UserDefinedName | copy | yes |

## `ZEHX_C_PhraseSetMig`

- Source: `ZEHX_I_PhraseSet`
- Keys: `RecordNumber`, `ChangeState`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Phrase-set assignment records; not the complete phrase-set definition. Preserve native record and change-state keys. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `RecordNumber` | ESTPJ-RECN | Native target evidence: ZEHT_I_PhraseSetCompare.RecordNumber | copy | yes |
| `ChangeState` | ESTPJ-ACTN | Native target evidence: ZEHT_I_PhraseSetCompare.ChangeState | copy | yes |
| `ValidFrom` | ESTPJ-VALFR | Native target evidence: ZEHT_I_PhraseSetCompare.ValidFrom | copy | yes |
| `ValidTo` | ESTPJ-VALTO | Native target evidence: ZEHT_I_PhraseSetCompare.ValidTo | copy | yes |
| `DeletionFlag` | ESTPJ-DELFLG | Native target evidence: ZEHT_I_PhraseSetCompare.DeletionFlag | copy | yes |
| `PhraseSet` | ESTPJ-PHRSEL | Native target evidence: ZEHT_I_PhraseSetCompare.PhraseSet | copy | yes |
| `PhraseID` | ESTPJ-PHRID | Native target evidence: ZEHT_I_PhraseSetCompare.PhraseID | copy | yes |
| `SortOrder` | ESTPJ-ORD | Native target evidence: ZEHT_I_PhraseSetCompare.SortOrder | copy | yes |

## Reconciliation

- Counts: `ZEHX_C_PhraseMigCount` (SAP source) vs `ZEHT_I_PhraseCount` (S/4HANA) as global candidate counts
- Records and fields: `ZEHX_C_PhraseMig` vs `ZEHT_I_PhraseCompare` on `RecordNumber`, `ChangeState`; compared: `ValidFrom`, `ValidTo`, `DeletionFlag`, `PhraseID`, `Remark`, `SourceLanguage`, `UserDefinedName`

```bash
python3 tools/mig_reconcile.py counts --product ehs_mig_src --module phrase --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ehs_mig_src --module phrase --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- Phrase: Phrase header only. ESTPP multilingual text and graphics are pending; no invented Language key on the header.
- PhraseSet: Phrase-set assignment records; not the complete phrase-set definition. Preserve native record and change-state keys.
