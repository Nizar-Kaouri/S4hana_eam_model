// ZQMV QM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZQMV_R_QualityNotif: notifications per plant and type.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZQMV_R_QualityNotif applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Quality Notification Analysis'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZQMV_C_QualityNotifQ
  provider contract analytical_query
  as projection on ZQMV_R_QualityNotif
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  Plant,
  @AnalyticsDetails.query.axis: #ROWS
  NotificationType,
  @AnalyticsDetails.query.axis: #FREE
  CreationYearMonth,
  @AnalyticsDetails.query.axis: #FREE
  NotificationPriority,
  @AnalyticsDetails.query.axis: #FREE
  NotifProcessingPhase,
  @AnalyticsDetails.query.axis: #FREE
  QualityNotifIsOpen,
  @AnalyticsDetails.query.axis: #FREE
  Material,
  @AnalyticsDetails.query.axis: #FREE
  Supplier,
  @AnalyticsDetails.query.axis: #FREE
  Customer,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfQualityNotifs,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfOpenQualityNotifs
}
