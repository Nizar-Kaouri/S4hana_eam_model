# Migration interface: dispute_case

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `CaseUUID` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger during loading.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFCX_C_DisputeCaseMig`

- Source: `ZFCX_I_DisputeCase`
- Keys: `CaseUUID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Documented native financial attributes with amounts and stored currency. Invoice/item relationships remain pending; compare currencies unchanged. Auto-written-off field naming conflicts across sources and is excluded.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `CaseUUID` | UDMCASEATTR00-CASE_GUID | Native target evidence: ZFCT_B_DisputeCaseCompare.CaseUUID | information only |
| `CompanyCode` | UDMCASEATTR00-FIN_BUKRS | Native target evidence: ZFCT_B_DisputeCaseCompare.CompanyCode | information only |
| `Customer` | UDMCASEATTR00-FIN_KUNNR | Native target evidence: ZFCT_B_DisputeCaseCompare.Customer | information only |
| `Coordinator` | UDMCASEATTR00-FIN_COORDINATOR | Native target evidence: ZFCT_B_DisputeCaseCompare.Coordinator | information only |
| `DisputeCurrency` | UDMCASEATTR00-FIN_DISPUTE_CURR | Native target evidence: ZFCT_B_DisputeCaseCompare.DisputeCurrency | information only |
| `DueDate` | UDMCASEATTR00-FIN_DUE_DATE | Native target evidence: ZFCT_B_DisputeCaseCompare.DueDate | information only |
| `LogicalSystem` | UDMCASEATTR00-FIN_LOG_SYSTEM | Native target evidence: ZFCT_B_DisputeCaseCompare.LogicalSystem | information only |
| `OriginalAmount` | UDMCASEATTR00-FIN_ORIGINAL_AMT | Native target evidence: ZFCT_B_DisputeCaseCompare.OriginalAmount | information only |
| `DisputedAmount` | UDMCASEATTR00-FIN_DISPUTED_AMT | Native target evidence: ZFCT_B_DisputeCaseCompare.DisputedAmount | information only |
| `PaidAmount` | UDMCASEATTR00-FIN_PAID_AMT | Native target evidence: ZFCT_B_DisputeCaseCompare.PaidAmount | information only |
| `CreditedAmount` | UDMCASEATTR00-FIN_CREDITED_AMT | Native target evidence: ZFCT_B_DisputeCaseCompare.CreditedAmount | information only |
| `WrittenOffAmount` | UDMCASEATTR00-FIN_WRT_OFF_AMT | Native target evidence: ZFCT_B_DisputeCaseCompare.WrittenOffAmount | information only |

## `ZFCX_C_CaseAttributeMig`

- Source: `ZFCX_I_CaseAttribute`
- Keys: `CaseUUID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: One wide native record per case UUID; not synthetic attribute-name/value rows. Includes general cases, not only disputes; approve case-type scope. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `CaseUUID` | SCMG_T_CASE_ATTR-CASE_GUID | Native target evidence: ZFCT_B_CaseAttributeCompare.CaseUUID | information only |
| `CaseType` | SCMG_T_CASE_ATTR-CASE_TYPE | Native target evidence: ZFCT_B_CaseAttributeCompare.CaseType | information only |
| `ExternalKey` | SCMG_T_CASE_ATTR-EXT_KEY | Native target evidence: ZFCT_B_CaseAttributeCompare.ExternalKey | information only |
| `ExternalReference` | SCMG_T_CASE_ATTR-EXT_REF | Native target evidence: ZFCT_B_CaseAttributeCompare.ExternalReference | information only |
| `CreatedBy` | SCMG_T_CASE_ATTR-CREATED_BY | Native target evidence: ZFCT_B_CaseAttributeCompare.CreatedBy | information only |
| `CreatedAt` | SCMG_T_CASE_ATTR-CREATE_TIME | Native target evidence: ZFCT_B_CaseAttributeCompare.CreatedAt | information only |
| `ChangedBy` | SCMG_T_CASE_ATTR-CHANGED_BY | Native target evidence: ZFCT_B_CaseAttributeCompare.ChangedBy | information only |
| `ChangedAt` | SCMG_T_CASE_ATTR-CHANGE_TIME | Native target evidence: ZFCT_B_CaseAttributeCompare.ChangedAt | information only |
| `Processor` | SCMG_T_CASE_ATTR-PROCESSOR | Native target evidence: ZFCT_B_CaseAttributeCompare.Processor | information only |
| `Responsible` | SCMG_T_CASE_ATTR-RESPONSIBLE | Native target evidence: ZFCT_B_CaseAttributeCompare.Responsible | information only |
| `Category` | SCMG_T_CASE_ATTR-CATEGORY | Native target evidence: ZFCT_B_CaseAttributeCompare.Category | information only |
| `Priority` | SCMG_T_CASE_ATTR-PRIORITY | Native target evidence: ZFCT_B_CaseAttributeCompare.Priority | information only |
| `Status` | SCMG_T_CASE_ATTR-STAT_PARA | Native target evidence: ZFCT_B_CaseAttributeCompare.Status | information only |
| `ReasonCode` | SCMG_T_CASE_ATTR-REASON_CODE | Native target evidence: ZFCT_B_CaseAttributeCompare.ReasonCode | information only |

## Source controls

- Source count view: `ZFCX_C_DisputeCaseMigCount`

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- DisputeCase: Documented native financial attributes with amounts and stored currency. Invoice/item relationships remain pending; compare currencies unchanged. Auto-written-off field naming conflicts across sources and is excluded.
- DisputeItem: Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.
- CaseAttribute: One wide native record per case UUID; not synthetic attribute-name/value rows. Includes general cases, not only disputes; approve case-type scope.
- CaseAttachment: Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.
