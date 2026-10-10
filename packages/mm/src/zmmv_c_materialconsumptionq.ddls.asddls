// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZMMV_R_MaterialConsumption: consumption per plant and month.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZMMV_R_MaterialConsumption applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Material Consumption Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZMMV_C_MaterialConsumptionQ
  provider contract analytical_query
  as projection on ZMMV_R_MaterialConsumption
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  Plant,
  @AnalyticsDetails.query.axis: #ROWS
  PostingYearMonth,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  StorageLocation,
  @AnalyticsDetails.query.axis: #FREE
  GoodsMovementType,
  @AnalyticsDetails.query.axis: #FREE
  CostCenter,
  @AnalyticsDetails.query.axis: #FREE
  OrderID,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCode,
  @AnalyticsDetails.query.axis: #FREE
  MaterialBaseUnit,
  @AnalyticsDetails.query.axis: #FREE
  CompanyCodeCurrency,
  @AnalyticsDetails.query.axis: #COLUMNS
  ConsumptionQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  ConsumptionReversalQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  ConsumptionAmount,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfMovements
}
