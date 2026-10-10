# Migration interface: classification

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`
- **Business key:** `ClassifiedObject`, `ClassType`, `Class` · numbering **derived**
- **Key rule:** Classes and characteristics are matched by name; they must exist on S/4HANA (master data / customizing transport) before the load.

> TODO-VERIFY[M] XCL-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

Values are delivered **translated**: every field marked *value map* / *key map* is looked up in the mapping table `ZEMX_MAP` (map name in capitals); without an entry the old value is delivered. `Legacy*` key fields carry the old key of the record.

## `ZEMX_C_ClassAssignmentMig`

- Source: `ZEMX_I_ClassAssignment`
- Keys: `LegacyClassifiedObject`, `ClassType`, `Class`
- Scope: `src.IsMarkedForDeletion = '' and ( src.ClassType = '002' or src.ClassType = '003' )`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ClassType` | KSSK-KLART | KSSK-KLART | copy |  |
| `Class` | KLAH-CLASS | KLAH-CLASS | copy |  |
| `ClassifiedObject` | KSSK-OBJEK | KSSK-OBJEK | key map: `EQUIPMENT`, `FUNCTIONAL_LOCATION` |  |
| `ClassificationStatus` | KSSK-STATU | KSSK-STATU | copy |  |

## `ZEMX_C_CharcValueMig`

- Source: `ZEMX_I_CharcValue`
- Keys: `LegacyClassifiedObject`, `ClassType`, `Characteristic`, `CharcValuePositionNumber`
- Scope: `src.IsMarkedForDeletion = '' and ( src.ClassType = '002' or src.ClassType = '003' )`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `ClassType` | AUSP-KLART | AUSP-KLART | copy |  |
| `Characteristic` | CABN-ATNAM | CABN-ATNAM | copy |  |
| `CharcValuePositionNumber` | AUSP-ATZHL | AUSP-ATZHL | copy |  |
| `ClassifiedObject` | AUSP-OBJEK | AUSP-OBJEK | key map: `EQUIPMENT`, `FUNCTIONAL_LOCATION` |  |
| `CharcValue` | AUSP-ATWRT | AUSP-ATWRT | copy |  |
| `CharcFromNumericValue` | AUSP-ATFLV | AUSP-ATFLV | convert (load program): float_si_to_unit |  |
| `CharcToNumericValue` | AUSP-ATFLB | AUSP-ATFLB | convert (load program): float_si_to_unit |  |
| `CharcValueDependency` | AUSP-ATCOD | AUSP-ATCOD | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_ClassAssignment` | `ClassInternalID` | KSSK-CLINT | not migrated: internal class number - mapped by class name |
| `ZEMX_I_ClassAssignment` | `ChangeCounter` | KSSK-ADZHL | information only |
| `ZEMX_I_ClassAssignment` | `IsMarkedForDeletion` | KSSK-LKENZ | scope flag |
| `ZEMX_I_CharcValue` | `CharcInternalID` | AUSP-ATINN | not migrated: internal characteristic number - mapped by name |
| `ZEMX_I_CharcValue` | `ChangeCounter` | AUSP-ADZHL | information only |
| `ZEMX_I_CharcValue` | `IsMarkedForDeletion` | AUSP-LKENZ | scope flag |

## Maps

- key map `EQUIPMENT`
- key map `FUNCTIONAL_LOCATION`

## Reconciliation

- Counts: `ZEMX_C_ClassAssgmtMigCount` (ECC, translated values) vs `-` (S/4HANA) per `ClassType`, `Class`

```bash
python3 tools/mig_reconcile.py counts --module classification --source ecc_counts.csv --target s4_counts.csv
```

## Open gaps

None known.
