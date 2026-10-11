# Migration interface: routing

> Version **1.0.0**

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

## `ZPPX_C_RoutingMateriaMig`

- Source: `ZPPX_I_RoutingMateria`
- Keys: `Material`, `Plant`, `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

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

## `ZPPX_C_RoutingSelectiMig`

- Source: `ZPPX_I_RoutingSelecti`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `Sequence`, `TaskListNode`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

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

## `ZPPX_C_RoutingOperatiMig`

- Source: `ZPPX_I_RoutingOperati`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListNode`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `TaskListType` | PLPO-PLNTY | customer interface field: TaskListType (unconfirmed) | information only |
| `TaskListGroup` | PLPO-PLNNR | customer interface field: TaskListGroup (unconfirmed) | information only |
| `TaskListNode` | PLPO-PLNKN | customer interface field: TaskListNode (unconfirmed) | information only |
| `InternalCounter` | PLPO-ZAEHL | customer interface field: InternalCounter (unconfirmed) | information only |
| `ValidFromDate` | PLPO-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only |
| `ChangeNumber` | PLPO-AENNR | customer interface field: ChangeNumber (unconfirmed) | information only |
| `DeletionFlag` | PLPO-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | information only |
| `Operation` | PLPO-VORNR | customer interface field: Operation (unconfirmed) | information only |
| `OperationText` | PLPO-LTXA1 | customer interface field: OperationText (unconfirmed) | information only |

## `ZPPX_C_RoutingSequencMig`

- Source: `ZPPX_I_RoutingSequenc`
- Keys: `TaskListType`, `TaskListGroup`, `TaskListGroupCounter`, `Sequence`, `InternalCounter`
- Scope: `all rows`
- Delivery mode: **effectivity-reference**
- Before posting: Unscoped candidate rows. Approve the full-key population at cutover; use customer-cohort-project.json. BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `TaskListType` | PLFL-PLNTY | customer interface field: TaskListType (unconfirmed) | information only |
| `TaskListGroup` | PLFL-PLNNR | customer interface field: TaskListGroup (unconfirmed) | information only |
| `TaskListGroupCounter` | PLFL-PLNAL | customer interface field: TaskListGroupCounter (unconfirmed) | information only |
| `Sequence` | PLFL-PLNFL | customer interface field: Sequence (unconfirmed) | information only |
| `InternalCounter` | PLFL-ZAEHL | customer interface field: InternalCounter (unconfirmed) | information only |
| `ValidFromDate` | PLFL-DATUV | customer interface field: ValidFromDate (unconfirmed) | information only |
| `DeletionFlag` | PLFL-LOEKZ | customer interface field: DeletionFlag (unconfirmed) | information only |

## `ZPPX_C_RoutingLongTextMig`

- Source: `ZPPX_I_RoutingLongText`
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

- Source count view: `ZPPX_C_RoutingHeaderMigCount`

## Open gaps

- BOMs and routings need key date, engineering change, usage, alternative and selected-node resolution. Preserve alternative sequences and dependencies. Production orders are process references unless the chosen target interface explicitly supports their state; confirmations, goods movements and costs must not be reposted as master data.
