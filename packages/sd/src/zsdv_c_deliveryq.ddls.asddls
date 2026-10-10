// ZSDV SD VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZSDV_R_DeliveryItem: delivery items per shipping point, split by on-time flag.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZSDV_R_DeliveryItem applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Outbound Delivery Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZSDV_C_DeliveryQ
  provider contract analytical_query
  as projection on ZSDV_R_DeliveryItem
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  ShippingPoint,
  @AnalyticsDetails.query.axis: #ROWS
  DeliveryIsOnTime,
  @AnalyticsDetails.query.axis: #FREE
  SalesOrganization,
  @AnalyticsDetails.query.axis: #FREE
  ShipToParty,
  @AnalyticsDetails.query.axis: #FREE
  Plant,
  @AnalyticsDetails.query.axis: #FREE
  StorageLocation,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  GoodsIssueIsPosted,
  @AnalyticsDetails.query.axis: #FREE
  DeliveryQuantityUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfDeliveryItems,
  @AnalyticsDetails.query.axis: #COLUMNS
  ActualDeliveryQuantity
}
