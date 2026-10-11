// ZPSV PS VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZPSV_I_ProjectCost: actual cost and settlement per project and period.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZPSV_I_ProjectCost applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Project Cost Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZPSV_C_ProjectCostQ
  provider contract analytical_query
  as projection on ZPSV_I_ProjectCost
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  ProjectInternalID,
  @AnalyticsDetails.query.axis: #ROWS
  FiscalPeriod,
  @AnalyticsDetails.query.axis: #FREE
  FiscalYear,
  @AnalyticsDetails.query.axis: #FREE
  Ledger,
  @AnalyticsDetails.query.axis: #FREE
  WBSElementInternalID,
  @AnalyticsDetails.query.axis: #FREE
  GLAccount,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCode,
  @AnalyticsDetails.query.axis: #FREE
  ControllingArea,
  @AnalyticsDetails.query.axis: #FREE
  ProfitCenter,
  @AnalyticsDetails.query.axis: #FREE
  IsSettlementPosting,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCodeCurrency,
  @AnalyticsDetails.query.axis: #COLUMNS
  ActualCostAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  SettlementAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  AmountInCompanyCodeCurrency
}
