// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
    inner join ZEMX_I_MaintOrder as obj on obj.MaintenanceOrder = src.MaintenanceOrder
{
  key src.MaintenanceOrder           as MaintenanceOrder,
  key src.ReservationItem            as ReservationItem,
      src.MaintenanceOrderOperation  as MaintenanceOrderOperation,
      src.BOMItemNumber              as BOMItemNumber,
      src.BOMItemCategory            as BOMItemCategory,
      src.Material                   as Material,
      src.Plant                      as Plant,
      src.StorageLocation            as StorageLocation,
      src.MatlCompRequirementDate    as MatlCompRequirementDate,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      src.RequirementQuantityInBaseUnit as RequirementQuantityInBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      src.WithdrawnQuantity          as WithdrawnQuantity,
      @Semantics.unitOfMeasure: true
      src.BaseUnit                   as BaseUnit
}
where src.IsMarkedForDeletion = '' and src.IsFinalIssue = '' and obj.IsTechnicallyCompleted = '' and obj.IsClosed = '' and obj.IsMarkedForDeletion = ''
