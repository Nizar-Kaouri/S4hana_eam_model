// ZPSV PS VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZPSV_I_ProjectCostToDate: cost to date per project and WBS element at a key date.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZPSV_I_ProjectCostToDate applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Project Cost to Date'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZPSV_C_ProjectCostToDateQ
  provider contract analytical_query
  with parameters
    P_KeyDate : abap.dats
  as projection on ZPSV_I_ProjectCostToDate( P_KeyDate: $parameters.P_KeyDate )
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  CompanyCode,
  @AnalyticsDetails.query.axis: #ROWS
  ProjectInternalID,
  @AnalyticsDetails.query.axis: #FREE
  WBSElementInternalID,
  @AnalyticsDetails.query.axis: #FREE
  Ledger,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCodeCurrency,
  @AnalyticsDetails.query.axis: #COLUMNS
  ActualCostToDate,
  @AnalyticsDetails.query.axis: #COLUMNS
  SettledToDate,
  @AnalyticsDetails.query.axis: #COLUMNS
  BalanceToDate
}
