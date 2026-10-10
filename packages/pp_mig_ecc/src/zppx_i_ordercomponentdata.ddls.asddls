// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read OrderComponentData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] PPX-006: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPPX_V006'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'OrderComponentData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPPX_I_OrderComponentData
  as select from resb as src
{
  key src.rsnum as Reservation,
  key src.rspos as ReservationItem,
  key src.rsart as RecordType,
      src.aufnr as ManufacturingOrder,
      src.matnr as Material,
      src.werks as Plant,
      src.lgort as StorageLocation,
      src.bdmng as RequiredQuantity,
      src.meins as Unit,
      src.xloek as DeletionFlag
}
