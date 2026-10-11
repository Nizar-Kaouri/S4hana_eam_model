# Migration interface: credit_segment

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** `credit_profile`
- **Business key:** `BusinessPartner`, `CreditSegment` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger during loading.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFCX_C_CreditSegmentMig`

- Source: `ZFCX_I_CreditSegment`
- Keys: `BusinessPartner`, `CreditSegment`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: CreditLimit and its currency context require UKMCRED_SGM0C verification; no fictitious segment currency column is supplied. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `BusinessPartner` | UKMBP_CMS_SGM-PARTNER | Native target evidence: ZFCT_B_CreditSegmentCompare.BusinessPartner | copy |
| `CreditSegment` | UKMBP_CMS_SGM-CREDIT_SGMNT | Native target evidence: ZFCT_B_CreditSegmentCompare.CreditSegment | copy |
| `Blocked` | UKMBP_CMS_SGM-XBLOCKED | Native target evidence: ZFCT_B_CreditSegmentCompare.Blocked | copy |
| `LimitValidTo` | UKMBP_CMS_SGM-LIMIT_VALID_DATE | Native target evidence: ZFCT_B_CreditSegmentCompare.LimitValidTo | copy |
| `LimitChangedOn` | UKMBP_CMS_SGM-LIMIT_CHG_DATE | Native target evidence: ZFCT_B_CreditSegmentCompare.LimitChangedOn | copy |
| `Coordinator` | UKMBP_CMS_SGM-COORDINATOR | Native target evidence: ZFCT_B_CreditSegmentCompare.Coordinator | copy |
| `BlockReason` | UKMBP_CMS_SGM-BLOCK_REASON | Native target evidence: ZFCT_B_CreditSegmentCompare.BlockReason | copy |
| `Critical` | UKMBP_CMS_SGM-XCRITICAL | Native target evidence: ZFCT_B_CreditSegmentCompare.Critical | copy |
| `ZeroLimit` | UKMBP_CMS_SGM-X_LIMIT_ZERO | Native target evidence: ZFCT_B_CreditSegmentCompare.ZeroLimit | copy |

## Source controls

- Source count view: `ZFCX_C_CreditSegmentMigCount`

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- CreditSegment: CreditLimit currency context remains pending: extractor documentation names segment CURRENCY while other releases use UKMCRED_SGM0C currency customizing. Resolve this release-specific contradiction before projecting amounts.
