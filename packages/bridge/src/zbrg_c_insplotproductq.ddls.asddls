// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZBRG_I_InspLotWithProduct: lots and rejections per plant and product group, with
//   rejection rate.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when modules "mm:product" AND "qm:inspection_lot" are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZBRG_I_InspLotWithProduct applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Quality by Product Group'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZBRG_C_InspLotProductQ
  provider contract analytical_query
  as projection on ZBRG_I_InspLotWithProduct
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  Plant,
  @AnalyticsDetails.query.axis: #ROWS
  ProductGroup,
  @AnalyticsDetails.query.axis: #FREE
  InspLotCreationYearMonth,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  ProductType,
  @AnalyticsDetails.query.axis: #FREE
  Supplier,
  @AnalyticsDetails.query.axis: #FREE
  InspectionLotOrigin,
  @AnalyticsDetails.query.axis: #FREE
  InspLotIsRejected,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfInspectionLots,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfLotsWithDecision,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfRejectedLots,
  @Aggregation.default: #FORMULA
  @AnalyticsDetails.query.axis: #COLUMNS
  @EndUserText.label: 'Rejection Rate'
  $projection.NumberOfRejectedLots / $projection.NumberOfLotsWithDecision as RejectionRate
}
