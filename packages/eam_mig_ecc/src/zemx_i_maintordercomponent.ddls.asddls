// ModuPorter EAM migration | Release 1.0.0
// Purpose: Material components of maintenance orders with the operation number (instead of the internal operation counter).
// Example: Read the open components of order 4000001.
@AbapCatalog.sqlViewName: 'ZEMX_ORC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Maintenance order component'
@ObjectModel.representativeKey: 'ReservationItem'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_MaintOrderComponent
  as select from ZEMX_B_ReservationItem as cmp
    inner join ZEMX_B_OrderMaintData as pm on pm.MaintenanceOrder = cmp.MaintenanceOrder
{
      @EndUserText.label: 'Reservation'
  key cmp.Reservation                as Reservation,
      @EndUserText.label: 'Reservation Item'
  key cmp.ReservationItem            as ReservationItem,
      @EndUserText.label: 'Reservation Record Type'
  key cmp.ReservationRecordType      as ReservationRecordType,
      @EndUserText.label: 'Maintenance Order'
      cmp.MaintenanceOrder           as MaintenanceOrder,
      @EndUserText.label: 'Maintenance Order Operation'
      cmp._Operation.MaintenanceOrderOperation as MaintenanceOrderOperation,
      @EndUserText.label: 'Order Routing Number'
      cmp.OrderRoutingNumber         as OrderRoutingNumber,
      @EndUserText.label: 'Order Operation Internal ID'
      cmp.OrderOperationInternalID   as OrderOperationInternalID,
      @EndUserText.label: 'BOMItem Number'
      cmp.BOMItemNumber              as BOMItemNumber,
      @EndUserText.label: 'BOMItem Category'
      cmp.BOMItemCategory            as BOMItemCategory,
      @EndUserText.label: 'Material'
      cmp.Material                   as Material,
      @EndUserText.label: 'Plant'
      cmp.Plant                      as Plant,
      @EndUserText.label: 'Storage Location'
      cmp.StorageLocation            as StorageLocation,
      @EndUserText.label: 'Matl Comp Requirement Date'
      cmp.MatlCompRequirementDate    as MatlCompRequirementDate,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      @EndUserText.label: 'Requirement Quantity In Base Unit'
      cmp.RequirementQuantityInBaseUnit as RequirementQuantityInBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      @EndUserText.label: 'Withdrawn Quantity'
      cmp.WithdrawnQuantity          as WithdrawnQuantity,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Base Unit'
      cmp.BaseUnit                   as BaseUnit,
      @EndUserText.label: 'Is Marked For Deletion'
      cmp.IsMarkedForDeletion        as IsMarkedForDeletion,
      @EndUserText.label: 'Is Final Issue'
      cmp.IsFinalIssue               as IsFinalIssue
}
