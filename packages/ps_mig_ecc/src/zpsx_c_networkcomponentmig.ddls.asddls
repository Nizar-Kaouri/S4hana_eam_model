// ModuPorter PS migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZPSX_74N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'NetworkComponentMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPSX_C_NetworkComponentMig
  as select from ZPSX_I_NetworkComponent as src
{
  key src.Reservation as Reservation,
  key src.ReservationItem as ReservationItem,
  key src.RecordType as RecordType,
      src.Network as Network,
      src.Material as Material,
      src.Plant as Plant,
      src.StorageLocation as StorageLocation,
      @Semantics.quantity.unitOfMeasure: 'Unit'
      src.RequiredQuantity as RequiredQuantity,
      src.Unit as Unit,
      src.DeletionFlag as DeletionFlag
}
