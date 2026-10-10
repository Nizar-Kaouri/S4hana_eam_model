# Migration interface: routing

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** - (first level)
- **Business key:** `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `InternalCounter` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZPPX_C_RoutingHeaderMig`

- Source: `ZPPX_I_RoutingHeader`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TaskListType` | PLKO-PLNTY | customer interface field: TaskListType (unconfirmed) | information only | yes |
| `TaskListGroup` | PLKO-PLNNR | customer interface field: TaskListGroup (unconfirmed) | information only | yes |
| `TaskListGroupCounter` | PLKO-PLNAL | customer interface field: TaskListGroupCounter (unconfirmed) | information only | yes |
| `InternalCounter` | PLKO-ZAEHL | customer interface field: InternalCounter (unconfirmed) | information only | yes |
| `ValidFromDate` | PLKO-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only | yes |
| `ChangeNumber` | PLKO-AENNR | customer interface field: ChangeNumber (unconfirmed) | information only | yes |
| `DeletionFlag` | PLKO-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | information only | yes |
| `TaskListDescription` | PLKO-KTEXT | customer interface field: TaskListDescription (unconfirmed) | information only | yes |

## `ZPPX_C_RoutingMateriaMig`

- Source: `ZPPX_I_RoutingMateria`
- Keys: `Material`, `Plant`, `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Material` | MAPL-MATNR | customer interface field: Material (unconfirmed) | information only | yes |
| `Plant` | MAPL-WERKS | customer interface field: Plant (unconfirmed) | information only | yes |
| `TaskListType` | MAPL-PLNTY | customer interface field: TaskListType (unconfirmed) | information only | yes |
| `TaskListGroup` | MAPL-PLNNR | customer interface field: TaskListGroup (unconfirmed) | information only | yes |
| `TaskListGroupCounter` | MAPL-PLNAL | customer interface field: TaskListGroupCounter (unconfirmed) | information only | yes |
| `InternalCounter` | MAPL-ZAEHL | customer interface field: InternalCounter (unconfirmed) | information only | yes |
| `ValidFromDate` | MAPL-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only | yes |
| `DeletionFlag` | MAPL-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | information only | yes |

## `ZPPX_C_RoutingSelectiMig`

- Source: `ZPPX_I_RoutingSelecti`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `Sequence`, `TaskListNode`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TaskListType` | PLAS-PLNTY | customer interface field: TaskListType (unconfirmed) | information only | yes |
| `TaskListGroup` | PLAS-PLNNR | customer interface field: TaskListGroup (unconfirmed) | information only | yes |
| `TaskListGroupCounter` | PLAS-PLNAL | customer interface field: TaskListGroupCounter (unconfirmed) | information only | yes |
| `Sequence` | PLAS-PLNFL | customer interface field: Sequence (unconfirmed) | information only | yes |
| `TaskListNode` | PLAS-PLNKN | customer interface field: TaskListNode (unconfirmed) | information only | yes |
| `InternalCounter` | PLAS-ZAEHL | customer interface field: InternalCounter (unconfirmed) | information only | yes |
| `ValidFromDate` | PLAS-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only | yes |
| `DeletionFlag` | PLAS-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | information only | yes |

## `ZPPX_C_RoutingOperatiMig`

- Source: `ZPPX_I_RoutingOperati`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListNode`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TaskListType` | PLPO-PLNTY | customer interface field: TaskListType (unconfirmed) | information only | yes |
| `TaskListGroup` | PLPO-PLNNR | customer interface field: TaskListGroup (unconfirmed) | information only | yes |
| `TaskListNode` | PLPO-PLNKN | customer interface field: TaskListNode (unconfirmed) | information only | yes |
| `InternalCounter` | PLPO-ZAEHL | customer interface field: InternalCounter (unconfirmed) | information only | yes |
| `ValidFromDate` | PLPO-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only | yes |
| `ChangeNumber` | PLPO-AENNR | customer interface field: ChangeNumber (unconfirmed) | information only | yes |
| `DeletionFlag` | PLPO-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | information only | yes |
| `Operation` | PLPO-VORNR | customer interface field: Operation (unconfirmed) | information only | yes |
| `OperationText` | PLPO-KTEXT | customer interface field: OperationText (unconfirmed) | information only | yes |

## `ZPPX_C_RoutingSequencMig`

- Source: `ZPPX_I_RoutingSequenc`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `Sequence`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TaskListType` | PLFL-PLNTY | customer interface field: TaskListType (unconfirmed) | information only | yes |
| `TaskListGroup` | PLFL-PLNNR | customer interface field: TaskListGroup (unconfirmed) | information only | yes |
| `TaskListGroupCounter` | PLFL-PLNAL | customer interface field: TaskListGroupCounter (unconfirmed) | information only | yes |
| `Sequence` | PLFL-PLNFL | customer interface field: Sequence (unconfirmed) | information only | yes |
| `InternalCounter` | PLFL-ZAEHL | customer interface field: InternalCounter (unconfirmed) | information only | yes |
| `ValidFromDate` | PLFL-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only | yes |
| `DeletionFlag` | PLFL-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZPPX_C_RoutingHeaderMigCount` (ECC) vs `-` (S/4HANA) per `TaskListType`

```bash
python3 tools/mig_reconcile.py counts --product pp_mig_ecc --module routing --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.
