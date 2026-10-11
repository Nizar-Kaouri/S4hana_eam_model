// ModuPorter EAM migration | Release 1.0.0
// Purpose: Equipment in its current time segment with installation location, superordinate equipment, main work center (business key), location / account assignment, manufacturer data and deletion flag: the equipment master record; repeating child data is exported separately.
// Example: Read the equipment of plant 1000 in installation order: filter MaintenancePlanningPlant = '1000'.
// Earlier time segments (installation history) are not migrated.
// Compatibility note: the current time segment of EQUZ has DATBI = '99991231'
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
  as select from ZEMX_B_EquipmentHeader as eq
    inner join ZEMX_B_EquipmentTimeSegment as seg on seg.Equipment = eq.Equipment
  association [0..1] to ZEMX_B_Address as _Address on $projection.AddressNumber = _Address.AddressNumber
    and _Address.AddressValidFrom = '00010101' and _Address.AddressVersion = ''
{
      @EndUserText.label: 'Equipment'
  key eq.Equipment                   as Equipment,
      @EndUserText.label: 'Equipment Category'
      eq.EquipmentCategory           as EquipmentCategory,
      @EndUserText.label: 'Technical Object Type'
      eq.TechnicalObjectType         as TechnicalObjectType,
      @EndUserText.label: 'Authorization Group'
      eq.AuthorizationGroup          as AuthorizationGroup,
      @EndUserText.label: 'Validity Start Date'
      seg.ValidityStartDate          as ValidityStartDate,
      @EndUserText.label: 'Maintenance Planning Plant'
      seg.MaintenancePlanningPlant   as MaintenancePlanningPlant,
      @EndUserText.label: 'Maintenance Planner Group'
      seg.MaintenancePlannerGroup    as MaintenancePlannerGroup,
      @EndUserText.label: 'Main Work Center'
      seg._MainWorkCenter.WorkCenter as MainWorkCenter,
      @EndUserText.label: 'Main Work Center Plant'
      seg._MainWorkCenter.Plant      as MainWorkCenterPlant,
      @EndUserText.label: 'Functional Location'
      seg._LocAcctAssignment.FunctionalLocation as FunctionalLocation,
      @EndUserText.label: 'Superordinate Equipment'
      seg.SuperordinateEquipment     as SuperordinateEquipment,
      @EndUserText.label: 'Equip Installation Position Nmbr'
      seg.EquipInstallationPositionNmbr as EquipInstallationPositionNmbr,
      @EndUserText.label: 'Technical Identification Number'
      seg.TechnicalIdentificationNumber as TechnicalIdentificationNumber,
      @EndUserText.label: 'Maintenance Plant'
      seg._LocAcctAssignment.MaintenancePlant as MaintenancePlant,
      @EndUserText.label: 'Plant Section'
      seg._LocAcctAssignment.PlantSection as PlantSection,
      @EndUserText.label: 'Asset Location'
      seg._LocAcctAssignment.AssetLocation as AssetLocation,
      @EndUserText.label: 'Asset Room'
      seg._LocAcctAssignment.AssetRoom as AssetRoom,
      @EndUserText.label: 'ABCIndicator'
      seg._LocAcctAssignment.ABCIndicator as ABCIndicator,
      @EndUserText.label: 'Sort Field'
      seg._LocAcctAssignment.SortField as SortField,
      @EndUserText.label: 'Company Code'
      seg._LocAcctAssignment.CompanyCode as CompanyCode,
      @EndUserText.label: 'Business Area'
      seg._LocAcctAssignment.BusinessArea as BusinessArea,
      @EndUserText.label: 'Controlling Area'
      seg._LocAcctAssignment.ControllingArea as ControllingArea,
      @EndUserText.label: 'Cost Center'
      seg._LocAcctAssignment.CostCenter as CostCenter,
      @EndUserText.label: 'Master Fixed Asset'
      seg._LocAcctAssignment.MasterFixedAsset as MasterFixedAsset,
      @EndUserText.label: 'Fixed Asset'
      seg._LocAcctAssignment.FixedAsset as FixedAsset,
      @EndUserText.label: 'Standing Order'
      seg._LocAcctAssignment.StandingOrder as StandingOrder,
      @EndUserText.label: 'Address Number'
      seg._LocAcctAssignment.AddressNumber as AddressNumber,
      @EndUserText.label: 'Address Valid To'
      _Address.AddressValidTo as AddressValidTo,
      @EndUserText.label: 'Address Name1'
      _Address.AddressName1 as AddressName1,
      @EndUserText.label: 'Address Name2'
      _Address.AddressName2 as AddressName2,
      @EndUserText.label: 'Address Name3'
      _Address.AddressName3 as AddressName3,
      @EndUserText.label: 'Address Name4'
      _Address.AddressName4 as AddressName4,
      @EndUserText.label: 'Address Street'
      _Address.AddressStreet as AddressStreet,
      @EndUserText.label: 'Address House Number'
      _Address.AddressHouseNumber as AddressHouseNumber,
      @EndUserText.label: 'Address House Number Supplement'
      _Address.AddressHouseNumberSupplement as AddressHouseNumberSupplement,
      @EndUserText.label: 'Address City'
      _Address.AddressCity as AddressCity,
      @EndUserText.label: 'Address District'
      _Address.AddressDistrict as AddressDistrict,
      @EndUserText.label: 'Address Postal Code'
      _Address.AddressPostalCode as AddressPostalCode,
      @EndUserText.label: 'Address POBox'
      _Address.AddressPOBox as AddressPOBox,
      @EndUserText.label: 'Address POBox Postal Code'
      _Address.AddressPOBoxPostalCode as AddressPOBoxPostalCode,
      @EndUserText.label: 'Address Country'
      _Address.AddressCountry as AddressCountry,
      @EndUserText.label: 'Address Region'
      _Address.AddressRegion as AddressRegion,
      @Semantics.language: true
      @EndUserText.label: 'Address Language'
      _Address.AddressLanguage as AddressLanguage,
      @EndUserText.label: 'Has Standard Address'
      case when _Address.AddressNumber is not null then 'X' else '' end as HasStandardAddress,
      @EndUserText.label: 'Material'
      eq.Material                    as Material,
      @EndUserText.label: 'Serial Number'
      eq.SerialNumber                as SerialNumber,
      @EndUserText.label: 'Asset Manufacturer Name'
      eq.AssetManufacturerName       as AssetManufacturerName,
      @EndUserText.label: 'Manufacturer Country'
      eq.ManufacturerCountry         as ManufacturerCountry,
      @EndUserText.label: 'Manufacturer Model Number'
      eq.ManufacturerModelNumber     as ManufacturerModelNumber,
      @EndUserText.label: 'Manufacturer Part Nmbr'
      eq.ManufacturerPartNmbr        as ManufacturerPartNmbr,
      @EndUserText.label: 'Manufacturer Serial Number'
      eq.ManufacturerSerialNumber    as ManufacturerSerialNumber,
      @EndUserText.label: 'Construction Year'
      eq.ConstructionYear            as ConstructionYear,
      @EndUserText.label: 'Construction Month'
      eq.ConstructionMonth           as ConstructionMonth,
      @EndUserText.label: 'Inventory Number'
      eq.InventoryNumber             as InventoryNumber,
      @EndUserText.label: 'Operation Start Date'
      eq.OperationStartDate          as OperationStartDate,
      @EndUserText.label: 'Equipment Size Dimension'
      eq.EquipmentSizeDimension      as EquipmentSizeDimension,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      @EndUserText.label: 'Gross Weight'
      eq.GrossWeight                 as GrossWeight,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Weight Unit'
      eq.WeightUnit                  as WeightUnit,
      @EndUserText.label: 'Acquisition Date'
      eq.AcquisitionDate             as AcquisitionDate,
      @Semantics.amount.currencyCode: 'Currency'
      @EndUserText.label: 'Acquisition Value'
      eq.AcquisitionValue            as AcquisitionValue,
      @Semantics.currencyCode: true
      @EndUserText.label: 'Currency'
      eq.Currency                    as Currency,
      @EndUserText.label: 'Object Number'
      eq.ObjectNumber                as ObjectNumber,
      @EndUserText.label: 'Is Marked For Deletion'
      case eq._DeletionFlag.StatusCode when 'I0076' then 'X' else '' end as IsMarkedForDeletion,
      @EndUserText.label: 'Creation Date'
      eq.CreationDate                as CreationDate,
      @EndUserText.label: 'Created By User'
      eq.CreatedByUser               as CreatedByUser,
      @EndUserText.label: 'Last Change Date'
      eq.LastChangeDate              as LastChangeDate
}
where seg.ValidityEndDate = '99991231'
