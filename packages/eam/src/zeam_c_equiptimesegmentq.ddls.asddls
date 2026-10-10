// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Analytical query on ZEAM_R_EquipTimeSegment. Installation history (equipment-days) per functional location and equipment category.
// Example: Expose in an analytical OData V4 service and open in an analytical list page or SAP Analytics Cloud.
// DESIGN NOTE: no DCL (transient query); the DCL of ZEAM_R_EquipTimeSegment applies (see GEN-Q01).
@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label: 'Equipment Installation History'
@ObjectModel.modelingPattern: #ANALYTICAL_QUERY
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_QUERY ]
@VDM.viewType: #CONSUMPTION
define transient view entity ZEAM_C_EquipTimeSegmentQ
  provider contract analytical_query
  as projection on ZEAM_R_EquipTimeSegment
{
  @AnalyticsDetails.query.axis: #ROWS
  @Consumption.filter: { selectionType: #SINGLE, multipleSelections: true, mandatory: false }
  FunctionalLocation,
  @AnalyticsDetails.query.axis: #ROWS
  EquipmentCategory,
  @AnalyticsDetails.query.axis: #FREE
  Equipment,
  @AnalyticsDetails.query.axis: #FREE
  IsCurrentTimeSegment,
  @AnalyticsDetails.query.axis: #FREE
  SuperordinateEquipment,
  @AnalyticsDetails.query.axis: #FREE
  TechnicalObjectType,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlant,
  @AnalyticsDetails.query.axis: #FREE
  MaintenancePlanningPlant,
  @AnalyticsDetails.query.axis: #FREE
  PlantSection,
  @AnalyticsDetails.query.axis: #FREE
  CostCenter,
  @AnalyticsDetails.query.axis: #FREE
  ValidityStartDate,
  @AnalyticsDetails.query.axis: #FREE
  ValidityEndDate,
  @AnalyticsDetails.query.axis: #COLUMNS
  NumberOfTimeSegments,
  @AnalyticsDetails.query.axis: #COLUMNS
  SegmentDurationInDays
}
