# Migration interface: promise_to_pay

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `CaseUUID` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger before comparison.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFCX_C_PaymentPromiseMig`

- Source: `ZFCX_I_PaymentPromise`
- Keys: `CaseUUID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Financial amount annotations, logical-system naming and invoice relations require DDIC verification. Invoice number is not assumed to be a native attribute field. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `CaseUUID` | UDM_P2P_ATTR-CASE_GUID | Native target evidence: ZFCT_I_PaymentPromiseCompare.CaseUUID | information only | yes |
| `CompanyCode` | UDM_P2P_ATTR-FIN_COMP_CODE | Native target evidence: ZFCT_I_PaymentPromiseCompare.CompanyCode | information only | yes |
| `Customer` | UDM_P2P_ATTR-FIN_CUSTOMER | Native target evidence: ZFCT_I_PaymentPromiseCompare.Customer | information only | yes |
| `Currency` | UDM_P2P_ATTR-FIN_P2P_CURR | Native target evidence: ZFCT_I_PaymentPromiseCompare.Currency | information only | yes |
| `DueDate` | UDM_P2P_ATTR-FIN_P2P_DUE_DATE | Native target evidence: ZFCT_I_PaymentPromiseCompare.DueDate | information only | yes |
| `PromiseDate` | UDM_P2P_ATTR-FIN_P2P_DATE | Native target evidence: ZFCT_I_PaymentPromiseCompare.PromiseDate | information only | yes |
| `PromiseState` | UDM_P2P_ATTR-FIN_P2P_STATE | Native target evidence: ZFCT_I_PaymentPromiseCompare.PromiseState | information only | yes |
| `PromiseLevel` | UDM_P2P_ATTR-FIN_P2P_LEVEL | Native target evidence: ZFCT_I_PaymentPromiseCompare.PromiseLevel | information only | yes |
| `PromisedBy` | UDM_P2P_ATTR-FIN_PROMISED_BY | Native target evidence: ZFCT_I_PaymentPromiseCompare.PromisedBy | information only | yes |

## Reconciliation

- Counts: `ZFCX_C_PaymentPromiseMigCount` (SAP source) vs `ZFCT_I_PaymentPromiseCount` (S/4HANA) as global candidate counts
- Records and fields: `ZFCX_C_PaymentPromiseMig` vs `ZFCT_I_PaymentPromiseCompare` on `CaseUUID`; compared: `CompanyCode`, `Customer`, `Currency`, `DueDate`, `PromiseDate`, `PromiseState`, `PromiseLevel`, `PromisedBy`

```bash
python3 tools/mig_reconcile.py counts --product fscm_mig_src --module promise_to_pay --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product fscm_mig_src --module promise_to_pay --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Native field/key/release verification and SAP activation pending. No posting adapter.
- PromiseItem: Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.
- Pending native dependency: collections_profile
