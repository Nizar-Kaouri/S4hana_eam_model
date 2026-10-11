// ModuPorter EAM migration | Release 1.0.0
// Purpose: Operations of maintenance orders with quantities and the work center as business key.
// Example: Read the operations of order 4000001.
@AbapCatalog.sqlViewName: 'ZEMX_ORO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Maintenance order operation'
@ObjectModel.representativeKey: 'OrderOperationInternalID'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_MaintOrderOperation
  as select from ZEMX_I_OrderOperationData as op
    inner join ZEMX_I_OrderOperationValues as val on val.OrderRoutingNumber = op.OrderRoutingNumber and val.OrderOperationInternalID = op.OrderOperationInternalID
    inner join ZEMX_I_OrderHeaderPlanning as plan on plan.OrderRoutingNumber = op.OrderRoutingNumber
{
      @EndUserText.label: 'Maintenance Order'
  key plan.MaintenanceOrder          as MaintenanceOrder,
      @EndUserText.label: 'Order Operation Internal ID'
  key op.OrderOperationInternalID    as OrderOperationInternalID,
      @EndUserText.label: 'Order Routing Number'
      op.OrderRoutingNumber          as OrderRoutingNumber,
      @EndUserText.label: 'Maintenance Order Operation'
      op.MaintenanceOrderOperation   as MaintenanceOrderOperation,
      @EndUserText.label: 'Maintenance Order Sub Operation'
      op.MaintenanceOrderSubOperation as MaintenanceOrderSubOperation,
      @EndUserText.label: 'Operation Description'
      op.OperationDescription        as OperationDescription,
      @EndUserText.label: 'Operation Control Key'
      op.OperationControlKey         as OperationControlKey,
      @EndUserText.label: 'Work Center'
      op._WorkCenter.WorkCenter      as WorkCenter,
      @EndUserText.label: 'Work Center Plant'
      op._WorkCenter.Plant           as WorkCenterPlant,
      @EndUserText.label: 'Plant'
      op.Plant                       as Plant,
      @EndUserText.label: 'Activity Type'
      op.ActivityType                as ActivityType,
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      @EndUserText.label: 'Planned Work Quantity'
      val.PlannedWorkQuantity        as PlannedWorkQuantity,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Planned Work Quantity Unit'
      val.PlannedWorkQuantityUnit    as PlannedWorkQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OperationDurationUnit'
      @EndUserText.label: 'Operation Duration'
      val.OperationDuration          as OperationDuration,
      @Semantics.unitOfMeasure: true
      @EndUserText.label: 'Operation Duration Unit'
      val.OperationDurationUnit      as OperationDurationUnit,
      @EndUserText.label: 'Work Center Internal ID'
      op.WorkCenterInternalID        as WorkCenterInternalID,
      @EndUserText.label: 'Object Number'
      op.ObjectNumber                as ObjectNumber
}
