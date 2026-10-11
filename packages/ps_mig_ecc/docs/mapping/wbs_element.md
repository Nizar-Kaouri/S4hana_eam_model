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

## Reconciliation

- Counts: `ZPSX_C_WBSMigCount` (ECC) vs `ZPST_I_WBSCount` (S/4HANA) per `WBSElementInternalID`
- Records and fields: `ZPSX_C_WBSMig` vs `ZPST_B_WBSCompare` on `WBSElementInternalID`; compared: `WBSElementExternalID`, `WBSElementDescription`

```bash
python3 tools/mig_reconcile.py counts --product ps_mig_ecc --module wbs_element --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ps_mig_ecc --module wbs_element --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.
