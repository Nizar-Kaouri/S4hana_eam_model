# Migration interface: functional_location

> Version **1.0.0**

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `work_center`
- **Business key:** `FunctionalLocation` · numbering **keep**
- **Key rule:** Functional location labels are external keys. Load superior locations before their children.

> Compatibility note: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEMX_C_FuncLocMig`

- Source: `ZEMX_I_FuncLoc`
- Keys: `FunctionalLocation`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `FunctionalLocation` | IFLOT-TPLNR | IFLOT-TPLNR | copy | yes |
| `FunctionalLocationCategory` | IFLOT-FLTYP | IFLOT-FLTYP | copy | yes |
| `FuncLocationStructure` | IFLOT-TPLKZ | IFLOT-TPLKZ | copy |  |
| `SuperiorFunctionalLocation` | IFLOT-TPLMA | IFLOT-TPLMA | copy | yes |
| `TechnicalObjectType` | IFLOT-EQART | IFLOT-EQART | copy | yes |
| `AuthorizationGroup` | IFLOT-BEGRU | IFLOT-BEGRU | copy |  |
| `MaintenancePlanningPlant` | IFLOT-IWERK | IFLOT-IWERK | copy | yes |
| `MaintenancePlannerGroup` | IFLOT-INGRP | IFLOT-INGRP | copy |  |
| `EquipInstallationIsAllowed` | IFLOT-IEQUI | IFLOT-IEQUI | copy |  |
| `EquipIsSingleInstallation` | IFLOT-EINZL | IFLOT-EINZL | copy |  |
| `ConstructionType` | IFLOT-SUBMT | IFLOT-SUBMT | copy |  |
| `AssetManufacturerName` | IFLOT-HERST | IFLOT-HERST | copy |  |
| `ConstructionYear` | IFLOT-BAUJJ | IFLOT-BAUJJ | copy |  |
| `InventoryNumber` | IFLOT-INVNR | IFLOT-INVNR | copy |  |
| `OperationStartDate` | IFLOT-INBDT | IFLOT-INBDT | copy |  |
| `MaintenancePlant` | ILOA-SWERK | ILOA-SWERK | copy | yes |
| `PlantSection` | ILOA-BEBER | ILOA-BEBER | copy |  |
| `AssetLocation` | ILOA-STORT | ILOA-STORT | copy |  |
| `AssetRoom` | ILOA-MSGRP | ILOA-MSGRP | copy |  |
| `ABCIndicator` | ILOA-ABCKZ | ILOA-ABCKZ | copy | yes |
| `SortField` | ILOA-EQFNR | ILOA-EQFNR | copy |  |
| `CompanyCode` | ILOA-BUKRS | ILOA-BUKRS | copy | yes |
| `BusinessArea` | ILOA-GSBER | ILOA-GSBER | copy |  |
| `ControllingArea` | ILOA-KOKRS | ILOA-KOKRS | copy |  |
| `CostCenter` | ILOA-KOSTL | ILOA-KOSTL | copy | yes |
| `MasterFixedAsset` | ILOA-ANLNR | ILOA-ANLNR | copy |  |
| `FixedAsset` | ILOA-ANLUN | ILOA-ANLUN | copy |  |
| `StandingOrder` | ILOA-DAUFN | - | derived: follow-up step after the order load |  |
| `LastChangeDate` | IFLOT-AEDAT | - | information only |  |

## `ZEMX_C_FuncLocTextMig`

- Source: `ZEMX_I_FuncLocDesc`
- Keys: `FunctionalLocation`, `Language`
- Scope: `_FuncLoc.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `FunctionalLocation` | IFLOTX-TPLNR | IFLOTX-TPLNR | copy |  |
| `Language` | IFLOTX-SPRAS | IFLOTX-SPRAS | copy |  |
| `FunctionalLocationName` | IFLOTX-PLTXT | IFLOTX-PLTXT | copy |  |

## `ZEMX_C_FuncLocLabelMig`

- Source: `ZEMX_I_FuncLocLabel`
- Keys: `FunctionalLocation`, `LabelingSystem`
- Scope: `_Parent.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `FunctionalLocation` | IFLOS-TPLNR | IFLOS-TPLNR | copy |  |
| `LabelingSystem` | IFLOS-ALTNR | IFLOS-ALTNR | copy |  |
| `AlternativeLabel` | IFLOS-STRNO | IFLOS-STRNO | copy |  |
| `IsActiveLabel` | IFLOS-ACTVS | IFLOS-ACTVS | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_FuncLoc` | `ObjectNumber` | IFLOT-OBJNR | not migrated: status object number - regenerated on S/4HANA; joins status and partners |
| `ZEMX_I_FuncLoc` | `IsMarkedForDeletion` | derived: case fl._DeletionFlag.StatusCode when 'I0076' then 'X' else '' end from JEST-STAT | scope flag |
| `ZEMX_I_FuncLoc` | `CreationDate` | IFLOT-ERDAT | information only |
| `ZEMX_I_FuncLoc` | `CreatedByUser` | IFLOT-ERNAM | information only |
| `ZEMX_I_FuncLocDesc` | `HasLongText` | IFLOTX-KZLTX | information only |

## Reconciliation

- Counts: `ZEMX_C_FuncLocMigCount` (ECC) vs `ZEMT_I_FuncLocCount` (S/4HANA) per `MaintenancePlanningPlant`, `FunctionalLocationCategory`
- Records and fields: `ZEMX_C_FuncLocMig` vs `ZEMT_I_FuncLocCompare` on `FunctionalLocation`; compared: `FunctionalLocationCategory`, `SuperiorFunctionalLocation`, `TechnicalObjectType`, `MaintenancePlanningPlant`, `MaintenancePlant`, `ABCIndicator`, `CompanyCode`, `CostCenter`

```bash
python3 tools/mig_reconcile.py counts --product eam_mig_ecc --module functional_location --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product eam_mig_ecc --module functional_location --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Compatibility note: IFLOS labels are delivered; verify labeling-system keys and active-state interpretation and align target structure edit masks.
