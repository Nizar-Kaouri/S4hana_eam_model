# Migration interface: classification

> Version **1.0.0**

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `equipment`, `functional_location`
- **Business key:** `ClassifiedObject`, `ClassType`, `Class` · numbering **derived**
- **Key rule:** Classes and characteristics are matched by name; they must exist on S/4HANA (master data / customizing transport) before the load.

> Compatibility note: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEMX_C_ClassAssignmentMig`

- Source: `ZEMX_I_ClassAssignment`
- Keys: `ClassifiedObject`, `ClassType`, `Class`
- Scope: `src.IsMarkedForDeletion = '' and ( src.ClassType = '002' or src.ClassType = '003' )`

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ClassifiedObject` | KSSK-OBJEK | KSSK-OBJEK | copy |
| `ClassType` | KSSK-KLART | KSSK-KLART | copy |
| `Class` | KLAH-CLASS | KLAH-CLASS | copy |
| `ClassificationStatus` | KSSK-STATU | KSSK-STATU | copy |

## `ZEMX_C_CharcValueMig`

- Source: `ZEMX_I_CharcValue`
- Keys: `ClassifiedObject`, `ClassType`, `Characteristic`, `CharcValuePositionNumber`
- Scope: `src.IsMarkedForDeletion = '' and ( src.ClassType = '002' or src.ClassType = '003' )`

| Element | Source (ECC) | Target (S/4HANA) | Rule |
|---|---|---|---|
| `ClassifiedObject` | AUSP-OBJEK | AUSP-OBJEK | copy |
| `ClassType` | AUSP-KLART | AUSP-KLART | copy |
| `Characteristic` | CABN-ATNAM | CABN-ATNAM | copy |
| `CharcValuePositionNumber` | AUSP-ATZHL | AUSP-ATZHL | copy |
| `CharcValue` | AUSP-ATWRT | AUSP-ATWRT | copy |
| `CharcFromNumericValue` | AUSP-ATFLV | AUSP-ATFLV | convert (load program): float_si_to_unit |
| `CharcToNumericValue` | AUSP-ATFLB | AUSP-ATFLB | convert (load program): float_si_to_unit |
| `CharcValueDependency` | AUSP-ATCOD | AUSP-ATCOD | copy |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_ClassAssignment` | `ClassInternalID` | KSSK-CLINT | not migrated: internal class number - mapped by class name |
| `ZEMX_I_ClassAssignment` | `ChangeCounter` | KSSK-ADZHL | information only |
| `ZEMX_I_ClassAssignment` | `IsMarkedForDeletion` | KSSK-LKENZ | scope flag |
| `ZEMX_I_CharcValue` | `CharcInternalID` | AUSP-ATINN | not migrated: internal characteristic number - mapped by name |
| `ZEMX_I_CharcValue` | `ChangeCounter` | AUSP-ADZHL | information only |
| `ZEMX_I_CharcValue` | `IsMarkedForDeletion` | AUSP-LKENZ | scope flag |

## Source controls

- Source count view: `ZEMX_C_ClassAssgmtMigCount`

## Open gaps

None known.
