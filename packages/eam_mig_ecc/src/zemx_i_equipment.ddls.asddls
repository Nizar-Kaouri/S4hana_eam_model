// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Equipment in its current time segment with installation location, superordinate equipment, main work center (business key), location / account assignment, manufacturer data and deletion flag: the complete business object.
// Example: Read the equipment of plant 1000 in installation order: filter MaintenancePlanningPlant = '1000'.
// Earlier time segments (installation history) are not migrated.
// TODO-VERIFY[H] XEQ-001: the current time segment of EQUZ has DATBI = '99991231'
@AbapCatalog.sqlViewName: 'ZEMX_EQ'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Equipment'
@ObjectModel.representativeKey: 'Equipment'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_Equipment
  as select from ZEMX_I_EquipmentHeader as eq
    inner join ZEMX_I_EquipmentTimeSegment as seg on seg.Equipment = eq.Equipment
{
  key eq.Equipment                   as Equipment,
      eq.EquipmentCategory           as EquipmentCategory,
      eq.TechnicalObjectType         as TechnicalObjectType,
      eq.AuthorizationGroup          as AuthorizationGroup,
      seg.ValidityStartDate          as ValidityStartDate,
      seg.MaintenancePlanningPlant   as MaintenancePlanningPlant,
      seg.MaintenancePlannerGroup    as MaintenancePlannerGroup,
      seg._MainWorkCenter.WorkCenter as MainWorkCenter,
      seg._MainWorkCenter.Plant      as MainWorkCenterPlant,
      seg._LocAcctAssignment.FunctionalLocation as FunctionalLocation,
      seg.SuperordinateEquipment     as SuperordinateEquipment,
      seg.EquipInstallationPositionNmbr as EquipInstallationPositionNmbr,
      seg.TechnicalIdentificationNumber as TechnicalIdentificationNumber,
      seg._LocAcctAssignment.MaintenancePlant as MaintenancePlant,
      seg._LocAcctAssignment.PlantSection as PlantSection,
      seg._LocAcctAssignment.AssetLocation as AssetLocation,
      seg._LocAcctAssignment.AssetRoom as AssetRoom,
      seg._LocAcctAssignment.ABCIndicator as ABCIndicator,
      seg._LocAcctAssignment.SortField as SortField,
      seg._LocAcctAssignment.CompanyCode as CompanyCode,
      seg._LocAcctAssignment.BusinessArea as BusinessArea,
      seg._LocAcctAssignment.ControllingArea as ControllingArea,
      seg._LocAcctAssignment.CostCenter as CostCenter,
      seg._LocAcctAssignment.MasterFixedAsset as MasterFixedAsset,
      seg._LocAcctAssignment.FixedAsset as FixedAsset,
      seg._LocAcctAssignment.StandingOrder as StandingOrder,
      eq.Material                    as Material,
      eq.SerialNumber                as SerialNumber,
      eq.AssetManufacturerName       as AssetManufacturerName,
      eq.ManufacturerCountry         as ManufacturerCountry,
      eq.ManufacturerModelNumber     as ManufacturerModelNumber,
      eq.ManufacturerPartNmbr        as ManufacturerPartNmbr,
      eq.ManufacturerSerialNumber    as ManufacturerSerialNumber,
      eq.ConstructionYear            as ConstructionYear,
      eq.ConstructionMonth           as ConstructionMonth,
      eq.InventoryNumber             as InventoryNumber,
      eq.OperationStartDate          as OperationStartDate,
      eq.EquipmentSizeDimension      as EquipmentSizeDimension,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      eq.GrossWeight                 as GrossWeight,
      @Semantics.unitOfMeasure: true
      eq.WeightUnit                  as WeightUnit,
      eq.AcquisitionDate             as AcquisitionDate,
      @Semantics.amount.currencyCode: 'Currency'
      eq.AcquisitionValue            as AcquisitionValue,
      @Semantics.currencyCode: true
      eq.Currency                    as Currency,
      eq.ObjectNumber                as ObjectNumber,
      case eq._DeletionFlag.StatusCode when 'I0076' then 'X' else '' end as IsMarkedForDeletion,
      eq.CreationDate                as CreationDate,
      eq.CreatedByUser               as CreatedByUser,
      eq.LastChangeDate              as LastChangeDate
}
where seg.ValidityEndDate = '99991231'
