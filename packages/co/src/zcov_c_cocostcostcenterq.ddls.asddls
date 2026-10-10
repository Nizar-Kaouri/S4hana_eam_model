// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZCOV_R_COCostWithCostCenter: costs per cost center category and cost center.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when modules "cost_actuals" AND "cost_center" are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZCOV_R_COCostWithCostCenter applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Costs by Cost Center Category'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZCOV_C_COCostCostCenterQ
  provider contract analytical_query
  as projection on ZCOV_R_COCostWithCostCenter
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  CostCenterCategory,
  @AnalyticsDetails.query.axis: #ROWS
  CostCenter,
  @AnalyticsDetails.query.axis: #FREE
  FiscalYear,
  @AnalyticsDetails.query.axis: #FREE
  FiscalPeriod,
  @AnalyticsDetails.query.axis: #FREE
  Ledger,
  @AnalyticsDetails.query.axis: #FREE
  ControllingArea,
  @AnalyticsDetails.query.axis: #FREE
  CostCtrResponsiblePersonName,
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
