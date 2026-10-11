# Migration interface: credit_profile

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `BusinessPartner` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger before comparison.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFCX_C_CreditProfileMig`

- Source: `ZFCX_I_CreditProfile`
- Keys: `BusinessPartner`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: CLIENT is the implicit current-client field. Credit relationships remain pending. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `BusinessPartner` | UKMBP_CMS-PARTNER | Native target evidence: ZFCT_B_CreditProfileCompare.BusinessPartner | copy | yes |
| `OwnRating` | UKMBP_CMS-OWN_RATING | Native target evidence: ZFCT_B_CreditProfileCompare.OwnRating | copy | yes |
| `CheckRule` | UKMBP_CMS-CHECK_RULE | Native target evidence: ZFCT_B_CreditProfileCompare.CheckRule | copy | yes |
| `LimitRule` | UKMBP_CMS-LIMIT_RULE | Native target evidence: ZFCT_B_CreditProfileCompare.LimitRule | copy | yes |
| `RatingValidTo` | UKMBP_CMS-RATING_VAL_DATE | Native target evidence: ZFCT_B_CreditProfileCompare.RatingValidTo | copy | yes |
| `RiskClass` | UKMBP_CMS-RISK_CLASS | Native target evidence: ZFCT_B_CreditProfileCompare.RiskClass | copy | yes |
| `CreditGroup` | UKMBP_CMS-CREDIT_GROUP | Native target evidence: ZFCT_B_CreditProfileCompare.CreditGroup | copy | yes |

## Reconciliation

- Counts: `ZFCX_C_CreditProfileMigCount` (SAP source) vs `ZFCT_I_CreditProfileCount` (S/4HANA) as global candidate counts
- Records and fields: `ZFCX_C_CreditProfileMig` vs `ZFCT_B_CreditProfileCompare` on `BusinessPartner`; compared: `OwnRating`, `CheckRule`, `LimitRule`, `RatingValidTo`, `RiskClass`, `CreditGroup`

```bash
python3 tools/mig_reconcile.py counts --product fscm_mig_src --module credit_profile --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product fscm_mig_src --module credit_profile --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- CreditProfile: CLIENT is the implicit current-client field. Credit relationships remain pending.
- CreditRelation: Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.
