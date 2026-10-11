// ModuPorter PP migration | Release 1.0.0
// Purpose: Read OrderComponentMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V006C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'OrderComponentMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPPX_C_OrderComponentMig
  as select from ZPPX_I_OrderComponent as src
{
  key src.Reservation as Reservation,
  key src.ReservationItem as ReservationItem,
  key src.RecordType as RecordType,
      src.ManufacturingOrder as ManufacturingOrder,
      src.Material as Material,
      src.Plant as Plant,
      src.StorageLocation as StorageLocation,
      @Semantics.quantity.unitOfMeasure: 'Unit'
      src.RequiredQuantity as RequiredQuantity,
      src.Unit as Unit,
      src.DeletionFlag as DeletionFlag
}
