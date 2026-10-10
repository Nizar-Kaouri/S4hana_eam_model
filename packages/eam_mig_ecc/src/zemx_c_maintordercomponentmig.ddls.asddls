// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Open components (not deleted, not finally issued) of the open orders with material, plant and storage location translated.
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
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'MAINTENANCE_ORDER' and map01.SourceValue = src.MaintenanceOrder
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'ITEM_CATEGORY' and map02.SourceValue = src.BOMItemCategory
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'MATERIAL' and map03.SourceValue = src.Material
    left outer join ZEMX_I_MigrationMap as map04 on map04.MapName = 'PLANT' and map04.SourceValue = src.Plant
    left outer join ZEMX_I_MigrationMap as map05 on map05.MapName = 'STORAGE_LOCATION' and map05.SourceValue = src.StorageLocation
{
  key src.MaintenanceOrder           as LegacyMaintenanceOrder,
  key src.ReservationItem            as ReservationItem,
      coalesce( map01.TargetValue, src.MaintenanceOrder ) as MaintenanceOrder,
      src.MaintenanceOrderOperation  as MaintenanceOrderOperation,
      src.BOMItemNumber              as BOMItemNumber,
      coalesce( map02.TargetValue, src.BOMItemCategory ) as BOMItemCategory,
      coalesce( map03.TargetValue, src.Material ) as Material,
      coalesce( map04.TargetValue, src.Plant ) as Plant,
      coalesce( map05.TargetValue, src.StorageLocation ) as StorageLocation,
      src.MatlCompRequirementDate    as MatlCompRequirementDate,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      src.RequirementQuantityInBaseUnit as RequirementQuantityInBaseUnit,
      @Semantics.quantity.unitOfMeasure: 'BaseUnit'
      src.WithdrawnQuantity          as WithdrawnQuantity,
      @Semantics.unitOfMeasure: true
      src.BaseUnit                   as BaseUnit
}
where src.IsMarkedForDeletion = '' and src.IsFinalIssue = '' and obj.IsTechnicallyCompleted = '' and obj.IsClosed = '' and obj.IsMarkedForDeletion = ''
