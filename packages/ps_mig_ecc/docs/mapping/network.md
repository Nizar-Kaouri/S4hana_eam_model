# Migration interface: network

> Version **1.0.0**

- **Read by:** Customer-verified business interface; process-reference restrictions apply
- **Load after:** `wbs_element`
- **Business key:** `Network` · numbering **derived**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZPSX_C_NetworkHeaderMig`

- Source: `ZPSX_I_NetworkHeader`
- Keys: `Network`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement. AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Network` | AUFK-AUFNR | customer interface field: Network (unconfirmed) | information only | yes |
| `NetworkType` | AUFK-AUART | customer interface field: NetworkType (unconfirmed) | information only | yes |
| `ControllingArea` | AUFK-KOKRS | customer interface field: ControllingArea (unconfirmed) | information only | yes |
| `CompanyCode` | AUFK-BUKRS | customer interface field: CompanyCode (unconfirmed) | information only | yes |
| `Plant` | AUFK-WERKS | customer interface field: Plant (unconfirmed) | information only | yes |
| `NetworkDescription` | AUFK-KTEXT | customer interface field: NetworkDescription (unconfirmed) | information only | yes |
| `ObjectNumber` | AUFK-OBJNR | customer interface field: ObjectNumber (unconfirmed) | information only | yes |

## `ZPSX_C_NetworkPlanMig`

- Source: `ZPSX_I_NetworkPlan`
- Keys: `Network`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement. AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Network` | AFKO-AUFNR | customer interface field: Network (unconfirmed) | information only | yes |
| `RoutingNumber` | AFKO-AUFPL | customer interface field: RoutingNumber (unconfirmed) | information only | yes |
| `BasicStartDate` | AFKO-GSTRP | customer interface field: BasicStartDate (unconfirmed) | information only | yes |
| `BasicFinishDate` | AFKO-GLTRP | customer interface field: BasicFinishDate (unconfirmed) | information only | yes |

## `ZPSX_C_NetworkActivitMig`

- Source: `ZPSX_I_NetworkActivit`
- Keys: `RoutingNumber`, `OperationInternalID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement. AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `RoutingNumber` | AFVC-AUFPL | customer interface field: RoutingNumber (unconfirmed) | information only | yes |
| `OperationInternalID` | AFVC-APLZL | customer interface field: OperationInternalID (unconfirmed) | information only | yes |
| `Activity` | AFVC-VORNR | customer interface field: Activity (unconfirmed) | information only | yes |
| `Sequence` | AFVC-PLNFL | customer interface field: Sequence (unconfirmed) | information only | yes |
| `WorkCenterInternalID` | AFVC-ARBID | customer interface field: WorkCenterInternalID (unconfirmed) | information only | yes |
| `ControlKey` | AFVC-STEUS | customer interface field: ControlKey (unconfirmed) | information only | yes |
| `ActivityDescription` | AFVC-LTXA1 | customer interface field: ActivityDescription (unconfirmed) | information only | yes |
| `WBSElementInternalID` | AFVC-PROJN | customer interface field: WBSElementInternalID (unconfirmed) | information only | yes |

## `ZPSX_C_NetworkQuantitMig`

- Source: `ZPSX_I_NetworkQuantit`
- Keys: `RoutingNumber`, `OperationInternalID`
- Scope: `all rows`
- Delivery mode: **process-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement. AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `RoutingNumber` | AFVV-AUFPL | customer interface field: RoutingNumber (unconfirmed) | information only | yes |
| `OperationInternalID` | AFVV-APLZL | customer interface field: OperationInternalID (unconfirmed) | information only | yes |
| `WorkQuantity` | AFVV-ARBEI | customer interface field: WorkQuantity (unconfirmed) | information only | yes |
| `WorkUnit` | AFVV-ARBEH | customer interface field: WorkUnit (unconfirmed) | information only | yes |
| `Duration` | AFVV-DAUNO | customer interface field: Duration (unconfirmed) | information only | yes |
| `DurationUnit` | AFVV-DAUNE | customer interface field: DurationUnit (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZPSX_C_NetworkHeaderMigCount` (ECC) vs `-` (S/4HANA) per `Network`

```bash
python3 tools/mig_reconcile.py counts --product ps_mig_ecc --module network --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Retain both external project/WBS identifiers and internal references. Rebuild hierarchy with target key maps; do not copy internal object numbers. Project costs are reference history. Status, networks, settlement rules, budgets, commitments and investment measures require a supported business interface and separate scope agreement.
- AUFK contains other order types too: select network types using verified order-type customizing, then close AFKO/AFVC/AFVV against the selected networks. Map internal routing, WBS and work-center IDs. Relationships, capacities, dates and status need the approved network business interface; this is no status replay.
