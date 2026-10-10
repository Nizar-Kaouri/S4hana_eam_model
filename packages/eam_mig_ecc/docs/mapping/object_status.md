# Mapping: object_status

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Target:** SAP S/4HANA Migration Cockpit - migration object *User status (part of the object migration)*
- **Load after:** `equipment`, `functional_location`, `maintenance_notification`, `maintenance_order`
- **Business key:** `ObjectNumber`, `StatusCode` · numbering **derived**
- **Key rule:** Object numbers are rebuilt on S/4HANA from the new object keys (key maps of the objects).
- **Scope filter:** `StatusKind = 'E' (user statuses); system statuses are set by S/4HANA` - System statuses (CRTD, REL, ...) result from the load and follow-up actions; compare them in the reconciliation instead of loading them.

> TODO-VERIFY[H] XST-M01: Migration Cockpit object for 'User status (part of the object migration)' (name, approach staging tables / direct transfer) and its structure field names; targets below are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance

## Fields

| View | Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|---|
| `ZEMX_I_ObjectStatus` | `ObjectNumber` | JEST-OBJNR | JEST-OBJNR | derive: object key from the object number (IE + equipment, IF + functional location, QM + notification, OR + order) |  |
| `ZEMX_I_ObjectStatus` | `StatusCode` | JEST-STAT | JEST-STAT | value map: `user_status` |  |
| `ZEMX_I_ObjectStatus` | `StatusObjectType` | substring( jest.objnr, 1, 2 ) | - | derive: selection helper - object type of the object number |  |
| `ZEMX_I_ObjectStatus` | `StatusKind` | substring( jest.stat, 1, 1 ) | - | derive: I = system status (set by S/4HANA, not migrated), E = user status (migrated) |  |
| `ZEMX_I_ObjectStatus` | `StatusProfile` | JSTO-STSMA | JSTO-STSMA | value map: `status_profile` |  |
| `ZEMX_I_ObjectStatus` | `StatusChangeNumber` | JEST-CHGNR | - | information only |  |
| `ZEMX_I_UserStatusText` | `StatusProfile` | TJ30T-STSMA | TJ30T-STSMA | value map: `status_profile` |  |
| `ZEMX_I_UserStatusText` | `StatusCode` | TJ30T-ESTAT | TJ30T-ESTAT | value map: `user_status` |  |
| `ZEMX_I_UserStatusText` | `Language` | TJ30T-SPRAS | TJ30T-SPRAS | copy |  |
| `ZEMX_I_UserStatusText` | `StatusShortName` | TJ30T-TXT04 | TJ30T-TXT04 | copy |  |
| `ZEMX_I_UserStatusText` | `StatusName` | TJ30T-TXT30 | TJ30T-TXT30 | copy |  |

## Value maps and key maps

Templates: `docs/mapping/templates/` (columns `source,target,comment`). An empty map means "same value on S/4HANA".

- value map `status_profile`
- value map `user_status`

## Reconciliation

- Counts: `ZEMX_R_ObjectStatusCount` (ECC) vs `-` (S/4HANA) per `StatusObjectType`, `StatusCode`

```bash
python3 tools/mig_reconcile.py counts --module object_status --source ecc_counts.csv --target s4_counts.csv --maps <folder>
```

## Open gaps

- TODO-VERIFY[H] XST-G01: how the Migration Cockpit objects take user statuses (field in the object template vs. separate step)
