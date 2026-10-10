// ZPPV PP VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZPPV_R_ProductionOrderOp: quantities per plant and work center.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// TODO-VERIFY[M] PP-Q01: formula over quantity measures with the same unit in a transient analytical query
// DESIGN NOTE: no DCL (transient query); the DCL of ZPPV_R_ProductionOrderOp applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Production Operation Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZPPV_C_ProductionOrderOpQ
  provider contract analytical_query
  as projection on ZPPV_R_ProductionOrderOp
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  ProductionPlant,
  @AnalyticsDetails.query.axis: #ROWS
  WorkCenterInternalID,
  @AnalyticsDetails.query.axis: #FREE
  ManufacturingOrderType,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  MRPController,
  @AnalyticsDetails.query.axis: #FREE
  ProductionOrderIsOpen,
  @AnalyticsDetails.query.axis: #FREE
  OperationControlProfile,
  @AnalyticsDetails.query.axis: #FREE
  OperationUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOperations,
  @AnalyticsDetails.query.axis: #COLUMNS
  OpPlannedTotalQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  OpTotalConfirmedYieldQty,
  @AnalyticsDetails.query.axis: #COLUMNS
  OpTotalConfirmedScrapQty,
  @Aggregation.default: #FORMULA
  @AnalyticsDetails.query.axis: #COLUMNS
  @EndUserText.label: 'Scrap Rate'
  $projection.OpTotalConfirmedScrapQty / ( $projection.OpTotalConfirmedYieldQty + $projection.OpTotalConfirmedScrapQty ) as ScrapRate
}
