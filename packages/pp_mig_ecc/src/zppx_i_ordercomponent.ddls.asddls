// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read OrderComponent as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V006R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'OrderComponent'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPPX_I_OrderComponent
  as select from ZPPX_I_OrderComponentData as src
{
  key src.Reservation as Reservation,
  key src.ReservationItem as ReservationItem,
  key src.RecordType as RecordType,
      src.ManufacturingOrder as ManufacturingOrder,
      src.Material as Material,
      src.Plant as Plant,
      src.StorageLocation as StorageLocation,
      src.RequiredQuantity as RequiredQuantity,
      src.Unit as Unit,
      src.DeletionFlag as DeletionFlag
}
