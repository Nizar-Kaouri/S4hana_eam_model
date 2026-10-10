# Migration interface: equipment

> Status: **draft-unverified** · tested release: none (draft, ECC 6.0 on NetWeaver 7.40 SP08 assumed). Nothing below has been run on a system.

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `work_center`, `functional_location`
- **Business key:** `Equipment` · numbering **keep**
- **Key rule:** Keep equipment numbers (external number assignment on S/4HANA) where possible; otherwise maintain the key map 'EQUIPMENT' in ZEMX_MAP.

> TODO-VERIFY[M] XEQ-M01: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

Values are delivered **translated**: every field marked *value map* / *key map* is looked up in the mapping table `ZEMX_MAP` (map name in capitals); without an entry the old value is delivered. `Legacy*` key fields carry the old key of the record.

## `ZEMX_C_EquipmentMig`

- Source: `ZEMX_I_Equipment`
- Keys: `LegacyEquipment`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Equipment` | EQUI-EQUNR | EQUI-EQUNR | key map: `EQUIPMENT` | yes |
| `EquipmentCategory` | EQUI-EQTYP | EQUI-EQTYP | value map: `EQUIPMENT_CATEGORY` | yes |
| `TechnicalObjectType` | EQUI-EQART | EQUI-EQART | value map: `TECHNICAL_OBJECT_TYPE` | yes |
| `AuthorizationGroup` | EQUI-BEGRU | EQUI-BEGRU | value map: `AUTHORIZATION_GROUP` |  |
| `ValidityStartDate` | EQUZ-DATAB | EQUZ-DATAB | copy |  |
| `MaintenancePlanningPlant` | EQUZ-IWERK | EQUZ-IWERK | value map: `PLANT` | yes |
| `MaintenancePlannerGroup` | EQUZ-INGRP | EQUZ-INGRP | value map: `PLANNER_GROUP` |  |
| `MainWorkCenter` | CRHD-ARBPL | CRHD-ARBPL | key map: `WORK_CENTER` |  |
| `MainWorkCenterPlant` | CRHD-WERKS | CRHD-WERKS | value map: `PLANT` |  |
| `FunctionalLocation` | ILOA-TPLNR | ILOA-TPLNR | key map: `FUNCTIONAL_LOCATION` | yes |
| `SuperordinateEquipment` | EQUZ-HEQUI | EQUZ-HEQUI | key map: `EQUIPMENT` | yes |
| `EquipInstallationPositionNmbr` | EQUZ-HEQNR | EQUZ-HEQNR | copy |  |
| `TechnicalIdentificationNumber` | EQUZ-TIDNR | EQUZ-TIDNR | copy |  |
| `MaintenancePlant` | ILOA-SWERK | ILOA-SWERK | value map: `PLANT` | yes |
| `PlantSection` | ILOA-BEBER | ILOA-BEBER | value map: `PLANT_SECTION` |  |
| `AssetLocation` | ILOA-STORT | ILOA-STORT | value map: `LOCATION` |  |
| `AssetRoom` | ILOA-MSGRP | ILOA-MSGRP | copy |  |
| `ABCIndicator` | ILOA-ABCKZ | ILOA-ABCKZ | copy |  |
| `SortField` | ILOA-EQFNR | ILOA-EQFNR | copy |  |
| `CompanyCode` | ILOA-BUKRS | ILOA-BUKRS | value map: `COMPANY_CODE` | yes |
| `BusinessArea` | ILOA-GSBER | ILOA-GSBER | value map: `BUSINESS_AREA` |  |
| `ControllingArea` | ILOA-KOKRS | ILOA-KOKRS | value map: `CONTROLLING_AREA` |  |
| `CostCenter` | ILOA-KOSTL | ILOA-KOSTL | value map: `COST_CENTER` | yes |
| `MasterFixedAsset` | ILOA-ANLNR | ILOA-ANLNR | key map: `FIXED_ASSET` |  |
| `FixedAsset` | ILOA-ANLUN | ILOA-ANLUN | key map: `FIXED_ASSET` |  |
| `StandingOrder` | ILOA-DAUFN | - | derived: follow-up step after the order load (key map maintenance_order) |  |
| `Material` | EQUI-MATNR | EQUI-MATNR | key map: `MATERIAL` | yes |
| `SerialNumber` | EQUI-SERNR | EQUI-SERNR | copy | yes |
| `AssetManufacturerName` | EQUI-HERST | EQUI-HERST | copy |  |
| `ManufacturerCountry` | EQUI-HERLD | EQUI-HERLD | copy |  |
| `ManufacturerModelNumber` | EQUI-TYPBZ | EQUI-TYPBZ | copy |  |
| `ManufacturerPartNmbr` | EQUI-MAPAR | EQUI-MAPAR | copy |  |
| `ManufacturerSerialNumber` | EQUI-SERGE | EQUI-SERGE | copy | yes |
| `ConstructionYear` | EQUI-BAUJJ | EQUI-BAUJJ | copy | yes |
| `ConstructionMonth` | EQUI-BAUMM | EQUI-BAUMM | copy |  |
| `InventoryNumber` | EQUI-INVNR | EQUI-INVNR | copy | yes |
| `OperationStartDate` | EQUI-INBDT | EQUI-INBDT | copy |  |
| `EquipmentSizeDimension` | EQUI-GROES | EQUI-GROES | copy |  |
| `GrossWeight` | EQUI-BRGEW | EQUI-BRGEW | copy |  |
| `WeightUnit` | EQUI-GEWEI | EQUI-GEWEI | copy: reference unit of a quantity - unit of measure customizing is transported, not mapped |  |
| `AcquisitionDate` | EQUI-ANSDT | EQUI-ANSDT | copy |  |
| `AcquisitionValue` | EQUI-ANSWT | EQUI-ANSWT | copy |  |
| `Currency` | EQUI-WAERS | EQUI-WAERS | copy |  |
| `LastChangeDate` | EQUI-AEDAT | - | information only |  |

## `ZEMX_C_EquipmentTextMig`

- Source: `ZEMX_I_EquipmentDesc`
- Keys: `LegacyEquipment`, `Language`
- Scope: `obj.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Language` | EQKT-SPRAS | EQKT-SPRAS | copy |  |
| `Equipment` | EQKT-EQUNR | EQKT-EQUNR | key map: `EQUIPMENT` |  |
| `EquipmentName` | EQKT-EQKTX | EQKT-EQKTX | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_Equipment` | `ObjectNumber` | EQUI-OBJNR | not migrated: status object number - regenerated on S/4HANA; joins status, partners and classification |
| `ZEMX_I_Equipment` | `IsMarkedForDeletion` | derived: case dlfl.StatusCode when 'I0076' then 'X' else '' end from JEST-STAT | scope flag |
| `ZEMX_I_Equipment` | `CreationDate` | EQUI-ERDAT | information only |
| `ZEMX_I_Equipment` | `CreatedByUser` | EQUI-ERNAM | information only |
| `ZEMX_I_EquipmentDesc` | `HasLongText` | EQKT-KZLTX | information only |

## Maps

- value map `AUTHORIZATION_GROUP`
- value map `BUSINESS_AREA`
- value map `COMPANY_CODE`
- value map `CONTROLLING_AREA`
- value map `COST_CENTER`
- value map `EQUIPMENT_CATEGORY`
- value map `LOCATION`
- value map `PLANNER_GROUP`
- value map `PLANT`
- value map `PLANT_SECTION`
- value map `TECHNICAL_OBJECT_TYPE`
- key map `EQUIPMENT`
- key map `FIXED_ASSET` (from another migration)
- key map `FUNCTIONAL_LOCATION`
- key map `MATERIAL` (from another migration)
- key map `WORK_CENTER`

After loading this object, the key map(s) `EQUIPMENT` (old key, new key from the load log) must be written into `ZEMX_MAP` on the ECC system (by the load program via RFC or by uploading the load log) before the objects that use them are extracted.

## Reconciliation

- Counts: `ZEMX_C_EquipmentMigCount` (ECC, translated values) vs `ZEMT_I_EquipmentCount` (S/4HANA) per `MaintenancePlanningPlant`, `EquipmentCategory`
- Records and fields: `ZEMX_C_EquipmentMig` vs `ZEMT_I_EquipmentCompare` on `Equipment`; compared: `EquipmentCategory`, `TechnicalObjectType`, `MaintenancePlanningPlant`, `FunctionalLocation`, `SuperordinateEquipment`, `MaintenancePlant`, `CompanyCode`, `CostCenter`, `Material`, `SerialNumber`, `ManufacturerSerialNumber`, `ConstructionYear`, `InventoryNumber`

```bash
python3 tools/mig_reconcile.py counts --module equipment --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --module equipment --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- TODO-VERIFY[M] XEQ-G01: serial number stock data (EQBS) and material serial profiles are not extracted in the pilot
- TODO-VERIFY[H] XEQ-G02: material numbers: the key map 'MATERIAL' comes from the material master migration (MM)
