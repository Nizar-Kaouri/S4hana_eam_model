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
      @EndUserText.label: 'Maintenance Order'
  key src.MaintenanceOrder           as MaintenanceOrder,
      @EndUserText.label: 'Maintenance Order Operation'
  key src.MaintenanceOrderOperation  as MaintenanceOrderOperation,
      @EndUserText.label: 'Maintenance Order Sub Operation'
  key src.MaintenanceOrderSubOperation as MaintenanceOrderSubOperation,
      @EndUserText.label: 'Operation Description'
      src.OperationDescription       as OperationDescription,
      @EndUserText.label: 'Operation Control Key'
      src.OperationControlKey        as OperationControlKey,
      @EndUserText.label: 'Work Center'
      src.WorkCenter                 as WorkCenter,
      @EndUserText.label: 'Work Center Plant'
      src.WorkCenterPlant            as WorkCenterPlant,
      @EndUserText.label: 'Plant'
      src.Plant                      as Plant,
      @EndUserText.label: 'Activity Type'
      src.ActivityType               as ActivityType,
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      @EndUserText.label: 'Planned Work Quantity'
      src.PlannedWorkQuantity        as PlannedWorkQuantity,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Planned Work Quantity Unit'
      src.PlannedWorkQuantityUnit    as PlannedWorkQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OperationDurationUnit'
      @EndUserText.label: 'Operation Duration'
      src.OperationDuration          as OperationDuration,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Operation Duration Unit'
      src.OperationDurationUnit      as OperationDurationUnit
}
where _MaintOrder.IsTechnicallyCompleted = '' and _MaintOrder.IsClosed = '' and _MaintOrder.IsMarkedForDeletion = ''
