# Mapping: long_text

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Target:** SAP S/4HANA Migration Cockpit - migration object *Long text (part of each object migration)*
- **Load after:** `equipment`, `functional_location`, `maintenance_notification`, `maintenance_order`, `task_list`, `maintenance_plan`
- **Business key:** `TextObject`, `TextName`, `TextID`, `Language` · numbering **derived**
- **Key rule:** Text names contain the object key; rebuild them from the key maps.
- **Scope filter:** `texts of objects in scope`

> TODO-VERIFY[H] XLT-M01: Migration Cockpit object for 'Long text (part of each object migration)' (name, approach staging tables / direct transfer) and its structure field names; targets below are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance

## Fields

| View | Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|---|
| `ZEMX_I_LongTextHeader` | `TextObject` | STXH-TDOBJECT | STXH-TDOBJECT | copy |  |
| `ZEMX_I_LongTextHeader` | `TextName` | STXH-TDNAME | STXH-TDNAME | derive: object key + text ID specific suffix; rebuilt from the new key |  |
| `ZEMX_I_LongTextHeader` | `TextID` | STXH-TDID | STXH-TDID | copy |  |
| `ZEMX_I_LongTextHeader` | `Language` | STXH-TDSPRAS | STXH-TDSPRAS | copy |  |
| `ZEMX_I_LongTextHeader` | `CreationDate` | STXH-TDFDATE | - | information only |  |
| `ZEMX_I_LongTextHeader` | `CreatedByUser` | STXH-TDFUSER | - | information only |  |
| `ZEMX_I_LongTextHeader` | `LastChangeDate` | STXH-TDLDATE | - | information only |  |
| `ZEMX_I_LongTextHeader` | `LastChangedByUser` | STXH-TDLUSER | - | information only |  |

## Value maps and key maps

None.

## Reconciliation

- Counts: `ZEMX_R_LongTextCount` (ECC) vs `-` (S/4HANA) per `TextObject`, `TextID`

```bash
python3 tools/mig_reconcile.py counts --module long_text --source ecc_counts.csv --target s4_counts.csv --maps <folder>
```

## Open gaps

- TODO-VERIFY[H] XLT-G01: the text content (STXL, compressed) needs an ABAP extractor calling READ_TEXT; not part of the pilot
