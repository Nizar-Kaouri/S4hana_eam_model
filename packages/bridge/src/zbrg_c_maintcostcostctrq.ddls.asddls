// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZBRG_R_MaintCostWithCostCtr: maintenance cost per cost center category and cost
//   center.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when modules "co:cost_center" AND "eam:rpt_order_cost" are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZBRG_R_MaintCostWithCostCtr applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Maintenance Cost by Cost Center'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZBRG_C_MaintCostCostCtrQ
  provider contract analytical_query
  as projection on ZBRG_R_MaintCostWithCostCtr
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
  MaintenanceOrderType,
  @AnalyticsDetails.query.axis: #FREE
  MaintenanceActivityType,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #FREE
  CostCtrResponsiblePersonName,
  @AnalyticsDetails.query.axis: #FREE
  GLAccount,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCodeCurrency,
  @AnalyticsDetails.query.axis: #FREE
  GlobalCurrency,
  @AnalyticsDetails.query.axis: #COLUMNS
  AmountInCompanyCodeCurrency,
  @AnalyticsDetails.query.axis: #COLUMNS
  AmountInGlobalCurrency
}
