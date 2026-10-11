// ModuPorter EAM migration | Release 1.0.0
// Purpose: Open components (not deleted, not finally issued) of the open orders with material, plant and storage location.
// Example: The load program adds the components to the operations of the migrated order.
@AbapCatalog.sqlViewName: 'ZEMX_CORC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance order component (migration)'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MaintOrderComponentMig
  as select from ZEMX_I_MaintOrderComponent as src
  association [0..1] to ZEMX_I_MaintOrder as _MaintOrder on _MaintOrder.MaintenanceOrder = $projection.MaintenanceOrder
{
      @EndUserText.label: 'Maintenance Order'
  key src.MaintenanceOrder           as MaintenanceOrder,
      @EndUserText.label: 'Reservation Item'
  key src.ReservationItem            as ReservationItem,
      @EndUserText.label: 'Maintenance Order Operation'
      src.MaintenanceOrderOperation  as MaintenanceOrderOperation,
      @EndUserText.label: 'BOMItem Number'
      src.BOMItemNumber              as BOMItemNumber,
      @EndUserText.label: 'BOMItem Category'
      src.BOMItemCategory            as BOMItemCategory,
      @EndUserText.label: 'Material'
      src.Material                   as Material,
      @EndUserText.label: 'Plant'
      src.Plant                      as Plant,
      @EndUserText.label: 'Storage Location'
      src.StorageLocation            as StorageLocation,
      @EndUserText.label: 'Matl Comp Requirement Date'
      src.MatlCompRequirementDate    as MatlCompRequirementDate,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      @EndUserText.label: 'Requirement Quantity In Base Unit'
      src.RequirementQuantityInBaseUnit as RequirementQuantityInBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      @EndUserText.label: 'Withdrawn Quantity'
      src.WithdrawnQuantity          as WithdrawnQuantity,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Base Unit'
      src.BaseUnit                   as BaseUnit
}
where src.IsMarkedForDeletion = '' and src.IsFinalIssue = '' and _MaintOrder.IsTechnicallyCompleted = '' and _MaintOrder.IsClosed = '' and _MaintOrder.IsMarkedForDeletion = ''
