// ZQMV QM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZQMV_I_InspectionLot: lots and rejections per plant and origin, with the
//   rejection rate.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// TODO-VERIFY[M] QM-Q01: formula element in a transient analytical query (same as EAM RPT-Q01)
// DESIGN NOTE: no DCL (transient query); the DCL of ZQMV_I_InspectionLot applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Inspection Lot Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZQMV_C_InspectionLotQ
  provider contract analytical_query
  as projection on ZQMV_I_InspectionLot
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  Plant,
  @AnalyticsDetails.query.axis: #ROWS
  InspectionLotOrigin,
  @AnalyticsDetails.query.axis: #FREE
  InspLotCreationYearMonth,
  @AnalyticsDetails.query.axis: #FREE
  InspectionLotType,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  Supplier,
  @AnalyticsDetails.query.axis: #FREE
  InspLotHasUsageDecision,
  @AnalyticsDetails.query.axis: #FREE
  InspLotIsRejected,
  @AnalyticsDetails.query.axis: #FREE
  InspectionLotUsageDecisionCode,
  @AnalyticsDetails.query.axis: #FREE
  InspectionLotQuantityUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfInspectionLots,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfLotsWithDecision,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfRejectedLots,
  @AnalyticsDetails.query.axis: #COLUMNS
  InspectionLotQuantity,
  @Aggregation.default: #FORMULA
  @AnalyticsDetails.query.axis: #COLUMNS
  @EndUserText.label: 'Rejection Rate'
  $projection.NumberOfRejectedLots / $projection.NumberOfLotsWithDecision as RejectionRate
}
