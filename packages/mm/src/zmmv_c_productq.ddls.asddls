// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZMMV_R_Product: products per type and group.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZMMV_R_Product applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Product Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZMMV_C_ProductQ
  provider contract analytical_query
  as projection on ZMMV_R_Product
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  ProductType,
  @AnalyticsDetails.query.axis: #ROWS
  ProductGroup,
  @AnalyticsDetails.query.axis: #FREE
  Division,
  @AnalyticsDetails.query.axis: #FREE
  CrossPlantStatus,
  @AnalyticsDetails.query.axis: #FREE
  IsMarkedForDeletion,
  @AnalyticsDetails.query.axis: #FREE
  BaseUnit,
  @AnalyticsDetails.query.axis: #FREE
  AuthorizationGroup,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfProducts,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfDeletionFlagged
}
