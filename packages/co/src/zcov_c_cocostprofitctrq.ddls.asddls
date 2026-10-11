// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZCOV_I_COCostWithProfitCtr: costs per segment and profit center.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when modules "cost_actuals" AND "profit_center" are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZCOV_I_COCostWithProfitCtr applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Costs by Profit Center'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZCOV_C_COCostProfitCtrQ
  provider contract analytical_query
  as projection on ZCOV_I_COCostWithProfitCtr
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  ProfitCenterSegment,
  @AnalyticsDetails.query.axis: #ROWS
  ProfitCenter,
  @AnalyticsDetails.query.axis: #FREE
  FiscalYear,
  @AnalyticsDetails.query.axis: #FREE
  FiscalPeriod,
  @AnalyticsDetails.query.axis: #FREE
  Ledger,
  @AnalyticsDetails.query.axis: #FREE
  ControllingArea,
  @AnalyticsDetails.query.axis: #FREE
  CostCenter,
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
