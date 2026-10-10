// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
  as select from ZEMX_I_ReservationItem as cmp
    inner join ZEMX_I_OrderMaintData as pm on pm.MaintenanceOrder = cmp.MaintenanceOrder
{
  key cmp.Reservation                as Reservation,
  key cmp.ReservationItem            as ReservationItem,
  key cmp.ReservationRecordType      as ReservationRecordType,
      cmp.MaintenanceOrder           as MaintenanceOrder,
      cmp._Operation.MaintenanceOrderOperation as MaintenanceOrderOperation,
      cmp.OrderRoutingNumber         as OrderRoutingNumber,
      cmp.OrderOperationInternalID   as OrderOperationInternalID,
      cmp.BOMItemNumber              as BOMItemNumber,
      cmp.BOMItemCategory            as BOMItemCategory,
      cmp.Material                   as Material,
      cmp.Plant                      as Plant,
      cmp.StorageLocation            as StorageLocation,
      cmp.MatlCompRequirementDate    as MatlCompRequirementDate,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      cmp.RequirementQuantityInBaseUnit as RequirementQuantityInBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      cmp.WithdrawnQuantity          as WithdrawnQuantity,
      @Semantics.unitOfMeasure: true
      cmp.BaseUnit                   as BaseUnit,
      cmp.IsMarkedForDeletion        as IsMarkedForDeletion,
      cmp.IsFinalIssue               as IsFinalIssue
}
