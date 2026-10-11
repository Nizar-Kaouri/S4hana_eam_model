// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZCOV_I_CostCenter: cost centers per company code and category.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZCOV_I_CostCenter applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Cost Center Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZCOV_C_CostCenterQ
  provider contract analytical_query
  as projection on ZCOV_I_CostCenter
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  CompanyCode,
  @AnalyticsDetails.query.axis: #ROWS
  CostCenterCategory,
  @AnalyticsDetails.query.axis: #FREE
  ControllingArea,
  @AnalyticsDetails.query.axis: #FREE
  ProfitCenter,
  @AnalyticsDetails.query.axis: #FREE
  BusinessArea,
  @AnalyticsDetails.query.axis: #FREE
  FunctionalArea,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfCostCenters
}
