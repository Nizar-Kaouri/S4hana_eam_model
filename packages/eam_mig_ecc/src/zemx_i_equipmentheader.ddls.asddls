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
  key equi.equnr as Equipment,
      equi.eqtyp as EquipmentCategory,
      equi.eqart as TechnicalObjectType,
      equi.begru as AuthorizationGroup,
      equi.matnr as Material,
      equi.sernr as SerialNumber,
      equi.herst as AssetManufacturerName,
      // TODO-VERIFY[M] XEQ-004: EQUI field names HERLD, TYPBZ, MAPAR, SERGE, BAUMM, INBDT, GROES
      equi.herld as ManufacturerCountry,
      equi.typbz as ManufacturerModelNumber,
      equi.mapar as ManufacturerPartNmbr,
      equi.serge as ManufacturerSerialNumber,
      equi.baujj as ConstructionYear,
      equi.baumm as ConstructionMonth,
      equi.invnr as InventoryNumber,
      equi.inbdt as OperationStartDate,
      equi.groes as EquipmentSizeDimension,
      @Semantics.quantity.unitOfMeasure: 'WeightUnit'
      equi.brgew as GrossWeight,
      @Semantics.unitOfMeasure: true
      equi.gewei as WeightUnit,
      equi.ansdt as AcquisitionDate,
      // TODO-VERIFY[M] XEQ-005: EQUI-WAERS is the currency key of EQUI-ANSWT
      @Semantics.amount.currencyCode: 'Currency'
      equi.answt as AcquisitionValue,
      @Semantics.currencyCode: true
      equi.waers as Currency,
      equi.objnr as ObjectNumber,
      equi.erdat as CreationDate,
      equi.ernam as CreatedByUser,
      equi.aedat as LastChangeDate,
      _DeletionFlag
}
