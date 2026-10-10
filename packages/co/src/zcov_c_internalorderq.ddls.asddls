// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZCOV_R_InternalOrder: internal orders per company code and order type.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZCOV_R_InternalOrder applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Internal Order Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZCOV_C_InternalOrderQ
  provider contract analytical_query
  as projection on ZCOV_R_InternalOrder
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  CompanyCode,
  @AnalyticsDetails.query.axis: #ROWS
  OrderType,
  @AnalyticsDetails.query.axis: #FREE
  ControllingArea,
  @AnalyticsDetails.query.axis: #FREE
  ResponsibleCostCenter,
  @AnalyticsDetails.query.axis: #FREE
  ProfitCenter,
  @AnalyticsDetails.query.axis: #FREE
  OrderIsReleased,
  @AnalyticsDetails.query.axis: #FREE
  OrderIsClosed,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfInternalOrders,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOpenInternalOrders
}
