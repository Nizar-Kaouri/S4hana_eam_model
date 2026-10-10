// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
  key src.Equipment                  as Equipment,
      src.EquipmentCategory          as EquipmentCategory,
      src.TechnicalObjectType        as TechnicalObjectType,
      src.AuthorizationGroup         as AuthorizationGroup,
      src.ValidityStartDate          as ValidityStartDate,
      src.MaintenancePlanningPlant   as MaintenancePlanningPlant,
      src.MaintenancePlannerGroup    as MaintenancePlannerGroup,
      src.MainWorkCenter             as MainWorkCenter,
      src.MainWorkCenterPlant        as MainWorkCenterPlant,
      src.FunctionalLocation         as FunctionalLocation,
      src.SuperordinateEquipment     as SuperordinateEquipment,
      src.EquipInstallationPositionNmbr as EquipInstallationPositionNmbr,
      src.TechnicalIdentificationNumber as TechnicalIdentificationNumber,
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
      src.Material                   as Material,
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
