# Migration interface: object_status

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`, `maintenance_notification`, `maintenance_order`
- **Business key:** `StatusObjectType`, `StatusObjectKey`, `StatusCode` · numbering **derived**
- **Key rule:** Object numbers are rebuilt on S/4HANA from the object keys.

> TODO-VERIFY[M] XST-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEMX_C_UserStatusMig`

- Source: `ZEMX_I_ObjectStatus`
- Keys: `StatusObjectKey`, `StatusCode`
- Scope: `src.StatusKind = 'E'`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `StatusObjectKey` | JEST: substring( jest.objnr, 3, 30 ) | - | copy |  |
| `StatusCode` | JEST-STAT | JEST-STAT | copy |  |
| `StatusObjectType` | JEST: substring( jest.objnr, 1, 2 ) | - | derived: object type of the object number |  |
| `StatusProfile` | JSTO-STSMA | JSTO-STSMA | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_ObjectStatus` | `ObjectNumber` | JEST-OBJNR | not migrated: rebuilt on S/4HANA from the object key |
| `ZEMX_I_ObjectStatus` | `StatusKind` | JEST: substring( jest.stat, 1, 1 ) | scope flag |
| `ZEMX_I_ObjectStatus` | `StatusChangeNumber` | JEST-CHGNR | information only |

## Reconciliation

- Counts: `ZEMX_C_UserStatusMigCount` (ECC) vs `-` (S/4HANA) per `StatusObjectType`, `StatusCode`

```bash
python3 tools/mig_reconcile.py counts --module object_status --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- TODO-VERIFY[M] XST-G01: user status codes are defined per status profile; the same status code can mean different statuses in different profiles - deliver StatusProfile with the code
