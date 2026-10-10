# Migration interface: functional_location

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `work_center`
- **Business key:** `FunctionalLocation` · numbering **keep**
- **Key rule:** Functional location labels are external keys. Load superior locations before their children.

> TODO-VERIFY[M] XFL-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

Values are delivered **translated**: every field marked *value map* / *key map* is looked up in the mapping table `ZEMX_MAP` (map name in capitals); without an entry the old value is delivered. `Legacy*` key fields carry the old key of the record.

## `ZEMX_C_FuncLocMig`

- Source: `ZEMX_I_FuncLoc`
- Keys: `LegacyFunctionalLocation`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `FunctionalLocation` | IFLOT-TPLNR | IFLOT-TPLNR | key map: `FUNCTIONAL_LOCATION` | yes |
| `FunctionalLocationCategory` | IFLOT-FLTYP | IFLOT-FLTYP | value map: `FUNCTIONAL_LOCATION_CATEGORY` | yes |
| `FuncLocationStructure` | IFLOT-TPLKZ | IFLOT-TPLKZ | value map: `STRUCTURE_INDICATOR` |  |
| `SuperiorFunctionalLocation` | IFLOT-TPLMA | IFLOT-TPLMA | key map: `FUNCTIONAL_LOCATION` | yes |
| `TechnicalObjectType` | IFLOT-EQART | IFLOT-EQART | value map: `TECHNICAL_OBJECT_TYPE` | yes |
| `AuthorizationGroup` | IFLOT-BEGRU | IFLOT-BEGRU | value map: `AUTHORIZATION_GROUP` |  |
| `MaintenancePlanningPlant` | IFLOT-IWERK | IFLOT-IWERK | value map: `PLANT` | yes |
| `MaintenancePlannerGroup` | IFLOT-INGRP | IFLOT-INGRP | value map: `PLANNER_GROUP` |  |
| `EquipInstallationIsAllowed` | IFLOT-IEQUI | IFLOT-IEQUI | copy |  |
| `EquipIsSingleInstallation` | IFLOT-EINZL | IFLOT-EINZL | copy |  |
| `ConstructionType` | IFLOT-SUBMT | IFLOT-SUBMT | key map: `MATERIAL` |  |
| `AssetManufacturerName` | IFLOT-HERST | IFLOT-HERST | copy |  |
| `ConstructionYear` | IFLOT-BAUJJ | IFLOT-BAUJJ | copy |  |
| `InventoryNumber` | IFLOT-INVNR | IFLOT-INVNR | copy |  |
| `OperationStartDate` | IFLOT-INBDT | IFLOT-INBDT | copy |  |
| `MaintenancePlant` | ILOA-SWERK | ILOA-SWERK | value map: `PLANT` | yes |
| `PlantSection` | ILOA-BEBER | ILOA-BEBER | value map: `PLANT_SECTION` |  |
| `AssetLocation` | ILOA-STORT | ILOA-STORT | value map: `LOCATION` |  |
| `AssetRoom` | ILOA-MSGRP | ILOA-MSGRP | copy |  |
| `ABCIndicator` | ILOA-ABCKZ | ILOA-ABCKZ | copy | yes |
| `SortField` | ILOA-EQFNR | ILOA-EQFNR | copy |  |
| `CompanyCode` | ILOA-BUKRS | ILOA-BUKRS | value map: `COMPANY_CODE` | yes |
| `BusinessArea` | ILOA-GSBER | ILOA-GSBER | value map: `BUSINESS_AREA` |  |
| `ControllingArea` | ILOA-KOKRS | ILOA-KOKRS | value map: `CONTROLLING_AREA` |  |
| `CostCenter` | ILOA-KOSTL | ILOA-KOSTL | value map: `COST_CENTER` | yes |
| `MasterFixedAsset` | ILOA-ANLNR | ILOA-ANLNR | key map: `FIXED_ASSET` |  |
| `FixedAsset` | ILOA-ANLUN | ILOA-ANLUN | key map: `FIXED_ASSET` |  |
| `StandingOrder` | ILOA-DAUFN | - | derived: follow-up step after the order load (key map maintenance_order) |  |
| `LastChangeDate` | IFLOT-AEDAT | - | information only |  |

## `ZEMX_C_FuncLocTextMig`

- Source: `ZEMX_I_FuncLocDesc`
- Keys: `LegacyFunctionalLocation`, `Language`
- Scope: `obj.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Language` | IFLOTX-SPRAS | IFLOTX-SPRAS | copy |  |
| `FunctionalLocation` | IFLOTX-TPLNR | IFLOTX-TPLNR | key map: `FUNCTIONAL_LOCATION` |  |
| `FunctionalLocationName` | IFLOTX-PLTXT | IFLOTX-PLTXT | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_FuncLoc` | `ObjectNumber` | IFLOT-OBJNR | not migrated: status object number - regenerated on S/4HANA; joins status and partners |
| `ZEMX_I_FuncLoc` | `IsMarkedForDeletion` | derived: case dlfl.StatusCode when 'I0076' then 'X' else '' end from JEST-STAT | scope flag |
| `ZEMX_I_FuncLoc` | `CreationDate` | IFLOT-ERDAT | information only |
| `ZEMX_I_FuncLoc` | `CreatedByUser` | IFLOT-ERNAM | information only |
| `ZEMX_I_FuncLocDesc` | `HasLongText` | IFLOTX-KZLTX | information only |

## Maps

- value map `AUTHORIZATION_GROUP`
- value map `BUSINESS_AREA`
- value map `COMPANY_CODE`
- value map `CONTROLLING_AREA`
- value map `COST_CENTER`
- value map `FUNCTIONAL_LOCATION_CATEGORY`
- value map `LOCATION`
- value map `PLANNER_GROUP`
- value map `PLANT`
- value map `PLANT_SECTION`
- value map `STRUCTURE_INDICATOR`
- value map `TECHNICAL_OBJECT_TYPE`
- key map `FIXED_ASSET` (from another migration)
- key map `FUNCTIONAL_LOCATION`
- key map `MATERIAL` (from another migration)

After loading this object, the key map(s) `FUNCTIONAL_LOCATION` (old key, new key from the load log) must be written into `ZEMX_MAP` on the ECC system (by the load program via RFC or by uploading the load log) before the objects that use them are extracted.

## Reconciliation

- Counts: `ZEMX_C_FuncLocMigCount` (ECC, translated values) vs `ZEMT_I_FuncLocCount` (S/4HANA) per `MaintenancePlanningPlant`, `FunctionalLocationCategory`
- Records and fields: `ZEMX_C_FuncLocMig` vs `ZEMT_I_FuncLocCompare` on `FunctionalLocation`; compared: `FunctionalLocationCategory`, `SuperiorFunctionalLocation`, `TechnicalObjectType`, `MaintenancePlanningPlant`, `MaintenancePlant`, `ABCIndicator`, `CompanyCode`, `CostCenter`

```bash
python3 tools/mig_reconcile.py counts --module functional_location --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --module functional_location --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- TODO-VERIFY[H] XFL-G01: alternative labeling (IFLOS) and structure indicator edit masks must match on S/4HANA before the load
