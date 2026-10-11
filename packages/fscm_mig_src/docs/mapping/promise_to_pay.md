# Migration interface: promise_to_pay

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `CaseUUID` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger during loading.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFCX_C_PaymentPromiseMig`

- Source: `ZFCX_I_PaymentPromise`
- Keys: `CaseUUID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Documented native financial attributes with amounts and stored currency. Invoice/item relationships remain pending; compare currencies unchanged. Auto-written-off field naming conflicts across sources and is excluded.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `CaseUUID` | UDM_P2P_ATTR-CASE_GUID | Native target evidence: ZFCT_B_PaymentPromiseCompare.CaseUUID | information only |
| `CompanyCode` | UDM_P2P_ATTR-FIN_COMP_CODE | Native target evidence: ZFCT_B_PaymentPromiseCompare.CompanyCode | information only |
| `Customer` | UDM_P2P_ATTR-FIN_CUSTOMER | Native target evidence: ZFCT_B_PaymentPromiseCompare.Customer | information only |
| `Currency` | UDM_P2P_ATTR-FIN_P2P_CURR | Native target evidence: ZFCT_B_PaymentPromiseCompare.Currency | information only |
| `DueDate` | UDM_P2P_ATTR-FIN_P2P_DUE_DATE | Native target evidence: ZFCT_B_PaymentPromiseCompare.DueDate | information only |
| `PromiseDate` | UDM_P2P_ATTR-FIN_P2P_DATE | Native target evidence: ZFCT_B_PaymentPromiseCompare.PromiseDate | information only |
| `PromiseState` | UDM_P2P_ATTR-FIN_P2P_STATE | Native target evidence: ZFCT_B_PaymentPromiseCompare.PromiseState | information only |
| `PromiseLevel` | UDM_P2P_ATTR-FIN_P2P_LEVEL | Native target evidence: ZFCT_B_PaymentPromiseCompare.PromiseLevel | information only |
| `PromisedBy` | UDM_P2P_ATTR-FIN_PROMISED_BY | Native target evidence: ZFCT_B_PaymentPromiseCompare.PromisedBy | information only |
| `PromisedAmount` | UDM_P2P_ATTR-FIN_PROMISED_AMT | Native target evidence: ZFCT_B_PaymentPromiseCompare.PromisedAmount | information only |
| `PaidAmount` | UDM_P2P_ATTR-FIN_PAID_AMOUNT | Native target evidence: ZFCT_B_PaymentPromiseCompare.PaidAmount | information only |

## Source controls

- Source count view: `ZFCX_C_PaymentPromiseMigCount`

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- PaymentPromise: Documented native financial attributes with amounts and stored currency. Invoice/item relationships remain pending; compare currencies unchanged. Auto-written-off field naming conflicts across sources and is excluded.
- PromiseItem: Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.
