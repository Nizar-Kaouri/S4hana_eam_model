// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Functional locations to migrate (not flagged for deletion) with all fields as stored in ECC.
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
{
  key src.FunctionalLocation         as FunctionalLocation,
      src.FunctionalLocationCategory as FunctionalLocationCategory,
      src.FuncLocationStructure      as FuncLocationStructure,
      src.SuperiorFunctionalLocation as SuperiorFunctionalLocation,
      src.TechnicalObjectType        as TechnicalObjectType,
      src.AuthorizationGroup         as AuthorizationGroup,
      src.MaintenancePlanningPlant   as MaintenancePlanningPlant,
      src.MaintenancePlannerGroup    as MaintenancePlannerGroup,
      src.EquipInstallationIsAllowed as EquipInstallationIsAllowed,
      src.EquipIsSingleInstallation  as EquipIsSingleInstallation,
      src.ConstructionType           as ConstructionType,
      src.AssetManufacturerName      as AssetManufacturerName,
      src.ConstructionYear           as ConstructionYear,
      src.InventoryNumber            as InventoryNumber,
      src.OperationStartDate         as OperationStartDate,
      src.MaintenancePlant           as MaintenancePlant,
      src.PlantSection               as PlantSection,
      src.AssetLocation              as AssetLocation,
      src.AssetRoom                  as AssetRoom,
      src.ABCIndicator               as ABCIndicator,
      src.SortField                  as SortField,
      src.CompanyCode                as CompanyCode,
      src.BusinessArea               as BusinessArea,
      src.ControllingArea            as ControllingArea,
      src.CostCenter                 as CostCenter,
      src.MasterFixedAsset           as MasterFixedAsset,
      src.FixedAsset                 as FixedAsset,
      src.StandingOrder              as StandingOrder,
      src.LastChangeDate             as LastChangeDate
}
where src.IsMarkedForDeletion = ''
