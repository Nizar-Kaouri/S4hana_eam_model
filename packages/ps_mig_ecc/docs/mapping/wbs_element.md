# Migration interface: wbs_element

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** `project`
- **Business key:** `WBSElementInternalID` · numbering **derived**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZPSX_C_WBSMig`

- Source: `ZPSX_I_WBS`
- Keys: `WBSElementInternalID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `WBSElementInternalID` | PRPS-PSPNR | customer interface field: WBSElementInternalID (unconfirmed) | copy | yes |
| `WBSElementExternalID` | PRPS-POSID | customer interface field: WBSElementExternalID (unconfirmed) | copy | yes |
| `WBSElementDescription` | PRPS-POST1 | customer interface field: WBSElementDescription (unconfirmed) | copy | yes |
| `ProjectInternalID` | PRPS-PSPHI | customer interface field: ProjectInternalID (unconfirmed) | copy | yes |
| `CompanyCode` | PRPS-PBUKR | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `ControllingArea` | PRPS-PKOKR | customer interface field: ControllingArea (unconfirmed) | copy | yes |
| `ObjectNumber` | PRPS-OBJNR | customer interface field: ObjectNumber (unconfirmed) | copy | yes |

## `ZPSX_C_WBSHierarchyMig`

- Source: `ZPSX_I_WBSHierarchy`
- Keys: `WBSElementInternalID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `WBSElementInternalID` | PRHI-POSNR | customer interface field: WBSElementInternalID (unconfirmed) | copy | yes |
| `ParentWBSElementInternalID` | PRHI-UP | customer interface field: ParentWBSElementInternalID (unconfirmed) | copy | yes |
| `FirstChildInternalID` | PRHI-DOWN | customer interface field: FirstChildInternalID (unconfirmed) | copy | yes |
| `PreviousSiblingInternalID` | PRHI-LEFT | customer interface field: PreviousSiblingInternalID (unconfirmed) | copy | yes |
| `NextSiblingInternalID` | PRHI-RIGHT | customer interface field: NextSiblingInternalID (unconfirmed) | copy | yes |

## `ZPSX_C_WBSStatusMig`

- Source: `ZPSX_I_WBSStatus`
- Keys: `WBSElementInternalID`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `WBSElementInternalID` | PRPS-PSPNR | - | copy |  |
| `ObjectNumber` | JEST-OBJNR | - | information only |  |
| `StatusCode` | JEST-STAT | - | copy |  |
| `StatusKind` | derived: first character of JEST-STAT | - | copy |  |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |  |
| `StatusProfile` | JSTO-STSMA | - | copy |  |

## `ZPSX_C_WBSPartnerMig`

- Source: `ZPSX_I_WBSPartner`
- Keys: `WBSElementInternalID`, `PartnerFunction`, `PartnerCounter`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Resolve partner identities and language-independent partner functions through a supported business interface after the selected master. Preserve partner counters; deleted partner assignments are excluded.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `WBSElementInternalID` | PRPS-PSPNR | - | copy |  |
| `PartnerFunction` | IHPA-PARVW | - | copy |  |
| `PartnerCounter` | IHPA-COUNTER | - | copy |  |
| `Partner` | IHPA-PARNR | - | copy |  |

## `ZPSX_C_WBSUserStatusMig`

- Source: `ZPSX_I_WBSUserStatus`
- Keys: `WBSElementInternalID`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Map source profile and E* user status codes to configured target profiles/statuses. Apply through a supported post-load business operation; do not replay system statuses or write JEST/JSTO.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `WBSElementInternalID` | PRPS-PSPNR | - | copy |  |
| `StatusCode` | JEST-STAT | - | copy |  |
| `ObjectNumber` | JEST-OBJNR | - | information only |  |
| `StatusKind` | derived: first character of JEST-STAT | - | copy |  |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |  |
| `StatusProfile` | JSTO-STSMA | - | copy |  |

## `ZPSX_C_WBSSettleMig`

- Source: `ZPSX_I_WBSSettle`
- Keys: `ObjectNumber`, `DistributionRuleGroup`, `DistributionRule`
- Scope: `all rows`
- Delivery mode: **posting**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ObjectNumber` | COBRB-OBJNR | - | information only |  |
| `DistributionRuleGroup` | COBRB-BUREG | - | copy |  |
| `DistributionRule` | COBRB-LFDNR | - | copy |  |
| `SettlementType` | COBRB-PERBZ | - | copy |  |
| `SettlementPercentage` | COBRB-PROZS | - | copy |  |
| `ReceiverCostCenter` | COBRB-KOSTL | - | copy |  |
| `ReceiverOrder` | COBRB-AUFNR | - | copy |  |
| `ReceiverCategory` | COBRB-KONTY | - | copy |  |
| `SettlementAmount` | COBRB-BETRR | - | copy |  |
| `SettlementCurrency` | COBRB-BWAER | - | copy |  |
| `ControllingArea` | COBRB-KOKRS | - | copy |  |
| `ReceiverCompanyCode` | COBRB-BUKRS | - | copy |  |
| `ReceiverMasterAsset` | COBRB-ANLN1 | - | copy |  |
| `ReceiverAsset` | COBRB-ANLN2 | - | copy |  |
| `ReceiverWBSInternalID` | COBRB-PSPNR | - | copy |  |
| `ValidFromFiscalYear` | COBRB-GABJA | - | copy |  |
| `ValidFromPeriod` | COBRB-GABPE | - | copy |  |
| `ValidToFiscalYear` | COBRB-GBISJ | - | copy |  |
| `ValidToPeriod` | COBRB-GBISP | - | copy |  |

## `ZPSX_C_WBSLongTextMig`

- Source: `ZPSX_I_WBSLongText`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: SAPscript index only. Populate the explicit full text-key to business-owner link file from the source text editor/application metadata, run the text_scope preparation step against selected masters, then READ_TEXT to retrieve ordered formatted lines. Never infer the business owner from a TDNAME substring or post compressed STXL data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | - | copy |  |
| `TextName` | STXH-TDNAME | - | copy |  |
| `TextID` | STXH-TDID | - | copy |  |
| `Language` | STXH-TDSPRAS | - | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZPSX_B_WBSStatusData` | `StatusIsInactive` | JEST-INACT | Selection predicate retains only active source statuses. |

## Reconciliation

- Counts: `ZPSX_C_WBSMigCount` (ECC) vs `ZPST_I_WBSCount` (S/4HANA) per `WBSElementInternalID`
- Records and fields: `ZPSX_C_WBSMig` vs `ZPST_B_WBSCompare` on `WBSElementInternalID`; compared: `WBSElementExternalID`, `WBSElementDescription`

```bash
python3 tools/mig_reconcile.py counts --product ps_mig_ecc --module wbs_element --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ps_mig_ecc --module wbs_element --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.
