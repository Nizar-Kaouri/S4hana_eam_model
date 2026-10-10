// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Equipment master records (EQUI): category, object type, manufacturer, acquisition and serial data.
// Example: Read the manufacturer data of equipment 10000001.
@AbapCatalog.sqlViewName: 'ZEMX_EQUI'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Equipment header'
@ObjectModel.representativeKey: 'Equipment'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_EquipmentHeader
  as select from equi
  association [0..1] to ZEMX_I_StatusDeletionFlag as _DeletionFlag on $projection.ObjectNumber = _DeletionFlag.ObjectNumber
{
      @EndUserText.label: 'Equipment'
  key equi.equnr as Equipment,
      @EndUserText.label: 'Equipment Category'
      equi.eqtyp as EquipmentCategory,
      @EndUserText.label: 'Technical Object Type'
      equi.eqart as TechnicalObjectType,
      @EndUserText.label: 'Authorization Group'
      equi.begru as AuthorizationGroup,
      @EndUserText.label: 'Material'
      equi.matnr as Material,
      @EndUserText.label: 'Serial Number'
      equi.sernr as SerialNumber,
      @EndUserText.label: 'Asset Manufacturer Name'
      equi.herst as AssetManufacturerName,
      // TODO-VERIFY[M] XEQ-004: EQUI field names HERLD, TYPBZ, MAPAR, SERGE, BAUMM, INBDT, GROES
      @EndUserText.label: 'Manufacturer Country'
      equi.herld as ManufacturerCountry,
      @EndUserText.label: 'Manufacturer Model Number'
      equi.typbz as ManufacturerModelNumber,
      @EndUserText.label: 'Manufacturer Part Nmbr'
      equi.mapar as ManufacturerPartNmbr,
      @EndUserText.label: 'Manufacturer Serial Number'
      equi.serge as ManufacturerSerialNumber,
      @EndUserText.label: 'Construction Year'
      equi.baujj as ConstructionYear,
      @EndUserText.label: 'Construction Month'
      equi.baumm as ConstructionMonth,
      @EndUserText.label: 'Inventory Number'
      equi.invnr as InventoryNumber,
      @EndUserText.label: 'Operation Start Date'
      equi.inbdt as OperationStartDate,
      @EndUserText.label: 'Equipment Size Dimension'
      equi.groes as EquipmentSizeDimension,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      @EndUserText.label: 'Gross Weight'
      equi.brgew as GrossWeight,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Weight Unit'
      equi.gewei as WeightUnit,
      @EndUserText.label: 'Acquisition Date'
      equi.ansdt as AcquisitionDate,
      // TODO-VERIFY[M] XEQ-005: EQUI-WAERS is the currency key of EQUI-ANSWT
      @Semantics.amount.currencyCode: 'Currency'
      @EndUserText.label: 'Acquisition Value'
      equi.answt as AcquisitionValue,
      @Semantics.currencyCode: true
      @EndUserText.label: 'Currency'
      equi.waers as Currency,
      @EndUserText.label: 'Object Number'
      equi.objnr as ObjectNumber,
      @EndUserText.label: 'Creation Date'
      equi.erdat as CreationDate,
      @EndUserText.label: 'Created By User'
      equi.ernam as CreatedByUser,
      @EndUserText.label: 'Last Change Date'
      equi.aedat as LastChangeDate,
      _DeletionFlag
}
