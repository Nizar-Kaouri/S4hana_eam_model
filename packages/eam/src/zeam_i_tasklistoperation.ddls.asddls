// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Task list operation cube with planned work and number of operations per work center,
//   plant and task list.
// Example: Planned work content per work center across all equipment task lists.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Task List Operation - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEAM_I_TaskListOperation
  as select from ZEAM_B_TaskListOperation
{
  key TaskListType,
  key TaskListGroup,
  key TaskListGroupCounter,
  key TaskListOperationInternalId,
  key TaskListOpVersionCounter,
      OperationControlKey,
      WorkCenterInternalID,
      Plant,
      PlannedWorkQuantityUnit,

      /* Measures */
      @Aggregation.default: #SUM
      @Semantics.quantity.unitOfMeasure: 'PlannedWorkQuantityUnit'
      PlannedWorkQuantity,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Operations'
      cast( 1 as abap.int4 ) as NumberOfOperations,

      /* Associations */
      _TaskList
}
