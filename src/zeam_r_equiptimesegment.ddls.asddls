// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Installation history cube: equipment time segments with segment duration in days (open
//   segment counted up to today) by functional location, plant and cost center.
// Example: Equipment-days per functional location in a year; average installation duration per equipment category.
// TODO-VERIFY[L] EH-R01: dats_days_between with $session.system_date for the open segment
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Equipment Installation History - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEAM_R_EquipTimeSegment
  as select from ZEAM_I_EquipmentTimeSegment
{
      @ObjectModel.foreignKey.association: '_Equipment'
  key Equipment,
  key ValidityEndDate,
      ValidityStartDate,
      IsCurrentTimeSegment,
      FunctionalLocation,
      SuperordinateEquipment,
      EquipmentCategory,
      TechnicalObjectType,
      AuthorizationGroup,
      MaintenancePlant,
      MaintenancePlanningPlant,
      PlantSection,
      CompanyCode,
      BusinessArea,
      CostCenter,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Time Segments'
      cast( 1 as abap.int4 ) as NumberOfTimeSegments,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Segment Duration (Days)'
      cast( case when ValidityEndDate = '99991231'
                 then dats_days_between( ValidityStartDate, $session.system_date ) + 1
                 else dats_days_between( ValidityStartDate, ValidityEndDate ) + 1 end as abap.int4 ) as SegmentDurationInDays,

      /* Associations */
      _Equipment
}
