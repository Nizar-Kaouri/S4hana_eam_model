// ZBRG Bridge VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZBRG_R_OrderCompWithProduct: spare-part demand per planning plant and product
//   group.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// LINK VIEW (ships only when modules "eam:maintenance_order" AND "mm:product" are selected).
// DESIGN NOTE: no DCL (transient query); the DCL of ZBRG_R_OrderCompWithProduct applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Spare-Part Demand by Product Group'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZBRG_C_OrderCompProductQ
  provider contract analytical_query
  as projection on ZBRG_R_OrderCompWithProduct
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #ROWS
  ProductGroup,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  ProductType,
  @AnalyticsDetails.query.axis: #FREE
  Plant,
  @AnalyticsDetails.query.axis: #FREE
  MaintenanceOrderType,
  @AnalyticsDetails.query.axis: #FREE
  MaintOrderIsOpen,
  @AnalyticsDetails.query.axis: #FREE
  BaseUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  RequirementQuantityInBaseUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  WithdrawnQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  OpenQuantity,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfComponents
}
