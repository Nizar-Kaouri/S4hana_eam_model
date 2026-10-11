// ModuPorter EAM migration | Release 1.0.0
// Purpose: Functional locations to migrate (not flagged for deletion) with all fields as stored in ECC.
// Example: The load program creates the locations level by level (SuperiorFunctionalLocation first).
@AbapCatalog.sqlViewName: 'ZEMX_CFL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Functional location (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_FuncLocMig
  as select from ZEMX_I_FuncLoc as src
{
      @EndUserText.label: 'Functional Location'
  key src.FunctionalLocation         as FunctionalLocation,
      @EndUserText.label: 'Functional Location Category'
      src.FunctionalLocationCategory as FunctionalLocationCategory,
      @EndUserText.label: 'Func Location Structure'
      src.FuncLocationStructure      as FuncLocationStructure,
      @EndUserText.label: 'Superior Functional Location'
      src.SuperiorFunctionalLocation as SuperiorFunctionalLocation,
      @EndUserText.label: 'Technical Object Type'
      src.TechnicalObjectType        as TechnicalObjectType,
      @EndUserText.label: 'Authorization Group'
      src.AuthorizationGroup         as AuthorizationGroup,
      @EndUserText.label: 'Maintenance Planning Plant'
      src.MaintenancePlanningPlant   as MaintenancePlanningPlant,
      @EndUserText.label: 'Maintenance Planner Group'
      src.MaintenancePlannerGroup    as MaintenancePlannerGroup,
      @EndUserText.label: 'Equip Installation Is Allowed'
      src.EquipInstallationIsAllowed as EquipInstallationIsAllowed,
      @EndUserText.label: 'Equip Is Single Installation'
      src.EquipIsSingleInstallation  as EquipIsSingleInstallation,
      @EndUserText.label: 'Construction Type'
      src.ConstructionType           as ConstructionType,
      @EndUserText.label: 'Asset Manufacturer Name'
      src.AssetManufacturerName      as AssetManufacturerName,
      @EndUserText.label: 'Construction Year'
      src.ConstructionYear           as ConstructionYear,
      @EndUserText.label: 'Inventory Number'
      src.InventoryNumber            as InventoryNumber,
      @EndUserText.label: 'Operation Start Date'
      src.OperationStartDate         as OperationStartDate,
      @EndUserText.label: 'Maintenance Plant'
      src.MaintenancePlant           as MaintenancePlant,
      @EndUserText.label: 'Plant Section'
      src.PlantSection               as PlantSection,
      @EndUserText.label: 'Asset Location'
      src.AssetLocation              as AssetLocation,
      @EndUserText.label: 'Asset Room'
      src.AssetRoom                  as AssetRoom,
      @EndUserText.label: 'ABCIndicator'
      src.ABCIndicator               as ABCIndicator,
      @EndUserText.label: 'Sort Field'
      src.SortField                  as SortField,
      @EndUserText.label: 'Company Code'
      src.CompanyCode                as CompanyCode,
      @EndUserText.label: 'Business Area'
      src.BusinessArea               as BusinessArea,
      @EndUserText.label: 'Controlling Area'
      src.ControllingArea            as ControllingArea,
      @EndUserText.label: 'Cost Center'
      src.CostCenter                 as CostCenter,
      @EndUserText.label: 'Master Fixed Asset'
      src.MasterFixedAsset           as MasterFixedAsset,
      @EndUserText.label: 'Fixed Asset'
      src.FixedAsset                 as FixedAsset,
      @EndUserText.label: 'Standing Order'
      src.StandingOrder              as StandingOrder,
      @EndUserText.label: 'Last Change Date'
      src.LastChangeDate             as LastChangeDate,
      src.AddressNumber as AddressNumber,
      src.AddressValidTo as AddressValidTo,
      src.AddressName1 as AddressName1,
      src.AddressName2 as AddressName2,
      src.AddressName3 as AddressName3,
      src.AddressName4 as AddressName4,
      src.AddressStreet as AddressStreet,
      src.AddressHouseNumber as AddressHouseNumber,
      src.AddressHouseNumberSupplement as AddressHouseNumberSupplement,
      src.AddressCity as AddressCity,
      src.AddressDistrict as AddressDistrict,
      src.AddressPostalCode as AddressPostalCode,
      src.AddressPOBox as AddressPOBox,
      src.AddressPOBoxPostalCode as AddressPOBoxPostalCode,
      src.AddressCountry as AddressCountry,
      src.AddressRegion as AddressRegion,
      src.AddressLanguage as AddressLanguage,
      src.HasStandardAddress as HasStandardAddress
}
where src.IsMarkedForDeletion = ''
