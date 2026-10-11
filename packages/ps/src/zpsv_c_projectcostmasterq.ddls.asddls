// ZPSV PS VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZPSV_I_ProjectCostWithMaster: cost per project profile and project.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when modules "project" AND "project_cost" AND "wbs_element" are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZPSV_I_ProjectCostWithMaster applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Project Cost by Project Profile'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZPSV_C_ProjectCostMasterQ
  provider contract analytical_query
  as projection on ZPSV_I_ProjectCostWithMaster
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  ProjectProfileCode,
  @AnalyticsDetails.query.axis: #ROWS
  Project,
  @AnalyticsDetails.query.axis: #FREE
  FiscalYear,
  @AnalyticsDetails.query.axis: #FREE
  FiscalPeriod,
  @AnalyticsDetails.query.axis: #FREE
  Ledger,
  @AnalyticsDetails.query.axis: #FREE
  WBSElement,
  @AnalyticsDetails.query.axis: #FREE
  ResponsibleCostCenter,
  @AnalyticsDetails.query.axis: #FREE
  ProcessingStatus,
  @AnalyticsDetails.query.axis: #FREE
  GLAccount,
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
