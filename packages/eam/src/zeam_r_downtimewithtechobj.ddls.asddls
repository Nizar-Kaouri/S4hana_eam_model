// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Downtime cube enriched with technical object master data (foreign keys to equipment and
//   functional location dimensions plus equipment category, ABC indicator, manufacturer, location category).
// Example: Breakdown hours per equipment category and manufacturer; downtime of ABC-class A equipment.
// LINK VIEW (ships only when modules "rpt_downtime" AND "equipment" AND "functional_location" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Downtime with Technical Object'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEAM_R_DowntimeWithTechObj
  as select from ZEAM_R_NotifDowntime
  association [0..1] to ZEAM_I_Equipment as _Equipment          on $projection.Equipment = _Equipment.Equipment
  association [0..1] to ZEAM_I_FuncLoc   as _FunctionalLocation on $projection.FunctionalLocation = _FunctionalLocation.FunctionalLocation
{
  key MaintenanceNotification,
      NotificationType,
      MaintPriority,
      MaintenanceObjectIsDown,
      MalfunctionIsClosed,
      MalfunctionStartYearMonth,
      MaintenancePlanningPlant,
      MaintenancePlannerGroup,
      MaintenancePlant,
      PlantSection,
      MainWorkCenter,
      @ObjectModel.foreignKey.association: '_Equipment'
      Equipment,
      @ObjectModel.foreignKey.association: '_FunctionalLocation'
      FunctionalLocation,

      /* Measures */
      @Aggregation.default: #SUM
      NumberOfMalfunctions,
      @Aggregation.default: #SUM
      NumberOfBreakdowns,
      @Aggregation.default: #SUM
      DowntimeInHours,
      @Aggregation.default: #SUM
      BreakdownDowntimeInHours,

      /* Technical object attributes (path expressions) */
      _Equipment.EquipmentCategory,
      _Equipment.TechnicalObjectType,
      _Equipment.ABCIndicator,
      _Equipment.AssetManufacturerName,
      _FunctionalLocation.FunctionalLocationCategory,
      _FunctionalLocation.FunctionalLocationLabelName,

      /* Associations */
      _Equipment,
      _FunctionalLocation
}
