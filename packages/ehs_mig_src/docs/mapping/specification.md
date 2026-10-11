# Migration interface: specification

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `RecordNumber`, `ChangeState` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger before comparison.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEHX_C_SpecificationMig`

- Source: `ZEHX_I_Specification`
- Keys: `RecordNumber`, `ChangeState`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Classic specification model. Preserve all change states; no unverified latest-record rule. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `RecordNumber` | ESTRH-RECN | Native target evidence: ZEHT_B_SpecificationCompare.RecordNumber | copy | yes |
| `ChangeState` | ESTRH-ACTN | Native target evidence: ZEHT_B_SpecificationCompare.ChangeState | copy | yes |
| `ValidFrom` | ESTRH-VALFR | Native target evidence: ZEHT_B_SpecificationCompare.ValidFrom | copy | yes |
| `ValidTo` | ESTRH-VALTO | Native target evidence: ZEHT_B_SpecificationCompare.ValidTo | copy | yes |
| `DeletionFlag` | ESTRH-DELFLG | Native target evidence: ZEHT_B_SpecificationCompare.DeletionFlag | copy | yes |
| `SpecificationID` | ESTRH-SUBID | Native target evidence: ZEHT_B_SpecificationCompare.SpecificationID | copy | yes |
| `SpecificationCategory` | ESTRH-SUBCAT | Native target evidence: ZEHT_B_SpecificationCompare.SpecificationCategory | copy | yes |
| `AuthorizationGroup` | ESTRH-AUTHGRP | Native target evidence: ZEHT_B_SpecificationCompare.AuthorizationGroup | copy | yes |
| `Remark` | ESTRH-REM | Native target evidence: ZEHT_B_SpecificationCompare.Remark | copy | yes |

## `ZEHX_C_SpecIdentifierMig`

- Source: `ZEHX_I_SpecIdentifier`
- Keys: `RecordNumber`, `ChangeState`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Native short identifier only; long-text interfaces and effective parent change-state relations remain pending. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `RecordNumber` | ESTRI-RECN | Native target evidence: ZEHT_B_SpecIdentifierCompare.RecordNumber | copy | yes |
| `ChangeState` | ESTRI-ACTN | Native target evidence: ZEHT_B_SpecIdentifierCompare.ChangeState | copy | yes |
| `ValidFrom` | ESTRI-VALFR | Native target evidence: ZEHT_B_SpecIdentifierCompare.ValidFrom | copy | yes |
| `ValidTo` | ESTRI-VALTO | Native target evidence: ZEHT_B_SpecIdentifierCompare.ValidTo | copy | yes |
| `DeletionFlag` | ESTRI-DELFLG | Native target evidence: ZEHT_B_SpecIdentifierCompare.DeletionFlag | copy | yes |
| `RootRecordNumber` | ESTRI-RECNROOT | Native target evidence: ZEHT_B_SpecIdentifierCompare.RootRecordNumber | copy | yes |
| `IdentifierType` | ESTRI-IDTYPE | Native target evidence: ZEHT_B_SpecIdentifierCompare.IdentifierType | copy | yes |
| `IdentifierCategory` | ESTRI-IDCAT | Native target evidence: ZEHT_B_SpecIdentifierCompare.IdentifierCategory | copy | yes |
| `Language` | ESTRI-LANGU | Native target evidence: ZEHT_B_SpecIdentifierCompare.Language | copy | yes |
| `Identifier` | ESTRI-IDENT | Native target evidence: ZEHT_B_SpecIdentifierCompare.Identifier | copy | yes |
| `SortOrder` | ESTRI-ORD | Native target evidence: ZEHT_B_SpecIdentifierCompare.SortOrder | copy | yes |

## Reconciliation

- Counts: `ZEHX_C_SpecificationMigCount` (SAP source) vs `ZEHT_I_SpecificationCount` (S/4HANA) as global candidate counts
- Records and fields: `ZEHX_C_SpecificationMig` vs `ZEHT_B_SpecificationCompare` on `RecordNumber`, `ChangeState`; compared: `ValidFrom`, `ValidTo`, `DeletionFlag`, `SpecificationID`, `SpecificationCategory`, `AuthorizationGroup`, `Remark`

```bash
python3 tools/mig_reconcile.py counts --product ehs_mig_src --module specification --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ehs_mig_src --module specification --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- Specification: Classic specification model. Preserve all change states; no unverified latest-record rule.
- SpecIdentifier: Native short identifier only; long-text interfaces and effective parent change-state relations remain pending.
- SpecProperty: Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.
