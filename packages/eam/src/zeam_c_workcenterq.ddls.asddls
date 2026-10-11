// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZEAM_I_WorkCenter. Maintenance work centers per plant and category.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZEAM_I_WorkCenter applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Work Center Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_WorkCenterQ
  provider contract analytical_query
  as projection on ZEAM_I_WorkCenter
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  Plant,
  @AnalyticsDetails.query.axis: #ROWS
  WorkCenterCategoryCode,
  @AnalyticsDetails.query.axis: #FREE
  WorkCenterResponsible,
  @AnalyticsDetails.query.axis: #FREE
  WorkCenter,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfWorkCenters
}
