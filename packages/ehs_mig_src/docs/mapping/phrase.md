# Migration interface: phrase

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `RecordNumber`, `ChangeState` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger during loading.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEHX_C_PhraseMig`

- Source: `ZEHX_I_Phrase`
- Keys: `RecordNumber`, `ChangeState`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Phrase header only. ESTPP multilingual text and graphics are pending; no invented Language key on the header. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `RecordNumber` | ESTPH-RECN | Native target evidence: ZEHT_B_PhraseCompare.RecordNumber | copy |
| `ChangeState` | ESTPH-ACTN | Native target evidence: ZEHT_B_PhraseCompare.ChangeState | copy |
| `ValidFrom` | ESTPH-VALFR | Native target evidence: ZEHT_B_PhraseCompare.ValidFrom | copy |
| `ValidTo` | ESTPH-VALTO | Native target evidence: ZEHT_B_PhraseCompare.ValidTo | copy |
| `DeletionFlag` | ESTPH-DELFLG | Native target evidence: ZEHT_B_PhraseCompare.DeletionFlag | copy |
| `PhraseID` | ESTPH-PHRID | Native target evidence: ZEHT_B_PhraseCompare.PhraseID | copy |
| `Remark` | ESTPH-REM | Native target evidence: ZEHT_B_PhraseCompare.Remark | copy |
| `SourceLanguage` | ESTPH-SRLANGU | Native target evidence: ZEHT_B_PhraseCompare.SourceLanguage | copy |
| `UserDefinedName` | ESTPH-USEXNAM | Native target evidence: ZEHT_B_PhraseCompare.UserDefinedName | copy |

## `ZEHX_C_PhraseSetMig`

- Source: `ZEHX_I_PhraseSet`
- Keys: `RecordNumber`, `ChangeState`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Phrase-set assignment records; not the complete phrase-set definition. Preserve native record and change-state keys. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `RecordNumber` | ESTPJ-RECN | Native target evidence: ZEHT_B_PhraseSetCompare.RecordNumber | copy |
| `ChangeState` | ESTPJ-ACTN | Native target evidence: ZEHT_B_PhraseSetCompare.ChangeState | copy |
| `ValidFrom` | ESTPJ-VALFR | Native target evidence: ZEHT_B_PhraseSetCompare.ValidFrom | copy |
| `ValidTo` | ESTPJ-VALTO | Native target evidence: ZEHT_B_PhraseSetCompare.ValidTo | copy |
| `DeletionFlag` | ESTPJ-DELFLG | Native target evidence: ZEHT_B_PhraseSetCompare.DeletionFlag | copy |
| `PhraseSet` | ESTPJ-PHRSEL | Native target evidence: ZEHT_B_PhraseSetCompare.PhraseSet | copy |
| `PhraseID` | ESTPJ-PHRID | Native target evidence: ZEHT_B_PhraseSetCompare.PhraseID | copy |
| `SortOrder` | ESTPJ-ORD | Native target evidence: ZEHT_B_PhraseSetCompare.SortOrder | copy |

## Source controls

- Source count view: `ZEHX_C_PhraseMigCount`

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- Phrase: Phrase header only. ESTPP multilingual text and graphics are pending; no invented Language key on the header.
- PhraseSet: Phrase-set assignment records; not the complete phrase-set definition. Preserve native record and change-state keys.
