// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZEAM_R_TaskListOperation. Planned work content of task lists per plant and work center.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZEAM_R_TaskListOperation applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Task List Work Content Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_TaskListOperationQ
  provider contract analytical_query
  as projection on ZEAM_R_TaskListOperation
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  Plant,
  @AnalyticsDetails.query.axis: #ROWS
  WorkCenterInternalID,
  @AnalyticsDetails.query.axis: #FREE
  TaskListType,
  @AnalyticsDetails.query.axis: #FREE
  TaskListGroup,
  @AnalyticsDetails.query.axis: #FREE
  OperationControlKey,
  @AnalyticsDetails.query.axis: #FREE
  PlannedWorkQuantityUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  PlannedWorkQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOperations
}
