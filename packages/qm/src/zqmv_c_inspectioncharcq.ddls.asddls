// ZQMV QM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZQMV_R_InspectionCharc: rejected characteristics per plant.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZQMV_R_InspectionCharc applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Inspection Result Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZQMV_C_InspectionCharcQ
  provider contract analytical_query
  as projection on ZQMV_R_InspectionCharc
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  Plant,
  @AnalyticsDetails.query.axis: #ROWS
  InspectionCharacteristicText,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  Supplier,
  @AnalyticsDetails.query.axis: #FREE
  InspectionLotOrigin,
  @AnalyticsDetails.query.axis: #FREE
  InspectionSpecification,
  @AnalyticsDetails.query.axis: #FREE
  InspectionValuationResult,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfCharacteristics,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfRejectedCharcs,
  @AnalyticsDetails.query.axis: #COLUMNS
  InspectionResultNrOfDefects
}
