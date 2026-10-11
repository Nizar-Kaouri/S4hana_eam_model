# Migration interface: equipment

> Version **1.0.0**

- **Read by:** customer load program (reads the consumption views, posts on S/4HANA)
- **Load after:** `work_center`, `functional_location`
- **Business key:** `Equipment` · numbering **keep**
- **Key rule:** Keep equipment numbers (external number assignment on S/4HANA) where possible; otherwise the load program assigns and logs the new numbers.

> Compatibility note: target fields are the S/4HANA table fields, assumed unchanged from ECC for Plant Maintenance; confirm them against the posting interface (BAPI / API) the load program uses

The consumption views deliver the values **exactly as stored in ECC**. Changing values (new plants, new numbers, ...) is up to the load program.

## `ZEMX_C_EquipmentMig`

- Source: `ZEMX_I_Equipment`
- Keys: `Equipment`
- Scope: `src.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Equipment` | EQUI-EQUNR | EQUI-EQUNR | copy | yes |
| `EquipmentCategory` | EQUI-EQTYP | EQUI-EQTYP | copy | yes |
| `TechnicalObjectType` | EQUI-EQART | EQUI-EQART | copy | yes |
| `AuthorizationGroup` | EQUI-BEGRU | EQUI-BEGRU | copy |  |
| `ValidityStartDate` | EQUZ-DATAB | EQUZ-DATAB | copy |  |
| `MaintenancePlanningPlant` | EQUZ-IWERK | EQUZ-IWERK | copy | yes |
| `MaintenancePlannerGroup` | EQUZ-INGRP | EQUZ-INGRP | copy |  |
| `MainWorkCenter` | CRHD-ARBPL | CRHD-ARBPL | copy |  |
| `MainWorkCenterPlant` | CRHD-WERKS | CRHD-WERKS | copy |  |
| `FunctionalLocation` | ILOA-TPLNR | ILOA-TPLNR | copy | yes |
| `SuperordinateEquipment` | EQUZ-HEQUI | EQUZ-HEQUI | copy | yes |
| `EquipInstallationPositionNmbr` | EQUZ-HEQNR | EQUZ-HEQNR | copy |  |
| `TechnicalIdentificationNumber` | EQUZ-TIDNR | EQUZ-TIDNR | copy |  |
| `MaintenancePlant` | ILOA-SWERK | ILOA-SWERK | copy | yes |
| `PlantSection` | ILOA-BEBER | ILOA-BEBER | copy |  |
| `AssetLocation` | ILOA-STORT | ILOA-STORT | copy |  |
| `AssetRoom` | ILOA-MSGRP | ILOA-MSGRP | copy |  |
| `ABCIndicator` | ILOA-ABCKZ | ILOA-ABCKZ | copy |  |
| `SortField` | ILOA-EQFNR | ILOA-EQFNR | copy |  |
| `CompanyCode` | ILOA-BUKRS | ILOA-BUKRS | copy | yes |
| `BusinessArea` | ILOA-GSBER | ILOA-GSBER | copy |  |
| `ControllingArea` | ILOA-KOKRS | ILOA-KOKRS | copy |  |
| `CostCenter` | ILOA-KOSTL | ILOA-KOSTL | copy | yes |
| `MasterFixedAsset` | ILOA-ANLNR | ILOA-ANLNR | copy |  |
| `FixedAsset` | ILOA-ANLUN | ILOA-ANLUN | copy |  |
| `StandingOrder` | ILOA-DAUFN | - | derived: follow-up step after the order load |  |
| `Material` | EQUI-MATNR | EQUI-MATNR | copy | yes |
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

- Source: `ZEMX_B_EquipmentDesc`
- Keys: `Equipment`, `Language`
- Scope: `_Equipment.IsMarkedForDeletion = ''`

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Equipment` | EQKT-EQUNR | EQKT-EQUNR | copy |  |
| `Language` | EQKT-SPRAS | EQKT-SPRAS | copy |  |
| `EquipmentName` | EQKT-EQKTX | EQKT-EQKTX | copy |  |

## `ZEMX_C_EquipSerialStockMig`

- Source: `ZEMX_I_EquipSerialStock`
- Keys: `Equipment`
- Scope: `_Parent.IsMarkedForDeletion = ''`
- Delivery mode: **reference**
- Before posting: Reference context only; select referenced identities and implement customer-specific target posting and prerequisites.

| Element | Source (ECC) | Target (S/4HANA) | Rule | Compared |
|---|---|---|---|---|
| `Equipment` | EQBS-EQUNR | EQBS-EQUNR | copy |  |
| `StockPlant` | EQBS-B_WERK | EQBS-B_WERK | copy |  |
| `StorageLocation` | EQBS-B_LAGER | EQBS-B_LAGER | copy |  |
| `Batch` | EQBS-B_CHARGE | EQBS-B_CHARGE | copy |  |
| `SpecialStock` | EQBS-SOBKZ | EQBS-SOBKZ | copy |  |

## Not delivered

| View | Element | Source | Reason |
|---|---|---|---|
| `ZEMX_I_Equipment` | `ObjectNumber` | EQUI-OBJNR | not migrated: status object number - regenerated on S/4HANA; joins status, partners and classification |
| `ZEMX_I_Equipment` | `IsMarkedForDeletion` | derived: case eq._DeletionFlag.StatusCode when 'I0076' then 'X' else '' end from JEST-STAT | scope flag |
| `ZEMX_I_Equipment` | `CreationDate` | EQUI-ERDAT | information only |
| `ZEMX_I_Equipment` | `CreatedByUser` | EQUI-ERNAM | information only |
| `ZEMX_B_EquipmentDesc` | `HasLongText` | EQKT-KZLTX | information only |

## Reconciliation

- Counts: `ZEMX_C_EquipmentMigCount` (ECC) vs `ZEMT_I_EquipmentCount` (S/4HANA) per `MaintenancePlanningPlant`, `EquipmentCategory`
- Records and fields: `ZEMX_C_EquipmentMig` vs `ZEMT_B_EquipmentCompare` on `Equipment`; compared: `EquipmentCategory`, `TechnicalObjectType`, `MaintenancePlanningPlant`, `FunctionalLocation`, `SuperordinateEquipment`, `MaintenancePlant`, `CompanyCode`, `CostCenter`, `Material`, `SerialNumber`, `ManufacturerSerialNumber`, `ConstructionYear`, `InventoryNumber`

```bash
python3 tools/mig_reconcile.py counts --product eam_mig_ecc --module equipment --source ecc_counts.csv --target s4_counts.csv
python3 tools/mig_reconcile.py records --product eam_mig_ecc --module equipment --source ecc_extract.csv --target s4_compare.csv
```

## Open gaps

- Compatibility note: EQBS serial stock context is delivered as reference data only; stock quantities and material serial profiles belong to the customer MM migration, not EAM master posting.
- Compatibility note: material numbers must exist on S/4HANA (material master migration, MM) before equipment with a material is loaded
