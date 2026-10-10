// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
    left outer join ZEMX_I_WorkCenterHeader as wc on wc.WorkCenterInternalID = op.WorkCenterInternalID
{
  key plan.MaintenanceOrder          as MaintenanceOrder,
  key op.OrderOperationInternalID    as OrderOperationInternalID,
      op.OrderRoutingNumber          as OrderRoutingNumber,
      op.MaintenanceOrderOperation   as MaintenanceOrderOperation,
      op.MaintenanceOrderSubOperation as MaintenanceOrderSubOperation,
      op.OperationDescription        as OperationDescription,
      op.OperationControlKey         as OperationControlKey,
      wc.WorkCenter                  as WorkCenter,
      wc.Plant                       as WorkCenterPlant,
      op.Plant                       as Plant,
      op.ActivityType                as ActivityType,
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      val.PlannedWorkQuantity        as PlannedWorkQuantity,
      @Semantics.unitOfMeasure: true
      val.PlannedWorkQuantityUnit    as PlannedWorkQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'OperationDurationUnit'
      val.OperationDuration          as OperationDuration,
      @Semantics.unitOfMeasure: true
      val.OperationDurationUnit      as OperationDurationUnit,
      op.WorkCenterInternalID        as WorkCenterInternalID,
      op.ObjectNumber                as ObjectNumber
}
