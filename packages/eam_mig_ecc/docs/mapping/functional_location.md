# Mapping: functional_location

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Target:** SAP S/4HANA Migration Cockpit - migration object *Functional location*
- **Load after:** `work_center`
- **Business key:** `FunctionalLocation` · numbering **keep**
- **Key rule:** Functional location labels are external keys. Load superior locations before their children.
- **Scope filter:** `IsMarkedForDeletion = ''` - Locations flagged for deletion are not migrated.

> TODO-VERIFY[H] XFL-M01: Migration Cockpit object for 'Functional location' (name, approach staging tables / direct transfer) and its structure field names; targets below are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance

## Fields

| View | Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|---|
| `ZEMX_I_FuncLoc` | `FunctionalLocation` | IFLOT-TPLNR | IFLOT-TPLNR | key map: `functional_location` | yes |
| `ZEMX_I_FuncLoc` | `FunctionalLocationCategory` | IFLOT-FLTYP | IFLOT-FLTYP | value map: `functional_location_category` | yes |
| `ZEMX_I_FuncLoc` | `FuncLocationStructure` | IFLOT-TPLKZ | IFLOT-TPLKZ | value map: `structure_indicator` |  |
| `ZEMX_I_FuncLoc` | `SuperiorFunctionalLocation` | IFLOT-TPLMA | IFLOT-TPLMA | key map: `functional_location` | yes |
| `ZEMX_I_FuncLoc` | `TechnicalObjectType` | IFLOT-EQART | IFLOT-EQART | value map: `technical_object_type` | yes |
| `ZEMX_I_FuncLoc` | `AuthorizationGroup` | IFLOT-BEGRU | IFLOT-BEGRU | value map: `authorization_group` |  |
| `ZEMX_I_FuncLoc` | `MaintenancePlanningPlant` | IFLOT-IWERK | IFLOT-IWERK | value map: `plant` | yes |
| `ZEMX_I_FuncLoc` | `MaintenancePlannerGroup` | IFLOT-INGRP | IFLOT-INGRP | value map: `planner_group` |  |
| `ZEMX_I_FuncLoc` | `EquipInstallationIsAllowed` | IFLOT-IEQUI | IFLOT-IEQUI | copy |  |
| `ZEMX_I_FuncLoc` | `EquipIsSingleInstallation` | IFLOT-EINZL | IFLOT-EINZL | copy |  |
| `ZEMX_I_FuncLoc` | `ConstructionType` | IFLOT-SUBMT | IFLOT-SUBMT | convert: `material_number` |  |
| `ZEMX_I_FuncLoc` | `AssetManufacturerName` | IFLOT-HERST | IFLOT-HERST | copy |  |
| `ZEMX_I_FuncLoc` | `ConstructionYear` | IFLOT-BAUJJ | IFLOT-BAUJJ | copy |  |
| `ZEMX_I_FuncLoc` | `InventoryNumber` | IFLOT-INVNR | IFLOT-INVNR | copy |  |
| `ZEMX_I_FuncLoc` | `OperationStartDate` | IFLOT-INBDT | IFLOT-INBDT | copy |  |
| `ZEMX_I_FuncLoc` | `ObjectNumber` | IFLOT-OBJNR | - | not migrated: status object number - regenerated on S/4HANA; used to join status and partners |  |
| `ZEMX_I_FuncLoc` | `MaintenancePlant` | ILOA-SWERK | ILOA-SWERK | value map: `plant` | yes |
| `ZEMX_I_FuncLoc` | `PlantSection` | ILOA-BEBER | ILOA-BEBER | value map: `plant_section` |  |
| `ZEMX_I_FuncLoc` | `AssetLocation` | ILOA-STORT | ILOA-STORT | value map: `location` |  |
| `ZEMX_I_FuncLoc` | `AssetRoom` | ILOA-MSGRP | ILOA-MSGRP | copy |  |
| `ZEMX_I_FuncLoc` | `ABCIndicator` | ILOA-ABCKZ | ILOA-ABCKZ | copy | yes |
| `ZEMX_I_FuncLoc` | `SortField` | ILOA-EQFNR | ILOA-EQFNR | copy |  |
| `ZEMX_I_FuncLoc` | `CompanyCode` | ILOA-BUKRS | ILOA-BUKRS | value map: `company_code` | yes |
| `ZEMX_I_FuncLoc` | `BusinessArea` | ILOA-GSBER | ILOA-GSBER | value map: `business_area` |  |
| `ZEMX_I_FuncLoc` | `ControllingArea` | ILOA-KOKRS | ILOA-KOKRS | value map: `controlling_area` |  |
| `ZEMX_I_FuncLoc` | `CostCenter` | ILOA-KOSTL | ILOA-KOSTL | value map: `cost_center` | yes |
| `ZEMX_I_FuncLoc` | `MasterFixedAsset` | ILOA-ANLNR | ILOA-ANLNR | key map: `fixed_asset` |  |
| `ZEMX_I_FuncLoc` | `FixedAsset` | ILOA-ANLUN | ILOA-ANLUN | key map: `fixed_asset` |  |
| `ZEMX_I_FuncLoc` | `StandingOrder` | ILOA-DAUFN | ILOA-DAUFN | derive: follow-up step after the order load - set with the key map maintenance_order |  |
| `ZEMX_I_FuncLoc` | `IsMarkedForDeletion` | case dlfl.stat when 'I0076' then 'X' else '' end | - | scope filter |  |
| `ZEMX_I_FuncLoc` | `CreationDate` | IFLOT-ERDAT | - | information only |  |
| `ZEMX_I_FuncLoc` | `CreatedByUser` | IFLOT-ERNAM | - | information only |  |
| `ZEMX_I_FuncLoc` | `LastChangeDate` | IFLOT-AEDAT | - | information only |  |
| `ZEMX_I_FuncLocText` | `FunctionalLocation` | IFLOTX-TPLNR | IFLOTX-TPLNR | key map: `functional_location` |  |
| `ZEMX_I_FuncLocText` | `Language` | IFLOTX-SPRAS | IFLOTX-SPRAS | copy |  |
| `ZEMX_I_FuncLocText` | `FunctionalLocationName` | IFLOTX-PLTXT | IFLOTX-PLTXT | copy |  |
| `ZEMX_I_FuncLocText` | `HasLongText` | IFLOTX-KZLTX | - | information only |  |

## Value maps and key maps

Templates: `docs/mapping/templates/` (columns `source,target,comment`). An empty map means "same value on S/4HANA".

- value map `authorization_group`
- value map `business_area`
- value map `company_code`
- value map `controlling_area`
- value map `cost_center`
- value map `functional_location_category`
- value map `location`
- value map `planner_group`
- value map `plant`
- value map `plant_section`
- value map `structure_indicator`
- value map `technical_object_type`
- key map `fixed_asset` (from another migration)
- key map `functional_location`

This object's load provides the key map(s) `functional_location` (old key, new key from the load log).

## Reconciliation

- Counts: `ZEMX_R_FuncLocCount` (ECC) vs `ZEMT_R_FuncLocCount` (S/4HANA) per `MaintenancePlanningPlant` (value map `plant`), `FunctionalLocationCategory` (value map `functional_location_category`)
- Records and fields: `ZEMX_I_FuncLoc` vs `ZEMT_I_FuncLocCompare` on `FunctionalLocation` (key map `functional_location`); compared fields: `FunctionalLocationCategory`, `SuperiorFunctionalLocation`, `TechnicalObjectType`, `MaintenancePlanningPlant`, `MaintenancePlant`, `ABCIndicator`, `CompanyCode`, `CostCenter`

```bash
python3 tools/mig_reconcile.py counts --module functional_location --source ecc_counts.csv --target s4_counts.csv --maps <folder>
python3 tools/mig_reconcile.py records --module functional_location --source ecc_extract.csv --target s4_compare.csv --maps <folder>
```

## Open gaps

- TODO-VERIFY[H] XFL-G01: alternative labeling (IFLOS) and structure indicator edit masks must match on S/4HANA before the load
- TODO-VERIFY[M] XFL-G02: classification, status and partners come from the generic modules classification, object_status and object_partner
