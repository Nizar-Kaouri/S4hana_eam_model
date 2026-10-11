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

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `TaskListType` | PLKO-PLNTY | customer interface field: TaskListType (unconfirmed) | information only |
| `TaskListGroup` | PLKO-PLNNR | customer interface field: TaskListGroup (unconfirmed) | information only |
| `TaskListGroupCounter` | PLKO-PLNAL | customer interface field: TaskListGroupCounter (unconfirmed) | information only |
| `InternalCounter` | PLKO-ZAEHL | customer interface field: InternalCounter (unconfirmed) | information only |
| `ValidFromDate` | PLKO-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only |
| `ChangeNumber` | PLKO-AENNR | customer interface field: ChangeNumber (unconfirmed) | information only |
| `DeletionFlag` | PLKO-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | information only |
| `TaskListDescription` | PLKO-KTEXT | customer interface field: TaskListDescription (unconfirmed) | information only |

## `ZQMX_C_InspectPlanMatMig`

- Source: `ZQMX_I_InspectPlanMat`
- Keys: `Material`, `Plant`, `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `Material` | MAPL-MATNR | customer interface field: Material (unconfirmed) | information only |
| `Plant` | MAPL-WERKS | customer interface field: Plant (unconfirmed) | information only |
| `TaskListType` | MAPL-PLNTY | customer interface field: TaskListType (unconfirmed) | information only |
| `TaskListGroup` | MAPL-PLNNR | customer interface field: TaskListGroup (unconfirmed) | information only |
| `TaskListGroupCounter` | MAPL-PLNAL | customer interface field: TaskListGroupCounter (unconfirmed) | information only |
| `InternalCounter` | MAPL-ZAEHL | customer interface field: InternalCounter (unconfirmed) | information only |
| `ValidFromDate` | MAPL-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only |
| `DeletionFlag` | MAPL-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | information only |

## `ZQMX_C_InspectPlanSelMig`

- Source: `ZQMX_I_InspectPlanSel`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `Sequence`, `TaskListNode`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `TaskListType` | PLAS-PLNTY | customer interface field: TaskListType (unconfirmed) | information only |
| `TaskListGroup` | PLAS-PLNNR | customer interface field: TaskListGroup (unconfirmed) | information only |
| `TaskListGroupCounter` | PLAS-PLNAL | customer interface field: TaskListGroupCounter (unconfirmed) | information only |
| `Sequence` | PLAS-PLNFL | customer interface field: Sequence (unconfirmed) | information only |
| `TaskListNode` | PLAS-PLNKN | customer interface field: TaskListNode (unconfirmed) | information only |
| `InternalCounter` | PLAS-ZAEHL | customer interface field: InternalCounter (unconfirmed) | information only |
| `ValidFromDate` | PLAS-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only |
| `DeletionFlag` | PLAS-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | information only |

## `ZQMX_C_InspectPlanOpeMig`

- Source: `ZQMX_I_InspectPlanOpe`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListNode`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `TaskListType` | PLPO-PLNTY | customer interface field: TaskListType (unconfirmed) | information only |
| `TaskListGroup` | PLPO-PLNNR | customer interface field: TaskListGroup (unconfirmed) | information only |
| `TaskListNode` | PLPO-PLNKN | customer interface field: TaskListNode (unconfirmed) | information only |
| `InternalCounter` | PLPO-ZAEHL | customer interface field: InternalCounter (unconfirmed) | information only |
| `ValidFromDate` | PLPO-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only |
| `DeletionFlag` | PLPO-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | information only |
| `Operation` | PLPO-VORNR | customer interface field: Operation (unconfirmed) | information only |
| `OperationText` | PLPO-LTXA1 | customer interface field: OperationText (unconfirmed) | information only |

## `ZQMX_C_PlanCharacteriMig`

- Source: `ZQMX_I_PlanCharacteri`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListNode`, `CharacteristicNumber`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `TaskListType` | PLMK-PLNTY | customer interface field: TaskListType (unconfirmed) | information only |
| `TaskListGroup` | PLMK-PLNNR | customer interface field: TaskListGroup (unconfirmed) | information only |
| `TaskListNode` | PLMK-PLNKN | customer interface field: TaskListNode (unconfirmed) | information only |
| `CharacteristicNumber` | PLMK-MERKNR | customer interface field: CharacteristicNumber (unconfirmed) | information only |
| `InternalCounter` | PLMK-ZAEHL | customer interface field: InternalCounter (unconfirmed) | information only |
| `ValidFromDate` | PLMK-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only |
| `DeletionFlag` | PLMK-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | information only |
| `CharacteristicDescription` | PLMK-KURZTEXT | customer interface field: CharacteristicDescription (unconfirmed) | information only |

## `ZQMX_C_PlanLongTextMig`

- Source: `ZQMX_I_PlanLongText`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`
- Delivery mode: **reference**
- Before posting: SAPscript index only. Populate the explicit full text-key to business-owner link file from the source text editor/application metadata, run the text_scope preparation step against selected masters, then READ_TEXT to retrieve ordered formatted lines. Never infer the business owner from a TDNAME substring or post compressed STXL data.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | - | copy |
| `TextName` | STXH-TDNAME | - | copy |
| `TextID` | STXH-TDID | - | copy |
| `Language` | STXH-TDSPRAS | - | copy |

## Source controls

- Source count view: `ZQMX_C_InspectPlanHeaMigCount`

## Open gaps

- Lots, results and usage decisions have process and status prerequisites. Results are reference data until a supported transfer interface is selected. Inspection plans require task-list effectivity, selected operations, characteristics, sampling and material assignments; plain PLKO rows are not an effective plan. Notifications require catalogs, partners and status decisions.
