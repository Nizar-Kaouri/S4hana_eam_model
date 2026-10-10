# Migration interface: long_text

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`, `maintenance_notification`, `maintenance_order`, `task_list`, `maintenance_plan`
- **Business key:** `TextObject`, `TextName`, `TextID`, `Language` · numbering **derived**
- **Key rule:** Text names contain the object key; the load program rebuilds them from the key maps.

> TODO-VERIFY[M] XLT-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

Values are delivered **translated**: every field marked *value map* / *key map* is looked up in the mapping table `ZEMX_MAP` (map name in capitals); without an entry the old value is delivered. `Legacy*` key fields carry the old key of the record.

## `ZEMX_C_LongTextIndexMig`

- Source: `ZEMX_I_LongTextHeader`
- Keys: `TextObject`, `TextName`, `TextID`, `Language`
- Scope: `all rows`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `TextObject` | STXH-TDOBJECT | STXH-TDOBJECT | copy |  |
| `TextName` | STXH-TDNAME | - | derived: object key + text ID specific suffix; rebuilt from the translated key by the load program |  |
| `TextID` | STXH-TDID | STXH-TDID | copy |  |
| `Language` | STXH-TDSPRAS | STXH-TDSPRAS | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_LongTextHeader` | `CreationDate` | STXH-TDFDATE | information only |
| `ZEMX_I_LongTextHeader` | `CreatedByUser` | STXH-TDFUSER | information only |
| `ZEMX_I_LongTextHeader` | `LastChangeDate` | STXH-TDLDATE | information only |
| `ZEMX_I_LongTextHeader` | `LastChangedByUser` | STXH-TDLUSER | information only |

## Maps

None.

## Reconciliation

- Counts: `ZEMX_C_LongTextMigCount` (ECC, translated values) vs `-` (S/4HANA) per `TextObject`, `TextID`

```bash
python3 tools/mig_reconcile.py counts --module long_text --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- TODO-VERIFY[H] XLT-G01: the text content (STXL, compressed) is read with READ_TEXT by the load program; CDS cannot read it
