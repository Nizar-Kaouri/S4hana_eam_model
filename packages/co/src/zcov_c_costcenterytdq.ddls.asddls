// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZCOV_I_CostCenterYTD: costs YTD vs. prior year per cost center and cost element,
//   with the variance.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZCOV_I_CostCenterYTD applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Cost Center YTD vs. Prior Year'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZCOV_C_CostCenterYTDQ
  provider contract analytical_query
  with parameters
    P_FiscalYear : abap.numc( 4 ),
    P_PriorFiscalYear : abap.numc( 4 ),
    P_ToFiscalPeriod : abap.numc( 3 )
  as projection on ZCOV_I_CostCenterYTD( P_FiscalYear: $parameters.P_FiscalYear, P_PriorFiscalYear: $parameters.P_PriorFiscalYear, P_ToFiscalPeriod: $parameters.P_ToFiscalPeriod )
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  CostCenter,
  @AnalyticsDetails.query.axis: #ROWS
  GLAccount,
  @AnalyticsDetails.query.axis: #FREE
  ControllingArea,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCode,
  @AnalyticsDetails.query.axis: #FREE
  GLAccountType,
  @AnalyticsDetails.query.axis: #FREE
  FiscalPeriod,
  @AnalyticsDetails.query.axis: #FREE
  Ledger,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCodeCurrency,
  @AnalyticsDetails.query.axis: #COLUMNS
  CurrentYearCost,
  @AnalyticsDetails.query.axis: #COLUMNS
  PriorYearCost,
  @Aggregation.default: #FORMULA
  @AnalyticsDetails.query.axis: #COLUMNS
  @EndUserText.label: 'Variance to Prior Year'
  $projection.CurrentYearCost - $projection.PriorYearCost as CostVariance
}
