# Migration interface: inspection_plan

> Version **1.0.0**

- **Read by:** customer-selected supported posting interface; reference data is not posted
- **Load after:** - (first level)
- **Business key:** `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `InternalCounter` · numbering **keep**
- **Key rule:** Preserve source identifiers in an audit ledger; map regenerated internal IDs and target numbering. Never assume internal IDs survive migration.

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZQMX_C_InspectPlanHeaMig`

- Source: `ZQMX_I_InspectPlanHea`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

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

## `ZQMX_C_InspectPlanMatMig`

- Source: `ZQMX_I_InspectPlanMat`
- Keys: `Material`, `Plant`, `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

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

## `ZQMX_C_InspectPlanSelMig`

- Source: `ZQMX_I_InspectPlanSel`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `Sequence`, `TaskListNode`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

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

## `ZQMX_C_InspectPlanOpeMig`

- Source: `ZQMX_I_InspectPlanOpe`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListNode`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TaskListType` | PLPO-PLNTY | customer interface field: TaskListType (unconfirmed) | information only | yes |
| `TaskListGroup` | PLPO-PLNNR | customer interface field: TaskListGroup (unconfirmed) | information only | yes |
| `TaskListNode` | PLPO-PLNKN | customer interface field: TaskListNode (unconfirmed) | information only | yes |
| `InternalCounter` | PLPO-ZAEHL | customer interface field: InternalCounter (unconfirmed) | information only | yes |
| `ValidFromDate` | PLPO-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only | yes |
| `DeletionFlag` | PLPO-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | information only | yes |
| `Operation` | PLPO-VORNR | customer interface field: Operation (unconfirmed) | information only | yes |
| `OperationText` | PLPO-KTEXT | customer interface field: OperationText (unconfirmed) | information only | yes |

## `ZQMX_C_PlanCharacteriMig`

- Source: `ZQMX_I_PlanCharacteri`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListNode`, `CharacteristicNumber`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TaskListType` | PLMK-PLNTY | customer interface field: TaskListType (unconfirmed) | information only | yes |
| `TaskListGroup` | PLMK-PLNNR | customer interface field: TaskListGroup (unconfirmed) | information only | yes |
| `TaskListNode` | PLMK-PLNKN | customer interface field: TaskListNode (unconfirmed) | information only | yes |
| `CharacteristicNumber` | PLMK-MERKNR | customer interface field: CharacteristicNumber (unconfirmed) | information only | yes |
| `InternalCounter` | PLMK-ZAEHL | customer interface field: InternalCounter (unconfirmed) | information only | yes |
| `ValidFromDate` | PLMK-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only | yes |
| `DeletionFlag` | PLMK-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | information only | yes |
| `CharacteristicDescription` | PLMK-KURZTEXT | customer interface field: CharacteristicDescription (unconfirmed) | information only | yes |

## Reconciliation

- Counts: `ZQMX_C_InspectPlanHeaMigCount` (ECC) vs `-` (S/4HANA) per `TaskListType`

```bash
python3 tools/mig_reconcile.py counts --product qm_mig_ecc --module inspection_plan --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.
