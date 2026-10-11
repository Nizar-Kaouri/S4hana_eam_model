// ModuPorter EAM migration | Release 1.0.0
// Purpose: Equipment to migrate (not flagged for deletion) with all fields as stored in ECC.
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
{
      @EndUserText.label: 'Equipment'
  key src.Equipment                  as Equipment,
      @EndUserText.label: 'Equipment Category'
      src.EquipmentCategory          as EquipmentCategory,
      @EndUserText.label: 'Technical Object Type'
      src.TechnicalObjectType        as TechnicalObjectType,
      @EndUserText.label: 'Authorization Group'
      src.AuthorizationGroup         as AuthorizationGroup,
      @EndUserText.label: 'Validity Start Date'
      src.ValidityStartDate          as ValidityStartDate,
      @EndUserText.label: 'Maintenance Planning Plant'
      src.MaintenancePlanningPlant   as MaintenancePlanningPlant,
      @EndUserText.label: 'Maintenance Planner Group'
      src.MaintenancePlannerGroup    as MaintenancePlannerGroup,
      @EndUserText.label: 'Main Work Center'
      src.MainWorkCenter             as MainWorkCenter,
      @EndUserText.label: 'Main Work Center Plant'
      src.MainWorkCenterPlant        as MainWorkCenterPlant,
      @EndUserText.label: 'Functional Location'
      src.FunctionalLocation         as FunctionalLocation,
      @EndUserText.label: 'Superordinate Equipment'
      src.SuperordinateEquipment     as SuperordinateEquipment,
      @EndUserText.label: 'Equip Installation Position Nmbr'
      src.EquipInstallationPositionNmbr as EquipInstallationPositionNmbr,
      @EndUserText.label: 'Technical Identification Number'
      src.TechnicalIdentificationNumber as TechnicalIdentificationNumber,
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
      @EndUserText.label: 'Material'
      src.Material                   as Material,
      @EndUserText.label: 'Serial Number'
      src.SerialNumber               as SerialNumber,
      @EndUserText.label: 'Asset Manufacturer Name'
      src.AssetManufacturerName      as AssetManufacturerName,
      @EndUserText.label: 'Manufacturer Country'
      src.ManufacturerCountry        as ManufacturerCountry,
      @EndUserText.label: 'Manufacturer Model Number'
      src.ManufacturerModelNumber    as ManufacturerModelNumber,
      @EndUserText.label: 'Manufacturer Part Nmbr'
      src.ManufacturerPartNmbr       as ManufacturerPartNmbr,
      @EndUserText.label: 'Manufacturer Serial Number'
      src.ManufacturerSerialNumber   as ManufacturerSerialNumber,
      @EndUserText.label: 'Construction Year'
      src.ConstructionYear           as ConstructionYear,
      @EndUserText.label: 'Construction Month'
      src.ConstructionMonth          as ConstructionMonth,
      @EndUserText.label: 'Inventory Number'
      src.InventoryNumber            as InventoryNumber,
      @EndUserText.label: 'Operation Start Date'
      src.OperationStartDate         as OperationStartDate,
      @EndUserText.label: 'Equipment Size Dimension'
      src.EquipmentSizeDimension     as EquipmentSizeDimension,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      @EndUserText.label: 'Gross Weight'
      src.GrossWeight                as GrossWeight,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Weight Unit'
      src.WeightUnit                 as WeightUnit,
      @EndUserText.label: 'Acquisition Date'
      src.AcquisitionDate            as AcquisitionDate,
      @Semantics.amount.currencyCode: 'Currency'
      @EndUserText.label: 'Acquisition Value'
      src.AcquisitionValue           as AcquisitionValue,
      @Semantics.currencyCode: true
      @EndUserText.label: 'Currency'
      src.Currency                   as Currency,
      @EndUserText.label: 'Last Change Date'
      src.LastChangeDate             as LastChangeDate
}
where src.IsMarkedForDeletion = ''
