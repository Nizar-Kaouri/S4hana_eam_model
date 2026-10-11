// ZMMV MM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZMMV_I_PurchaseReqnItem: requisition items per plant and purchasing group.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZMMV_I_PurchaseReqnItem applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Purchase Requisition Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZMMV_C_PurchaseReqnQ
  provider contract analytical_query
  as projection on ZMMV_I_PurchaseReqnItem
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  Plant,
  @AnalyticsDetails.query.axis: #ROWS
  PurchasingGroup,
  @AnalyticsDetails.query.axis: #FREE
  PurchaseRequisitionType,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  PurchasingOrganization,
  @AnalyticsDetails.query.axis: #FREE
  AccountAssignmentCategory,
  @AnalyticsDetails.query.axis: #FREE
  PurReqnReleaseStatus,
  @AnalyticsDetails.query.axis: #FREE
  IsDeleted,
  @AnalyticsDetails.query.axis: #FREE
  IsClosed,
  @AnalyticsDetails.query.axis: #FREE
  BaseUnit,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfReqnItems,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOpenReqnItems,
  @AnalyticsDetails.query.axis: #COLUMNS
  RequestedQuantity
}
