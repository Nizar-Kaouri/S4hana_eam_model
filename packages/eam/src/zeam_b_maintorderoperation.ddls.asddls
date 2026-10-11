// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per maintenance order operation / sub-operation with work center, control key,
//   planned and actual work.
// Example: Planned vs. actual work per work center; remaining work of open orders (backlog report).
// TODO-VERIFY[H] MO-O01: SAP released view for order operations is I_MaintenanceOrderOperation (name not confirmed)
// TODO-VERIFY[H] MO-O02: key elements MaintenanceOrder, MaintenanceOrderOperation, MaintenanceOrderSubOperation
// TODO-VERIFY[H] MO-O03: work elements PlannedWorkQuantity / PlannedWorkQuantityUnit / ActualWorkQuantity / ActualWorkQuantityUnit
// TODO-VERIFY[M] MO-O04: elements OperationDescription, WorkCenter, WorkCenterInternalID, Plant, OperationControlKey, MaintenanceActivityType
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Order Operation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MaintenanceOrderSubOperation'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_MaintOrderOperation
  as select from I_MaintenanceOrderOperation
  association [1..1] to ZEAM_B_MaintOrder as _MaintenanceOrder on $projection.MaintenanceOrder = _MaintenanceOrder.MaintenanceOrder
{
      @ObjectModel.foreignKey.association: '_MaintenanceOrder'
  key MaintenanceOrder,
  key MaintenanceOrderOperation,
  key MaintenanceOrderSubOperation,
      @Semantics.text: true
      OperationDescription,
      OperationControlKey,
      MaintenanceActivityType,
      WorkCenter,
      WorkCenterInternalID,
      Plant,
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      PlannedWorkQuantity,
      PlannedWorkQuantityUnit,
      @Semantics.quantity.unitOfMeasure: 'ActualWorkQuantityUnit'
      ActualWorkQuantity,
      ActualWorkQuantityUnit,

      /* Associations */
      _MaintenanceOrder
}
