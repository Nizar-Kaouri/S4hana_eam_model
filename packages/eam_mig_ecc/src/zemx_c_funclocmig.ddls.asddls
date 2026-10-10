// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Functional locations to migrate (not flagged for deletion) with all codes and keys translated through the migration map.
// Example: The load program creates the locations level by level (SuperiorFunctionalLocation first).
@AbapCatalog.sqlViewName: 'ZEMX_CFL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Functional location (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_FuncLocMig
  as select from ZEMX_I_FuncLoc as src
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'FUNCTIONAL_LOCATION' and map01.SourceValue = src.FunctionalLocation
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'FUNCTIONAL_LOCATION_CATEGORY' and map02.SourceValue = src.FunctionalLocationCategory
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'STRUCTURE_INDICATOR' and map03.SourceValue = src.FuncLocationStructure
    left outer join ZEMX_I_MigrationMap as map04 on map04.MapName = 'FUNCTIONAL_LOCATION' and map04.SourceValue = src.SuperiorFunctionalLocation
    left outer join ZEMX_I_MigrationMap as map05 on map05.MapName = 'TECHNICAL_OBJECT_TYPE' and map05.SourceValue = src.TechnicalObjectType
    left outer join ZEMX_I_MigrationMap as map06 on map06.MapName = 'AUTHORIZATION_GROUP' and map06.SourceValue = src.AuthorizationGroup
    left outer join ZEMX_I_MigrationMap as map07 on map07.MapName = 'PLANT' and map07.SourceValue = src.MaintenancePlanningPlant
    left outer join ZEMX_I_MigrationMap as map08 on map08.MapName = 'PLANNER_GROUP' and map08.SourceValue = src.MaintenancePlannerGroup
    left outer join ZEMX_I_MigrationMap as map09 on map09.MapName = 'MATERIAL' and map09.SourceValue = src.ConstructionType
    left outer join ZEMX_I_MigrationMap as map10 on map10.MapName = 'PLANT' and map10.SourceValue = src.MaintenancePlant
    left outer join ZEMX_I_MigrationMap as map11 on map11.MapName = 'PLANT_SECTION' and map11.SourceValue = src.PlantSection
    left outer join ZEMX_I_MigrationMap as map12 on map12.MapName = 'LOCATION' and map12.SourceValue = src.AssetLocation
    left outer join ZEMX_I_MigrationMap as map13 on map13.MapName = 'COMPANY_CODE' and map13.SourceValue = src.CompanyCode
    left outer join ZEMX_I_MigrationMap as map14 on map14.MapName = 'BUSINESS_AREA' and map14.SourceValue = src.BusinessArea
    left outer join ZEMX_I_MigrationMap as map15 on map15.MapName = 'CONTROLLING_AREA' and map15.SourceValue = src.ControllingArea
    left outer join ZEMX_I_MigrationMap as map16 on map16.MapName = 'COST_CENTER' and map16.SourceValue = src.CostCenter
    left outer join ZEMX_I_MigrationMap as map17 on map17.MapName = 'FIXED_ASSET' and map17.SourceValue = src.MasterFixedAsset
    left outer join ZEMX_I_MigrationMap as map18 on map18.MapName = 'FIXED_ASSET' and map18.SourceValue = src.FixedAsset
{
  key src.FunctionalLocation         as LegacyFunctionalLocation,
      coalesce( map01.TargetValue, src.FunctionalLocation ) as FunctionalLocation,
      coalesce( map02.TargetValue, src.FunctionalLocationCategory ) as FunctionalLocationCategory,
      coalesce( map03.TargetValue, src.FuncLocationStructure ) as FuncLocationStructure,
      coalesce( map04.TargetValue, src.SuperiorFunctionalLocation ) as SuperiorFunctionalLocation,
      coalesce( map05.TargetValue, src.TechnicalObjectType ) as TechnicalObjectType,
      coalesce( map06.TargetValue, src.AuthorizationGroup ) as AuthorizationGroup,
      coalesce( map07.TargetValue, src.MaintenancePlanningPlant ) as MaintenancePlanningPlant,
      coalesce( map08.TargetValue, src.MaintenancePlannerGroup ) as MaintenancePlannerGroup,
      src.EquipInstallationIsAllowed as EquipInstallationIsAllowed,
      src.EquipIsSingleInstallation  as EquipIsSingleInstallation,
      coalesce( map09.TargetValue, src.ConstructionType ) as ConstructionType,
      src.AssetManufacturerName      as AssetManufacturerName,
      src.ConstructionYear           as ConstructionYear,
      src.InventoryNumber            as InventoryNumber,
      src.OperationStartDate         as OperationStartDate,
      coalesce( map10.TargetValue, src.MaintenancePlant ) as MaintenancePlant,
      coalesce( map11.TargetValue, src.PlantSection ) as PlantSection,
      coalesce( map12.TargetValue, src.AssetLocation ) as AssetLocation,
      src.AssetRoom                  as AssetRoom,
      src.ABCIndicator               as ABCIndicator,
      src.SortField                  as SortField,
      coalesce( map13.TargetValue, src.CompanyCode ) as CompanyCode,
      coalesce( map14.TargetValue, src.BusinessArea ) as BusinessArea,
      coalesce( map15.TargetValue, src.ControllingArea ) as ControllingArea,
      coalesce( map16.TargetValue, src.CostCenter ) as CostCenter,
      coalesce( map17.TargetValue, src.MasterFixedAsset ) as MasterFixedAsset,
      coalesce( map18.TargetValue, src.FixedAsset ) as FixedAsset,
      src.StandingOrder              as StandingOrder,
      src.LastChangeDate             as LastChangeDate
}
where src.IsMarkedForDeletion = ''
