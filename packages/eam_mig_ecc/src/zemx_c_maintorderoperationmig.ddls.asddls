// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Operations of the open orders with work center, control key, activity type and units translated.
// Example: The load program adds the operations to the order created from ZEMX_C_MaintOrderMig.
@AbapCatalog.sqlViewName: 'ZEMX_CORO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance order operation (migration)'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MaintOrderOperationMig
  as select from ZEMX_I_MaintOrderOperation as src
    inner join ZEMX_I_MaintOrder as obj on obj.MaintenanceOrder = src.MaintenanceOrder
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'MAINTENANCE_ORDER' and map01.SourceValue = src.MaintenanceOrder
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'CONTROL_KEY' and map02.SourceValue = src.OperationControlKey
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'WORK_CENTER' and map03.SourceValue = src.WorkCenter
    left outer join ZEMX_I_MigrationMap as map04 on map04.MapName = 'PLANT' and map04.SourceValue = src.WorkCenterPlant
    left outer join ZEMX_I_MigrationMap as map05 on map05.MapName = 'PLANT' and map05.SourceValue = src.Plant
    left outer join ZEMX_I_MigrationMap as map06 on map06.MapName = 'ACTIVITY_TYPE' and map06.SourceValue = src.ActivityType
{
  key src.MaintenanceOrder           as LegacyMaintenanceOrder,
  key src.MaintenanceOrderOperation  as MaintenanceOrderOperation,
  key src.MaintenanceOrderSubOperation as MaintenanceOrderSubOperation,
      coalesce( map01.TargetValue, src.MaintenanceOrder ) as MaintenanceOrder,
      src.OperationDescription       as OperationDescription,
      coalesce( map02.TargetValue, src.OperationControlKey ) as OperationControlKey,
      coalesce( map03.TargetValue, src.WorkCenter ) as WorkCenter,
      coalesce( map04.TargetValue, src.WorkCenterPlant ) as WorkCenterPlant,
      coalesce( map05.TargetValue, src.Plant ) as Plant,
      coalesce( map06.TargetValue, src.ActivityType ) as ActivityType,
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      src.PlannedWorkQuantity        as PlannedWorkQuantity,
      @Semantics.unitOfMeasure: true
      src.PlannedWorkQuantityUnit    as PlannedWorkQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OperationDurationUnit'
      src.OperationDuration          as OperationDuration,
      @Semantics.unitOfMeasure: true
      src.OperationDurationUnit      as OperationDurationUnit
}
where obj.IsTechnicallyCompleted = '' and obj.IsClosed = '' and obj.IsMarkedForDeletion = ''
