# Migration interface: long_text

> Version **1.0.0**

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`, `maintenance_notification`, `maintenance_order`, `task_list`, `maintenance_plan`
- **Business key:** `TextObject`, `TextName`, `TextID`, `Language` · numbering **derived**
- **Key rule:** Text names contain the object key; the load program rebuilds them from the new object keys.

> Compatibility note: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEMX_C_LongTextIndexMig`

- Source: `ZEMX_I_LongTextHeader`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | STXH-TDOBJECT | copy |  |
| `TextName` | STXH-TDNAME | - | derived: object key + text ID specific suffix; rebuilt from the object key by the load program |  |
| `TextID` | STXH-TDID | STXH-TDID | copy |  |
| `Language` | STXH-TDSPRAS | STXH-TDSPRAS | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_LongTextHeader` | `CreationDate` | STXH-TDFDATE | information only |
| `ZEMX_I_LongTextHeader` | `CreatedByUser` | STXH-TDFUSER | information only |
| `ZEMX_I_LongTextHeader` | `LastChangeDate` | STXH-TDLDATE | information only |
| `ZEMX_I_LongTextHeader` | `LastChangedByUser` | STXH-TDLUSER | information only |

## Reconciliation

- Counts: `ZEMX_C_LongTextMigCount` (ECC) vs `-` (S/4HANA) per `TextObject`, `TextID`

```bash
python3 tools/mig_reconcile.py counts --product eam_mig_ecc --module long_text --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- Compatibility note: the text content (STXL, compressed) is read with READ_TEXT by the load program; CDS cannot read it
