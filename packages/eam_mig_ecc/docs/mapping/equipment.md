# Mapping: equipment

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Target:** SAP S/4HANA Migration Cockpit - migration object *Equipment*
- **Load after:** `work_center`, `functional_location`
- **Business key:** `Equipment` · numbering **keep**
- **Key rule:** Keep equipment numbers (external number assignment on S/4HANA) where possible; otherwise supply a key map 'equipment' (old,new).
- **Scope filter:** `IsMarkedForDeletion = ''` - Equipment flagged for deletion is not migrated.

> TODO-VERIFY[H] XEQ-M01: Migration Cockpit object for 'Equipment' (name, approach staging tables / direct transfer) and its structure field names; targets below are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance

## Fields

| View | Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|---|
| `ZEMX_I_Equipment` | `Equipment` | EQUI-EQUNR | EQUI-EQUNR | key map: `equipment` | yes |
| `ZEMX_I_Equipment` | `EquipmentCategory` | EQUI-EQTYP | EQUI-EQTYP | value map: `equipment_category` | yes |
| `ZEMX_I_Equipment` | `TechnicalObjectType` | EQUI-EQART | EQUI-EQART | value map: `technical_object_type` | yes |
| `ZEMX_I_Equipment` | `AuthorizationGroup` | EQUI-BEGRU | EQUI-BEGRU | value map: `authorization_group` |  |
| `ZEMX_I_Equipment` | `ValidityStartDate` | EQUZ-DATAB | EQUZ-DATAB | copy |  |
| `ZEMX_I_Equipment` | `MaintenancePlanningPlant` | EQUZ-IWERK | EQUZ-IWERK | value map: `plant` | yes |
| `ZEMX_I_Equipment` | `MaintenancePlannerGroup` | EQUZ-INGRP | EQUZ-INGRP | value map: `planner_group` |  |
| `ZEMX_I_Equipment` | `MainWorkCenter` | CRHD-ARBPL | EQUZ-GEWRK (via work center) | key map: `work_center` |  |
| `ZEMX_I_Equipment` | `MainWorkCenterPlant` | CRHD-WERKS | EQUZ-GEWRK (via work center) | value map: `plant` |  |
| `ZEMX_I_Equipment` | `FunctionalLocation` | ILOA-TPLNR | ILOA-TPLNR | key map: `functional_location` | yes |
| `ZEMX_I_Equipment` | `SuperordinateEquipment` | EQUZ-HEQUI | EQUZ-HEQUI | key map: `equipment` | yes |
| `ZEMX_I_Equipment` | `EquipInstallationPositionNmbr` | EQUZ-HEQNR | EQUZ-HEQNR | copy |  |
| `ZEMX_I_Equipment` | `TechnicalIdentificationNumber` | EQUZ-TIDNR | EQUZ-TIDNR | copy |  |
| `ZEMX_I_Equipment` | `MaintenancePlant` | ILOA-SWERK | ILOA-SWERK | value map: `plant` | yes |
| `ZEMX_I_Equipment` | `PlantSection` | ILOA-BEBER | ILOA-BEBER | value map: `plant_section` |  |
| `ZEMX_I_Equipment` | `AssetLocation` | ILOA-STORT | ILOA-STORT | value map: `location` |  |
| `ZEMX_I_Equipment` | `AssetRoom` | ILOA-MSGRP | ILOA-MSGRP | copy |  |
| `ZEMX_I_Equipment` | `ABCIndicator` | ILOA-ABCKZ | ILOA-ABCKZ | copy |  |
| `ZEMX_I_Equipment` | `SortField` | ILOA-EQFNR | ILOA-EQFNR | copy |  |
| `ZEMX_I_Equipment` | `CompanyCode` | ILOA-BUKRS | ILOA-BUKRS | value map: `company_code` | yes |
| `ZEMX_I_Equipment` | `BusinessArea` | ILOA-GSBER | ILOA-GSBER | value map: `business_area` |  |
| `ZEMX_I_Equipment` | `ControllingArea` | ILOA-KOKRS | ILOA-KOKRS | value map: `controlling_area` |  |
| `ZEMX_I_Equipment` | `CostCenter` | ILOA-KOSTL | ILOA-KOSTL | value map: `cost_center` | yes |
| `ZEMX_I_Equipment` | `MasterFixedAsset` | ILOA-ANLNR | ILOA-ANLNR | key map: `fixed_asset` |  |
| `ZEMX_I_Equipment` | `FixedAsset` | ILOA-ANLUN | ILOA-ANLUN | key map: `fixed_asset` |  |
| `ZEMX_I_Equipment` | `StandingOrder` | ILOA-DAUFN | ILOA-DAUFN | derive: follow-up step after the order load - set with the key map maintenance_order |  |
| `ZEMX_I_Equipment` | `Material` | EQUI-MATNR | EQUI-MATNR | convert: `material_number` | yes |
| `ZEMX_I_Equipment` | `SerialNumber` | EQUI-SERNR | EQUI-SERNR | copy | yes |
| `ZEMX_I_Equipment` | `AssetManufacturerName` | EQUI-HERST | EQUI-HERST | copy |  |
| `ZEMX_I_Equipment` | `ManufacturerCountry` | EQUI-HERLD | EQUI-HERLD | copy |  |
| `ZEMX_I_Equipment` | `ManufacturerModelNumber` | EQUI-TYPBZ | EQUI-TYPBZ | copy |  |
| `ZEMX_I_Equipment` | `ManufacturerPartNmbr` | EQUI-MAPAR | EQUI-MAPAR | copy |  |
| `ZEMX_I_Equipment` | `ManufacturerSerialNumber` | EQUI-SERGE | EQUI-SERGE | copy | yes |
| `ZEMX_I_Equipment` | `ConstructionYear` | EQUI-BAUJJ | EQUI-BAUJJ | copy | yes |
| `ZEMX_I_Equipment` | `ConstructionMonth` | EQUI-BAUMM | EQUI-BAUMM | copy |  |
| `ZEMX_I_Equipment` | `InventoryNumber` | EQUI-INVNR | EQUI-INVNR | copy | yes |
| `ZEMX_I_Equipment` | `OperationStartDate` | EQUI-INBDT | EQUI-INBDT | copy |  |
| `ZEMX_I_Equipment` | `EquipmentSizeDimension` | EQUI-GROES | EQUI-GROES | copy |  |
| `ZEMX_I_Equipment` | `GrossWeight` | EQUI-BRGEW | EQUI-BRGEW | copy |  |
| `ZEMX_I_Equipment` | `WeightUnit` | EQUI-GEWEI | EQUI-GEWEI | value map: `unit_of_measure` |  |
| `ZEMX_I_Equipment` | `AcquisitionDate` | EQUI-ANSDT | EQUI-ANSDT | copy |  |
| `ZEMX_I_Equipment` | `AcquisitionValue` | EQUI-ANSWT | EQUI-ANSWT | copy |  |
| `ZEMX_I_Equipment` | `Currency` | EQUI-WAERS | EQUI-WAERS | copy |  |
| `ZEMX_I_Equipment` | `ObjectNumber` | EQUI-OBJNR | - | not migrated: status object number - regenerated on S/4HANA; used to join status, partners and classification |  |
| `ZEMX_I_Equipment` | `IsMarkedForDeletion` | case dlfl.stat when 'I0076' then 'X' else '' end | - | scope filter |  |
| `ZEMX_I_Equipment` | `CreationDate` | EQUI-ERDAT | - | information only |  |
| `ZEMX_I_Equipment` | `CreatedByUser` | EQUI-ERNAM | - | information only |  |
| `ZEMX_I_Equipment` | `LastChangeDate` | EQUI-AEDAT | - | information only |  |
| `ZEMX_I_EquipmentText` | `Equipment` | EQKT-EQUNR | EQKT-EQUNR | key map: `equipment` |  |
| `ZEMX_I_EquipmentText` | `Language` | EQKT-SPRAS | EQKT-SPRAS | copy |  |
| `ZEMX_I_EquipmentText` | `EquipmentName` | EQKT-EQKTX | EQKT-EQKTX | copy |  |
| `ZEMX_I_EquipmentText` | `HasLongText` | EQKT-KZLTX | - | information only |  |

## Value maps and key maps

Templates: `docs/mapping/templates/` (columns `source,target,comment`). An empty map means "same value on S/4HANA".

- value map `authorization_group`
- value map `business_area`
- value map `company_code`
- value map `controlling_area`
- value map `cost_center`
- value map `equipment_category`
- value map `location`
- value map `planner_group`
- value map `plant`
- value map `plant_section`
- value map `technical_object_type`
- value map `unit_of_measure`
- key map `equipment`
- key map `fixed_asset` (from another migration)
- key map `functional_location`
- key map `work_center`

This object's load provides the key map(s) `equipment` (old key, new key from the load log).

## Reconciliation

- Counts: `ZEMX_R_EquipmentCount` (ECC) vs `ZEMT_R_EquipmentCount` (S/4HANA) per `MaintenancePlanningPlant` (value map `plant`), `EquipmentCategory` (value map `equipment_category`)
- Records and fields: `ZEMX_I_Equipment` vs `ZEMT_I_EquipmentCompare` on `Equipment` (key map `equipment`); compared fields: `EquipmentCategory`, `TechnicalObjectType`, `MaintenancePlanningPlant`, `FunctionalLocation`, `SuperordinateEquipment`, `MaintenancePlant`, `CompanyCode`, `CostCenter`, `Material`, `SerialNumber`, `ManufacturerSerialNumber`, `ConstructionYear`, `InventoryNumber`

```bash
python3 tools/mig_reconcile.py counts --module equipment --source ecc_counts.csv --target s4_counts.csv --maps <folder>
python3 tools/mig_reconcile.py records --module equipment --source ecc_extract.csv --target s4_compare.csv --maps <folder>
```

## Open gaps

- TODO-VERIFY[M] XEQ-G01: serial number stock data (EQBS) and material serial profiles are not extracted in the pilot
- TODO-VERIFY[H] XEQ-G02: Material numbers longer than 18 characters on S/4HANA: convert:material_number assumes the material master is migrated first and a material key map exists
