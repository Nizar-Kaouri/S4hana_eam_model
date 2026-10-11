# Migration interface: investment_measure

> Version **1.0.0**

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

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `InvestmentProgram` | IMTP-PRNAM | customer interface field: InvestmentProgram (unconfirmed) | information only |
| `ApprovalFiscalYear` | IMTP-GJAHR | customer interface field: ApprovalFiscalYear (unconfirmed) | information only |
| `InvestmentProgramDescription` | IMTP-TXT50 | customer interface field: InvestmentProgramDescription (unconfirmed) | information only |

## `ZPSX_C_InvestPositionMig`

- Source: `ZPSX_I_InvestPosition`
- Keys: `InvestmentPositionInternalID`
- Scope: `all rows`
- Delivery mode: **configuration-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement. Verify investment-program hierarchy and annual approval, assignments to WBS/internal orders, investment profiles, budget distribution and asset-under-construction settlement. IMTP/IMPR/IMZO are candidate configuration/reference structures, not a finished investment-measure posting schema. Preserve externally meaningful identifiers and map internal object numbers.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `InvestmentPositionInternalID` | IMPR-POSNR | customer interface field: InvestmentPositionInternalID (unconfirmed) | information only |
| `InvestmentProgram` | IMPR-PRNAM | customer interface field: InvestmentProgram (unconfirmed) | information only |
| `ApprovalFiscalYear` | IMPR-GJAHR | customer interface field: ApprovalFiscalYear (unconfirmed) | information only |
| `InvestmentPosition` | IMPR-POSID | customer interface field: InvestmentPosition (unconfirmed) | information only |
| `ObjectNumber` | IMPR-OBJNR | customer interface field: ObjectNumber (unconfirmed) | information only |

## `ZPSX_C_InvestAssignMig`

- Source: `ZPSX_I_InvestAssign`
- Keys: `InvestmentPositionInternalID`, `AssignedObject`, `ApprovalFiscalYear`
- Scope: `all rows`
- Delivery mode: **configuration-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement. Verify investment-program hierarchy and annual approval, assignments to WBS/internal orders, investment profiles, budget distribution and asset-under-construction settlement. IMTP/IMPR/IMZO are candidate configuration/reference structures, not a finished investment-measure posting schema. Preserve externally meaningful identifiers and map internal object numbers.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `InvestmentPositionInternalID` | IMZO-POSNR | customer interface field: InvestmentPositionInternalID (unconfirmed) | information only |
| `AssignedObject` | IMZO-OBJNR | customer interface field: AssignedObject (unconfirmed) | information only |
| `ApprovalFiscalYear` | IMZO-GJAHR | customer interface field: ApprovalFiscalYear (unconfirmed) | information only |
| `AssignmentPercentage` | IMZO-PROZU | customer interface field: AssignmentPercentage (unconfirmed) | information only |

## Source controls

- Source count view: `ZPSX_C_InvestProgramMigCount`

## Open gaps

- Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.
- Verify investment-program hierarchy and annual approval, assignments to WBS/internal orders, investment profiles, budget distribution and asset-under-construction settlement. IMTP/IMPR/IMZO are candidate configuration/reference structures, not a finished investment-measure posting schema. Preserve externally meaningful identifiers and map internal object numbers.
