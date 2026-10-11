# Migration interface: specification

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `RecordNumber`, `ChangeState` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger during loading.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEHX_C_SpecificationMig`

- Source: `ZEHX_I_Specification`
- Keys: `RecordNumber`, `ChangeState`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Classic specification model. Preserve all change states; no unverified latest-record rule. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `RecordNumber` | ESTRH-RECN | Native target evidence: ZEHT_B_SpecificationCompare.RecordNumber | copy |
| `ChangeState` | ESTRH-ACTN | Native target evidence: ZEHT_B_SpecificationCompare.ChangeState | copy |
| `ValidFrom` | ESTRH-VALFR | Native target evidence: ZEHT_B_SpecificationCompare.ValidFrom | copy |
| `ValidTo` | ESTRH-VALTO | Native target evidence: ZEHT_B_SpecificationCompare.ValidTo | copy |
| `DeletionFlag` | ESTRH-DELFLG | Native target evidence: ZEHT_B_SpecificationCompare.DeletionFlag | copy |
| `SpecificationID` | ESTRH-SUBID | Native target evidence: ZEHT_B_SpecificationCompare.SpecificationID | copy |
| `SpecificationCategory` | ESTRH-SUBCAT | Native target evidence: ZEHT_B_SpecificationCompare.SpecificationCategory | copy |
| `AuthorizationGroup` | ESTRH-AUTHGRP | Native target evidence: ZEHT_B_SpecificationCompare.AuthorizationGroup | copy |
| `Remark` | ESTRH-REM | Native target evidence: ZEHT_B_SpecificationCompare.Remark | copy |

## `ZEHX_C_SpecIdentifierMig`

- Source: `ZEHX_I_SpecIdentifier`
- Keys: `RecordNumber`, `ChangeState`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Native short identifier only; long-text interfaces and effective parent change-state relations remain pending. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `RecordNumber` | ESTRI-RECN | Native target evidence: ZEHT_B_SpecIdentifierCompare.RecordNumber | copy |
| `ChangeState` | ESTRI-ACTN | Native target evidence: ZEHT_B_SpecIdentifierCompare.ChangeState | copy |
| `ValidFrom` | ESTRI-VALFR | Native target evidence: ZEHT_B_SpecIdentifierCompare.ValidFrom | copy |
| `ValidTo` | ESTRI-VALTO | Native target evidence: ZEHT_B_SpecIdentifierCompare.ValidTo | copy |
| `DeletionFlag` | ESTRI-DELFLG | Native target evidence: ZEHT_B_SpecIdentifierCompare.DeletionFlag | copy |
| `RootRecordNumber` | ESTRI-RECNROOT | Native target evidence: ZEHT_B_SpecIdentifierCompare.RootRecordNumber | copy |
| `IdentifierType` | ESTRI-IDTYPE | Native target evidence: ZEHT_B_SpecIdentifierCompare.IdentifierType | copy |
| `IdentifierCategory` | ESTRI-IDCAT | Native target evidence: ZEHT_B_SpecIdentifierCompare.IdentifierCategory | copy |
| `Language` | ESTRI-LANGU | Native target evidence: ZEHT_B_SpecIdentifierCompare.Language | copy |
| `Identifier` | ESTRI-IDENT | Native target evidence: ZEHT_B_SpecIdentifierCompare.Identifier | copy |
| `SortOrder` | ESTRI-ORD | Native target evidence: ZEHT_B_SpecIdentifierCompare.SortOrder | copy |

## Source controls

- Source count view: `ZEHX_C_SpecificationMigCount`

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- Specification: Classic specification model. Preserve all change states; no unverified latest-record rule.
- SpecIdentifier: Native short identifier only; long-text interfaces and effective parent change-state relations remain pending.
- SpecProperty: Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.
