# Migration interface: object_status

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`, `maintenance_notification`, `maintenance_order`
- **Business key:** `StatusObjectType`, `StatusObjectKey`, `StatusCode` · numbering **derived**
- **Key rule:** Object numbers are rebuilt on S/4HANA from the translated object keys.

> TODO-VERIFY[M] XST-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

Values are delivered **translated**: every field marked *value map* / *key map* is looked up in the mapping table `ZEMX_MAP` (map name in capitals); without an entry the old value is delivered. `Legacy*` key fields carry the old key of the record.

## `ZEMX_C_UserStatusMig`

- Source: `ZEMX_I_ObjectStatus`
- Keys: `LegacyStatusObjectKey`, `LegacyStatusCode`
- Scope: `src.StatusKind = 'E'`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `StatusCode` | JEST-STAT | JEST-STAT | value map: `USER_STATUS` |  |
| `StatusObjectType` | JEST: substring( jest.objnr, 1, 2 ) | - | derived: object type of the object number |  |
| `StatusObjectKey` | JEST: substring( jest.objnr, 3, 30 ) | - | key map: `EQUIPMENT`, `FUNCTIONAL_LOCATION`, `MAINTENANCE_NOTIFICATION`, `MAINTENANCE_ORDER` |  |
| `StatusProfile` | JSTO-STSMA | JSTO-STSMA | value map: `STATUS_PROFILE` |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_ObjectStatus` | `ObjectNumber` | JEST-OBJNR | not migrated: rebuilt on S/4HANA from the translated object key |
| `ZEMX_I_ObjectStatus` | `StatusKind` | JEST: substring( jest.stat, 1, 1 ) | scope flag |
| `ZEMX_I_ObjectStatus` | `StatusChangeNumber` | JEST-CHGNR | information only |

## Maps

- value map `STATUS_PROFILE`
- value map `USER_STATUS`
- key map `EQUIPMENT`
- key map `FUNCTIONAL_LOCATION`
- key map `MAINTENANCE_NOTIFICATION`
- key map `MAINTENANCE_ORDER`

## Reconciliation

- Counts: `ZEMX_C_UserStatusMigCount` (ECC, translated values) vs `-` (S/4HANA) per `StatusObjectType`, `StatusCode`

```bash
python3 tools/mig_reconcile.py counts --module object_status --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

- TODO-VERIFY[M] XST-G01: user status codes are defined per status profile; the map 'USER_STATUS' assumes the same code means the same status in all profiles in scope
