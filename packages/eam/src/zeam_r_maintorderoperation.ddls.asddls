// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Operation cube with planned and actual work and order header characteristics
//   (order type, activity type, planning plant, open flag) taken over via path expressions.
// Example: Planned vs. actual work hours per work center and month; work-plan adherence per planner group.
// TODO-VERIFY[M] MO-R02: path expressions over _MaintenanceOrder in the select list of a #CUBE view entity
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Order Operation - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEAM_R_MaintOrderOperation
  as select from ZEAM_I_MaintOrderOperation
{
      @ObjectModel.foreignKey.association: '_MaintenanceOrder'
  key MaintenanceOrder,
  key MaintenanceOrderOperation,
  key MaintenanceOrderSubOperation,
      OperationControlKey,
      MaintenanceActivityType,
      WorkCenter,
      WorkCenterInternalID,
      Plant,
      PlannedWorkQuantityUnit,
      ActualWorkQuantityUnit,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      PlannedWorkQuantity,
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'ActualWorkQuantityUnit'
      ActualWorkQuantity,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Operations'
      cast( 1 as abap.int4 ) as NumberOfOperations,

      /* Order header characteristics */
      _MaintenanceOrder.MaintenanceOrderType,
      _MaintenanceOrder.MaintenancePlanningPlant,
      _MaintenanceOrder.MaintenancePlannerGroup,
      _MaintenanceOrder.MaintenancePlant,
      _MaintenanceOrder.MaintOrderIsOpen,
      _MaintenanceOrder.MaintOrdBasicStartDate,
      _MaintenanceOrder.CompanyCode,
      _MaintenanceOrder.BusinessArea,
      _MaintenanceOrder.CostCenter,

      /* Associations */
      _MaintenanceOrder
}
