// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Equipment to migrate (not flagged for deletion) with all codes and keys translated through the migration map.
// Example: The load program creates the equipment (superordinate equipment first) and installs it at FunctionalLocation.
@AbapCatalog.sqlViewName: 'ZEMX_CEQ'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Equipment (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_EquipmentMig
  as select from ZEMX_I_Equipment as src
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'EQUIPMENT' and map01.SourceValue = src.Equipment
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'EQUIPMENT_CATEGORY' and map02.SourceValue = src.EquipmentCategory
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'TECHNICAL_OBJECT_TYPE' and map03.SourceValue = src.TechnicalObjectType
    left outer join ZEMX_I_MigrationMap as map04 on map04.MapName = 'AUTHORIZATION_GROUP' and map04.SourceValue = src.AuthorizationGroup
    left outer join ZEMX_I_MigrationMap as map05 on map05.MapName = 'PLANT' and map05.SourceValue = src.MaintenancePlanningPlant
    left outer join ZEMX_I_MigrationMap as map06 on map06.MapName = 'PLANNER_GROUP' and map06.SourceValue = src.MaintenancePlannerGroup
    left outer join ZEMX_I_MigrationMap as map07 on map07.MapName = 'WORK_CENTER' and map07.SourceValue = src.MainWorkCenter
    left outer join ZEMX_I_MigrationMap as map08 on map08.MapName = 'PLANT' and map08.SourceValue = src.MainWorkCenterPlant
    left outer join ZEMX_I_MigrationMap as map09 on map09.MapName = 'FUNCTIONAL_LOCATION' and map09.SourceValue = src.FunctionalLocation
    left outer join ZEMX_I_MigrationMap as map10 on map10.MapName = 'EQUIPMENT' and map10.SourceValue = src.SuperordinateEquipment
    left outer join ZEMX_I_MigrationMap as map11 on map11.MapName = 'PLANT' and map11.SourceValue = src.MaintenancePlant
    left outer join ZEMX_I_MigrationMap as map12 on map12.MapName = 'PLANT_SECTION' and map12.SourceValue = src.PlantSection
    left outer join ZEMX_I_MigrationMap as map13 on map13.MapName = 'LOCATION' and map13.SourceValue = src.AssetLocation
    left outer join ZEMX_I_MigrationMap as map14 on map14.MapName = 'COMPANY_CODE' and map14.SourceValue = src.CompanyCode
    left outer join ZEMX_I_MigrationMap as map15 on map15.MapName = 'BUSINESS_AREA' and map15.SourceValue = src.BusinessArea
    left outer join ZEMX_I_MigrationMap as map16 on map16.MapName = 'CONTROLLING_AREA' and map16.SourceValue = src.ControllingArea
    left outer join ZEMX_I_MigrationMap as map17 on map17.MapName = 'COST_CENTER' and map17.SourceValue = src.CostCenter
    left outer join ZEMX_I_MigrationMap as map18 on map18.MapName = 'FIXED_ASSET' and map18.SourceValue = src.MasterFixedAsset
    left outer join ZEMX_I_MigrationMap as map19 on map19.MapName = 'FIXED_ASSET' and map19.SourceValue = src.FixedAsset
    left outer join ZEMX_I_MigrationMap as map20 on map20.MapName = 'MATERIAL' and map20.SourceValue = src.Material
{
  key src.Equipment                  as LegacyEquipment,
      coalesce( map01.TargetValue, src.Equipment ) as Equipment,
      coalesce( map02.TargetValue, src.EquipmentCategory ) as EquipmentCategory,
      coalesce( map03.TargetValue, src.TechnicalObjectType ) as TechnicalObjectType,
      coalesce( map04.TargetValue, src.AuthorizationGroup ) as AuthorizationGroup,
      src.ValidityStartDate          as ValidityStartDate,
      coalesce( map05.TargetValue, src.MaintenancePlanningPlant ) as MaintenancePlanningPlant,
      coalesce( map06.TargetValue, src.MaintenancePlannerGroup ) as MaintenancePlannerGroup,
      coalesce( map07.TargetValue, src.MainWorkCenter ) as MainWorkCenter,
      coalesce( map08.TargetValue, src.MainWorkCenterPlant ) as MainWorkCenterPlant,
      coalesce( map09.TargetValue, src.FunctionalLocation ) as FunctionalLocation,
      coalesce( map10.TargetValue, src.SuperordinateEquipment ) as SuperordinateEquipment,
      src.EquipInstallationPositionNmbr as EquipInstallationPositionNmbr,
      src.TechnicalIdentificationNumber as TechnicalIdentificationNumber,
      coalesce( map11.TargetValue, src.MaintenancePlant ) as MaintenancePlant,
      coalesce( map12.TargetValue, src.PlantSection ) as PlantSection,
      coalesce( map13.TargetValue, src.AssetLocation ) as AssetLocation,
      src.AssetRoom                  as AssetRoom,
      src.ABCIndicator               as ABCIndicator,
      src.SortField                  as SortField,
      coalesce( map14.TargetValue, src.CompanyCode ) as CompanyCode,
      coalesce( map15.TargetValue, src.BusinessArea ) as BusinessArea,
      coalesce( map16.TargetValue, src.ControllingArea ) as ControllingArea,
      coalesce( map17.TargetValue, src.CostCenter ) as CostCenter,
      coalesce( map18.TargetValue, src.MasterFixedAsset ) as MasterFixedAsset,
      coalesce( map19.TargetValue, src.FixedAsset ) as FixedAsset,
      src.StandingOrder              as StandingOrder,
      coalesce( map20.TargetValue, src.Material ) as Material,
      src.SerialNumber               as SerialNumber,
      src.AssetManufacturerName      as AssetManufacturerName,
      src.ManufacturerCountry        as ManufacturerCountry,
      src.ManufacturerModelNumber    as ManufacturerModelNumber,
      src.ManufacturerPartNmbr       as ManufacturerPartNmbr,
      src.ManufacturerSerialNumber   as ManufacturerSerialNumber,
      src.ConstructionYear           as ConstructionYear,
      src.ConstructionMonth          as ConstructionMonth,
      src.InventoryNumber            as InventoryNumber,
      src.OperationStartDate         as OperationStartDate,
      src.EquipmentSizeDimension     as EquipmentSizeDimension,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      src.GrossWeight                as GrossWeight,
      @Semantics.unitOfMeasure: true
      src.WeightUnit                 as WeightUnit,
      src.AcquisitionDate            as AcquisitionDate,
      @Semantics.amount.currencyCode: 'Currency'
      src.AcquisitionValue           as AcquisitionValue,
      @Semantics.currencyCode: true
      src.Currency                   as Currency,
      src.LastChangeDate             as LastChangeDate
}
where src.IsMarkedForDeletion = ''
