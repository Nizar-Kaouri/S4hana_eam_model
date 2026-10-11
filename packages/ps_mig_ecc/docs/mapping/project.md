# Migration interface: project

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** - (first level)
- **Business key:** `ProjectInternalID` · numbering **derived**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZPSX_C_ProjectMig`

- Source: `ZPSX_I_Project`
- Keys: `ProjectInternalID`
- Scope: `all rows`
- Delivery mode: **master**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ProjectInternalID` | PROJ-PSPNR | customer interface field: ProjectInternalID (unconfirmed) | copy | yes |
| `ProjectExternalID` | PROJ-PSPID | customer interface field: ProjectExternalID (unconfirmed) | copy | yes |
| `ProjectDescription` | PROJ-POST1 | customer interface field: ProjectDescription (unconfirmed) | copy | yes |
| `CompanyCode` | PROJ-VBUKR | customer interface field: CompanyCode (unconfirmed) | copy | yes |
| `ControllingArea` | PROJ-VKOKR | customer interface field: ControllingArea (unconfirmed) | copy | yes |
| `ObjectNumber` | PROJ-OBJNR | customer interface field: ObjectNumber (unconfirmed) | copy | yes |

## `ZPSX_C_ProjectStatusMig`

- Source: `ZPSX_I_ProjectStatus`
- Keys: `ProjectInternalID`, `StatusCode`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: Preserve full keys and the selected parent population. Technical source IDs are references; SAP generates target IDs. Use supported SAP business interfaces; system statuses and address versions are reference data, not direct table posting payloads.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ProjectInternalID` | PROJ-PSPNR | - | copy |  |
| `ObjectNumber` | JEST-OBJNR | - | information only |  |
| `StatusCode` | JEST-STAT | - | copy |  |
| `StatusKind` | derived: first character of JEST-STAT | - | copy |  |
| `StatusChangeNumber` | JEST-CHGNR | - | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZPSX_B_ProjectStatusData` | `StatusIsInactive` | JEST-INACT | Selection predicate retains only active source statuses. |

## Reconciliation

- Counts: `ZPSX_C_ProjectMigCount` (ECC) vs `ZPST_I_ProjectCount` (S/4HANA) per `ProjectInternalID`
- Records and fields: `ZPSX_C_ProjectMig` vs `ZPST_B_ProjectCompare` on `ProjectInternalID`; compared: `ProjectExternalID`, `ProjectDescription`, `CompanyCode`, `ControllingArea`

```bash
python3 tools/mig_reconcile.py counts --product ps_mig_ecc --module project --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product ps_mig_ecc --module project --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.
