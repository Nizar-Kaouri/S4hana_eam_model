# Migration interface: phrase

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; stages are not posting
- **Load after:** - (first level)
- **Business key:** `SourceSystem`, `SourceClient`, `ExportBatch`, `PhraseCatalog`, `PhraseID`, `Language` · numbering **keep**
- **Key rule:** Origin metadata identifies the source cohort. Normalize mapped target identifiers back to source keys and retain original target IDs in a separate audit ledger.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEHX_C_PhraseMig`

- Source: `ZEHX_I_Phrase`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `PhraseCatalog`, `PhraseID`, `Language`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS008-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZEHX_EHS008-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZEHX_EHS008-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `PhraseCatalog` | ZEHX_EHS008-F004 | Customer native interface: PhraseCatalog (adapter required) | copy | yes |
| `PhraseID` | ZEHX_EHS008-F005 | Customer native interface: PhraseID (adapter required) | copy | yes |
| `Language` | ZEHX_EHS008-F006 | Customer native interface: Language (adapter required) | copy | yes |
| `PhraseText` | ZEHX_EHS008-F007 | Customer native interface: PhraseText (adapter required) | copy | yes |
| `PhraseCode` | ZEHX_EHS008-F008 | Customer native interface: PhraseCode (adapter required) | copy | yes |

## `ZEHX_C_PhraseSetMig`

- Source: `ZEHX_I_PhraseSet`
- Keys: `SourceSystem`, `SourceClient`, `ExportBatch`, `PhraseSetID`, `PhraseCatalog`, `PhraseID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Approve native source completeness, business state and parent/child closure. Select one origin cohort. Customer stages do not establish business eligibility. Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `SourceSystem` | ZEHX_EHS009-F001 | Customer native interface: SourceSystem (adapter required) | copy | yes |
| `SourceClient` | ZEHX_EHS009-F002 | Customer native interface: SourceClient (adapter required) | copy | yes |
| `ExportBatch` | ZEHX_EHS009-F003 | Customer native interface: ExportBatch (adapter required) | copy | yes |
| `PhraseSetID` | ZEHX_EHS009-F004 | Customer native interface: PhraseSetID (adapter required) | copy | yes |
| `PhraseCatalog` | ZEHX_EHS009-F005 | Customer native interface: PhraseCatalog (adapter required) | copy | yes |
| `PhraseID` | ZEHX_EHS009-F006 | Customer native interface: PhraseID (adapter required) | copy | yes |
| `SortSequence` | ZEHX_EHS009-F007 | Customer native interface: SortSequence (adapter required) | copy | yes |

## Reconciliation

- Counts: `ZEHX_C_PhraseMigCount` (ECC) vs `ZEHT_I_PhraseCount` (S/4HANA) per `SourceSystem`, `SourceClient`, `ExportBatch`
- Records and fields: `ZEHX_C_PhraseMig` vs `ZEHT_I_PhraseCompare` on `SourceSystem`, `SourceClient`, `ExportBatch`, `PhraseCatalog`, `PhraseID`, `Language`; compared: `PhraseText`, `PhraseCode`

```bash
python3 tools/mig_reconcile.py counts --product ehs_mig_src --module phrase --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ehs_mig_src --module phrase --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.
- Native export adapters and target business posting are customer implementations.
