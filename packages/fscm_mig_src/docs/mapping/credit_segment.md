# Migration interface: credit_segment

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** `credit_profile`
- **Business key:** `BusinessPartner`, `CreditSegment` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger before comparison.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFCX_C_CreditSegmentMig`

- Source: `ZFCX_I_CreditSegment`
- Keys: `BusinessPartner`, `CreditSegment`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: CreditLimit and its currency context require UKMCRED_SGM0C verification; no fictitious segment currency column is supplied. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `BusinessPartner` | UKMBP_CMS_SGM-PARTNER | Native target evidence: ZFCT_I_CreditSegmentCompare.BusinessPartner | copy | yes |
| `CreditSegment` | UKMBP_CMS_SGM-CREDIT_SGMNT | Native target evidence: ZFCT_I_CreditSegmentCompare.CreditSegment | copy | yes |
| `Blocked` | UKMBP_CMS_SGM-XBLOCKED | Native target evidence: ZFCT_I_CreditSegmentCompare.Blocked | copy | yes |
| `LimitValidTo` | UKMBP_CMS_SGM-LIMIT_VALID_DATE | Native target evidence: ZFCT_I_CreditSegmentCompare.LimitValidTo | copy | yes |
| `LimitChangedOn` | UKMBP_CMS_SGM-LIMIT_CHG_DATE | Native target evidence: ZFCT_I_CreditSegmentCompare.LimitChangedOn | copy | yes |
| `Coordinator` | UKMBP_CMS_SGM-COORDINATOR | Native target evidence: ZFCT_I_CreditSegmentCompare.Coordinator | copy | yes |
| `BlockReason` | UKMBP_CMS_SGM-BLOCK_REASON | Native target evidence: ZFCT_I_CreditSegmentCompare.BlockReason | copy | yes |
| `Critical` | UKMBP_CMS_SGM-XCRITICAL | Native target evidence: ZFCT_I_CreditSegmentCompare.Critical | copy | yes |
| `ZeroLimit` | UKMBP_CMS_SGM-X_LIMIT_ZERO | Native target evidence: ZFCT_I_CreditSegmentCompare.ZeroLimit | copy | yes |

## Reconciliation

- Counts: `ZFCX_C_CreditSegmentMigCount` (SAP source) vs `ZFCT_I_CreditSegmentCount` (S/4HANA) as global candidate counts
- Records and fields: `ZFCX_C_CreditSegmentMig` vs `ZFCT_I_CreditSegmentCompare` on `BusinessPartner`, `CreditSegment`; compared: `Blocked`, `LimitValidTo`, `LimitChangedOn`, `Coordinator`, `BlockReason`, `Critical`, `ZeroLimit`

```bash
python3 tools/mig_reconcile.py counts --product fscm_mig_src --module credit_segment --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product fscm_mig_src --module credit_segment --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- CreditSegment: CreditLimit currency context remains pending: extractor documentation names segment CURRENCY while other releases use UKMCRED_SGM0C currency customizing. Resolve this release-specific contradiction before projecting amounts.
