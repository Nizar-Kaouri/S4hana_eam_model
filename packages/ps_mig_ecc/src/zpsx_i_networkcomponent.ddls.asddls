// ModuPorter PS migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZPSX_73N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NetworkComponent'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_NetworkComponent
  as select from ZPSX_B_NetworkComponentData as ch
    inner join ZPSX_I_NetworkHeader as obj on ch.Network = obj.Network
{
  key ch.Reservation as Reservation,
  key ch.ReservationItem as ReservationItem,
  key ch.RecordType as RecordType,
      ch.Network as Network,
      ch.Material as Material,
      ch.Plant as Plant,
      ch.StorageLocation as StorageLocation,
      @Semantics.quantity.unitOfMeasure: 'Unit'
      ch.RequiredQuantity as RequiredQuantity,
      ch.Unit as Unit,
      ch.DeletionFlag as DeletionFlag
}
where ch.DeletionFlag = ''
