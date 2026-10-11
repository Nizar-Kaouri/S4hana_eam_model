// ZPSV PS VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZPSV_I_WBSElement: WBS elements per company code and project.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZPSV_I_WBSElement applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'WBS Element Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZPSV_C_WBSElementQ
  provider contract analytical_query
  as projection on ZPSV_I_WBSElement
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  CompanyCode,
  @AnalyticsDetails.query.axis: #ROWS
  ProjectInternalID,
  @AnalyticsDetails.query.axis: #FREE
  ControllingArea,
  @AnalyticsDetails.query.axis: #FREE
  ProfitCenter,
  @AnalyticsDetails.query.axis: #FREE
  ResponsibleCostCenter,
  @AnalyticsDetails.query.axis: #FREE
  Plant,
  @AnalyticsDetails.query.axis: #FREE
  WBSElementIsPlanningElement,
  @AnalyticsDetails.query.axis: #FREE
  WBSElementIsAccountAssignment,
  @AnalyticsDetails.query.axis: #FREE
  WBSElementIsBillingElement,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfWBSElements,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfAcctAssignmentWBS
}
