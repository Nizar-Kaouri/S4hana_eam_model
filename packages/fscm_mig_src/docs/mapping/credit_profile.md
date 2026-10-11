# Migration interface: credit_profile

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

- **Read by:** Customer-selected supported business interface; native views are read-only
- **Load after:** - (first level)
- **Business key:** `BusinessPartner` · numbering **keep**
- **Key rule:** Native internal keys are retained. Client is implicit. Record system/client/export time outside the CDS. Map regenerated target UUIDs using an approved key ledger during loading.

The consumption views deliver the values **exactly as stored in SAP source**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZFCX_C_CreditProfileMig`

- Source: `ZFCX_I_CreditProfile`
- Keys: `BusinessPartner`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: CLIENT is the implicit current-client field. Credit relationships remain pending. Confirm full native key flags and approve the business cohort. Native extraction is not posting.

| Element | Source (SAP source) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `BusinessPartner` | UKMBP_CMS-PARTNER | Native target evidence: ZFCT_B_CreditProfileCompare.BusinessPartner | copy |
| `OwnRating` | UKMBP_CMS-OWN_RATING | Native target evidence: ZFCT_B_CreditProfileCompare.OwnRating | copy |
| `CheckRule` | UKMBP_CMS-CHECK_RULE | Native target evidence: ZFCT_B_CreditProfileCompare.CheckRule | copy |
| `LimitRule` | UKMBP_CMS-LIMIT_RULE | Native target evidence: ZFCT_B_CreditProfileCompare.LimitRule | copy |
| `RatingValidTo` | UKMBP_CMS-RATING_VAL_DATE | Native target evidence: ZFCT_B_CreditProfileCompare.RatingValidTo | copy |
| `RiskClass` | UKMBP_CMS-RISK_CLASS | Native target evidence: ZFCT_B_CreditProfileCompare.RiskClass | copy |
| `CreditGroup` | UKMBP_CMS-CREDIT_GROUP | Native target evidence: ZFCT_B_CreditProfileCompare.CreditGroup | copy |

## Source controls

- Source count view: `ZFCX_C_CreditProfileMigCount`

## Open gaps

- Actual DDIC, release, SAP activation and acceptance unverified.
- CreditProfile: CLIENT is the implicit current-client field. Credit relationships remain pending.
- CreditRelation: Native field definitions, complete DDIC keys and/or application model unresolved; no staging fallback or executable view supplied.
