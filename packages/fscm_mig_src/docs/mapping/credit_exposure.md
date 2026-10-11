# Migration interface: credit_exposure

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** `credit_segment`
- **Business key:** `BusinessPartner`, `CreditSegment`, `ExposureCategory`, `Currency` · numbering **keep**
- **Key rule:** Map regenerated target UUIDs during loading; current client is implicit.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFCX_C_CreditExposureMig`

- Source: `ZFCX_I_CreditExposure`
- Keys: `BusinessPartner`, `CreditSegment`, `ExposureCategory`, `Currency`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Native liability snapshot in stored currency; not a delta feed or posting payload. Declared grain including currency is a DDIC candidate. Derived currency-type and message-party fields are excluded; cross-segment/report-currency aggregation remains pending.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `BusinessPartner` | UKM_TOTALS-PARTNER | Native target evidence: ZFCT_B_CreditExposureCompare.BusinessPartner | information only |
| `CreditSegment` | UKM_TOTALS-CREDIT_SGMNT | Native target evidence: ZFCT_B_CreditExposureCompare.CreditSegment | information only |
| `ExposureCategory` | UKM_TOTALS-COMM_TYP | Native target evidence: ZFCT_B_CreditExposureCompare.ExposureCategory | information only |
| `Currency` | UKM_TOTALS-CURRENCY | Native target evidence: ZFCT_B_CreditExposureCompare.Currency | information only |
| `ExposureAmount` | UKM_TOTALS-AMOUNT | Native target evidence: ZFCT_B_CreditExposureCompare.ExposureAmount | information only |
| `SecuredAmount` | UKM_TOTALS-AMOUNT_SEC | Native target evidence: ZFCT_B_CreditExposureCompare.SecuredAmount | information only |

## Source controls

- Source count view: `ZFCX_C_CreditExposureMigCount`

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- CreditExposure: Native liability snapshot in stored currency; not a delta feed or posting payload. Declared grain including currency is a DDIC candidate. Derived currency-type and message-party fields are excluded; cross-segment/report-currency aggregation remains pending.
