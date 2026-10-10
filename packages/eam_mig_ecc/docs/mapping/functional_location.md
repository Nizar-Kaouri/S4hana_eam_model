# Migration interface: functional_location

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `work_center`
- **Business key:** `FunctionalLocation` · numbering **keep**
- **Key rule:** Functional location labels are external keys. Load superior locations before their children.

> TODO-VERIFY[M] XFL-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

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
- Scope: `obj.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `FunctionalLocation` | IFLOTX-TPLNR | IFLOTX-TPLNR | copy |  |
| `Language` | IFLOTX-SPRAS | IFLOTX-SPRAS | copy |  |
| `FunctionalLocationName` | IFLOTX-PLTXT | IFLOTX-PLTXT | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_FuncLoc` | `ObjectNumber` | IFLOT-OBJNR | not migrated: status object number - regenerated on S/4HANA; joins status and partners |
| `ZEMX_I_FuncLoc` | `IsMarkedForDeletion` | derived: case dlfl.StatusCode when 'I0076' then 'X' else '' end from JEST-STAT | scope flag |
| `ZEMX_I_FuncLoc` | `CreationDate` | IFLOT-ERDAT | information only |
| `ZEMX_I_FuncLoc` | `CreatedByUser` | IFLOT-ERNAM | information only |
| `ZEMX_I_FuncLocDesc` | `HasLongText` | IFLOTX-KZLTX | information only |

## Reconciliation

- Counts: `ZEMX_C_FuncLocMigCount` (ECC) vs `ZEMT_I_FuncLocCount` (S/4HANA) per `MaintenancePlanningPlant`, `FunctionalLocationCategory`
- Records and fields: `ZEMX_C_FuncLocMig` vs `ZEMT_I_FuncLocCompare` on `FunctionalLocation`; compared: `FunctionalLocationCategory`, `SuperiorFunctionalLocation`, `TechnicalObjectType`, `MaintenancePlanningPlant`, `MaintenancePlant`, `ABCIndicator`, `CompanyCode`, `CostCenter`

```bash
python3 tools/mig_reconcile.py counts --module functional_location --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --module functional_location --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- TODO-VERIFY[H] XFL-G01: alternative labeling (IFLOS) and structure indicator edit masks must match on S/4HANA before the load
