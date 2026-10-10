// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZCOV_R_COActualCost: primary and secondary costs per controlling area and period.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZCOV_R_COActualCost applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Actual Cost Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZCOV_C_COActualCostQ
  provider contract analytical_query
  as projection on ZCOV_R_COActualCost
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  ControllingArea,
  @AnalyticsDetails.query.axis: #ROWS
  FiscalPeriod,
  @AnalyticsDetails.query.axis: #FREE
  FiscalYear,
  @AnalyticsDetails.query.axis: #FREE
  Ledger,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCode,
  @AnalyticsDetails.query.axis: #FREE
  CostCenter,
  @AnalyticsDetails.query.axis: #FREE
  OrderID,
  @AnalyticsDetails.query.axis: #FREE
  WBSElementInternalID,
  @AnalyticsDetails.query.axis: #FREE
  ProfitCenter,
  @AnalyticsDetails.query.axis: #FREE
  Segment,
  @AnalyticsDetails.query.axis: #FREE
  FunctionalArea,
  @AnalyticsDetails.query.axis: #FREE
  GLAccount,
  @AnalyticsDetails.query.axis: #FREE
  GLAccountType,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCodeCurrency,
  @AnalyticsDetails.query.axis: #COLUMNS
  PrimaryCostAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  SecondaryCostAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  TotalCostAmount
}
