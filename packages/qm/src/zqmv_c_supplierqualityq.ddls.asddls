// ZQMV QM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZQMV_I_SupplierQuality: decided, accepted and rejected lots per supplier with
//   rejection rate.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZQMV_I_SupplierQuality applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Supplier Quality Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZQMV_C_SupplierQualityQ
  provider contract analytical_query
  as projection on ZQMV_I_SupplierQuality
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  Supplier,
  @AnalyticsDetails.query.axis: #ROWS
  DecisionYearMonth,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  Plant,
  @AnalyticsDetails.query.axis: #FREE
  InspectionLotType,
  @AnalyticsDetails.query.axis: #FREE
  InspectionLotQuantityUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfDecidedLots,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfAcceptedLots,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfRejectedLots,
  @AnalyticsDetails.query.axis: #COLUMNS
  RejectedQuantity,
  @Aggregation.default: #FORMULA
  @AnalyticsDetails.query.axis: #COLUMNS
  @EndUserText.label: 'Rejection Rate'
  $projection.NumberOfRejectedLots / $projection.NumberOfDecidedLots as SupplierRejectionRate
}
