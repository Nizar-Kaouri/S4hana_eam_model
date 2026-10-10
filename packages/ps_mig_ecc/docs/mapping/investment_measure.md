# Migration interface: investment_measure

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** Customer-verified business interface; configuration-reference restrictions apply
- **Load after:** `wbs_element`
- **Business key:** `InvestmentProgram`, `ApprovalFiscalYear` · numbering **derived**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZPSX_C_InvestProgramMig`

- Source: `ZPSX_I_InvestProgram`
- Keys: `InvestmentProgram`, `ApprovalFiscalYear`
- Scope: `all rows`
- Delivery mode: **configuration-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement. Verify investment-program hierarchy and annual approval, assignments to WBS/internal orders, investment profiles, budget distribution and asset-under-construction settlement. IMTP/IMPR/IMZO are candidate configuration/reference structures, not a finished investment-measure posting schema. Preserve externally meaningful identifiers and map internal object numbers.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `InvestmentProgram` | IMTP-PRNAM | customer interface field: InvestmentProgram (unconfirmed) | information only | yes |
| `ApprovalFiscalYear` | IMTP-GJAHR | customer interface field: ApprovalFiscalYear (unconfirmed) | information only | yes |
| `InvestmentProgramDescription` | IMTP-TXT50 | customer interface field: InvestmentProgramDescription (unconfirmed) | information only | yes |

## `ZPSX_C_InvestPositionMig`

- Source: `ZPSX_I_InvestPosition`
- Keys: `InvestmentPositionInternalID`
- Scope: `all rows`
- Delivery mode: **configuration-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement. Verify investment-program hierarchy and annual approval, assignments to WBS/internal orders, investment profiles, budget distribution and asset-under-construction settlement. IMTP/IMPR/IMZO are candidate configuration/reference structures, not a finished investment-measure posting schema. Preserve externally meaningful identifiers and map internal object numbers.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `InvestmentPositionInternalID` | IMPR-POSNR | customer interface field: InvestmentPositionInternalID (unconfirmed) | information only | yes |
| `InvestmentProgram` | IMPR-PRNAM | customer interface field: InvestmentProgram (unconfirmed) | information only | yes |
| `ApprovalFiscalYear` | IMPR-GJAHR | customer interface field: ApprovalFiscalYear (unconfirmed) | information only | yes |
| `InvestmentPosition` | IMPR-POSID | customer interface field: InvestmentPosition (unconfirmed) | information only | yes |
| `ObjectNumber` | IMPR-OBJNR | customer interface field: ObjectNumber (unconfirmed) | information only | yes |

## `ZPSX_C_InvestAssignMig`

- Source: `ZPSX_I_InvestAssign`
- Keys: `InvestmentPositionInternalID`, `AssignedObject`, `ApprovalFiscalYear`
- Scope: `all rows`
- Delivery mode: **configuration-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement. Verify investment-program hierarchy and annual approval, assignments to WBS/internal orders, investment profiles, budget distribution and asset-under-construction settlement. IMTP/IMPR/IMZO are candidate configuration/reference structures, not a finished investment-measure posting schema. Preserve externally meaningful identifiers and map internal object numbers.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `InvestmentPositionInternalID` | IMZO-POSNR | customer interface field: InvestmentPositionInternalID (unconfirmed) | information only | yes |
| `AssignedObject` | IMZO-OBJNR | customer interface field: AssignedObject (unconfirmed) | information only | yes |
| `ApprovalFiscalYear` | IMZO-GJAHR | customer interface field: ApprovalFiscalYear (unconfirmed) | information only | yes |
| `AssignmentPercentage` | IMZO-PROZU | customer interface field: AssignmentPercentage (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZPSX_C_InvestProgramMigCount` (ECC) vs `-` (S/4HANA) per `InvestmentProgram`

```bash
python3 tools/mig_reconcile.py counts --product ps_mig_ecc --module investment_measure --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.
- Verify investment-program hierarchy and annual approval, assignments to WBS/internal orders, investment profiles, budget distribution and asset-under-construction settlement. IMTP/IMPR/IMZO are candidate configuration/reference structures, not a finished investment-measure posting schema. Preserve externally meaningful identifiers and map internal object numbers.
