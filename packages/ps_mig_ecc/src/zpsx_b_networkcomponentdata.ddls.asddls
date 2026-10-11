// ModuPorter PS migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZPSX_72N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NetworkComponentData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPSX_B_NetworkComponentData
  as select from resb as src
{
  key src.rsnum as Reservation,
  key src.rspos as ReservationItem,
  key src.rsart as RecordType,
      src.aufnr as Network,
      src.matnr as Material,
      src.werks as Plant,
      src.lgort as StorageLocation,
      @Semantics.quantity.unitOfMeasure: 'Unit'
      src.bdmng as RequiredQuantity,
      src.meins as Unit,
      src.xloek as DeletionFlag
}
