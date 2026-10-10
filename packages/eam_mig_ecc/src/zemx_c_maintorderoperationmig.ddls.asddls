// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Operations of the open orders with work center, control key, activity type and units.
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
  association [0..1] to ZEMX_I_MaintOrder as _MaintOrder on _MaintOrder.MaintenanceOrder = $projection.MaintenanceOrder
{
  key src.MaintenanceOrder           as MaintenanceOrder,
  key src.MaintenanceOrderOperation  as MaintenanceOrderOperation,
  key src.MaintenanceOrderSubOperation as MaintenanceOrderSubOperation,
      src.OperationDescription       as OperationDescription,
      src.OperationControlKey        as OperationControlKey,
      src.WorkCenter                 as WorkCenter,
      src.WorkCenterPlant            as WorkCenterPlant,
      src.Plant                      as Plant,
      src.ActivityType               as ActivityType,
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      src.PlannedWorkQuantity        as PlannedWorkQuantity,
      @Semantics.unitOfMeasure: true
      src.PlannedWorkQuantityUnit    as PlannedWorkQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OperationDurationUnit'
      src.OperationDuration          as OperationDuration,
      @Semantics.unitOfMeasure: true
      src.OperationDurationUnit      as OperationDurationUnit
}
where _MaintOrder.IsTechnicallyCompleted = '' and _MaintOrder.IsClosed = '' and _MaintOrder.IsMarkedForDeletion = ''
