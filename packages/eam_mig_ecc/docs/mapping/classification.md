# Mapping: classification

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Target:** SAP S/4HANA Migration Cockpit - migration object *Classification (part of the equipment / functional location objects)*
- **Load after:** `equipment`, `functional_location`
- **Business key:** `ClassifiedObject`, `ClassType`, `Class` · numbering **derived**
- **Key rule:** Classes and characteristics are matched by name; they must exist on S/4HANA (master data / customizing transport) before the load.
- **Scope filter:** `IsMarkedForDeletion = '' and ClassType in ('002', '003')` - Only the class types of the technical objects in scope.

> TODO-VERIFY[H] XCL-M01: Migration Cockpit object for 'Classification (part of the equipment / functional location objects)' (name, approach staging tables / direct transfer) and its structure field names; targets below are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance

## Fields

| View | Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|---|
| `ZEMX_I_ClassAssignment` | `ClassifiedObject` | KSSK-OBJEK | KSSK-OBJEK | key map: `equipment\|functional_location` |  |
| `ZEMX_I_ClassAssignment` | `ClassType` | KSSK-KLART | KSSK-KLART | copy |  |
| `ZEMX_I_ClassAssignment` | `ClassInternalID` | KSSK-CLINT | - | not migrated: internal class number - mapped by class name |  |
| `ZEMX_I_ClassAssignment` | `ChangeCounter` | KSSK-ADZHL | - | information only |  |
| `ZEMX_I_ClassAssignment` | `Class` | KLAH-CLASS | KSSK-CLINT (via class name) | copy |  |
| `ZEMX_I_ClassAssignment` | `ClassificationStatus` | KSSK-STATU | KSSK-STATU | copy |  |
| `ZEMX_I_ClassAssignment` | `IsMarkedForDeletion` | KSSK-LKENZ | - | scope filter |  |
| `ZEMX_I_CharcValue` | `ClassifiedObject` | AUSP-OBJEK | AUSP-OBJEK | key map: `equipment\|functional_location` |  |
| `ZEMX_I_CharcValue` | `CharcInternalID` | AUSP-ATINN | - | not migrated: internal characteristic number - mapped by characteristic name |  |
| `ZEMX_I_CharcValue` | `CharcValuePositionNumber` | AUSP-ATZHL | AUSP-ATZHL | copy |  |
| `ZEMX_I_CharcValue` | `ClassType` | AUSP-KLART | AUSP-KLART | copy |  |
| `ZEMX_I_CharcValue` | `ChangeCounter` | AUSP-ADZHL | - | information only |  |
| `ZEMX_I_CharcValue` | `Characteristic` | CABN-ATNAM | AUSP-ATINN (via characteristic name) | copy |  |
| `ZEMX_I_CharcValue` | `CharcValue` | AUSP-ATWRT | AUSP-ATWRT | copy |  |
| `ZEMX_I_CharcValue` | `CharcFromNumericValue` | AUSP-ATFLV | AUSP-ATFLV | convert: `float_si_to_unit` |  |
| `ZEMX_I_CharcValue` | `CharcToNumericValue` | AUSP-ATFLB | AUSP-ATFLB | convert: `float_si_to_unit` |  |
| `ZEMX_I_CharcValue` | `CharcValueDependency` | AUSP-ATCOD | AUSP-ATCOD | copy |  |
| `ZEMX_I_CharcValue` | `IsMarkedForDeletion` | AUSP-LKENZ | - | scope filter |  |

## Value maps and key maps

Templates: `docs/mapping/templates/` (columns `source,target,comment`). An empty map means "same value on S/4HANA".

- key map `equipment`
- key map `functional_location`

## Reconciliation

- Counts: `ZEMX_R_ClassAssgmtCount` (ECC) vs `-` (S/4HANA) per `ClassType`, `Class`

```bash
python3 tools/mig_reconcile.py counts --module classification --source ecc_counts.csv --target s4_counts.csv --maps <folder>
```

## Open gaps

None known.
