// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Downtime cube: number of malfunctions and breakdowns, total and breakdown downtime in
//   hours, by plant, technical object, notification type and malfunction month.
// Example: Top 10 equipment by breakdown hours in the last quarter; downtime trend per month and plant.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Downtime and Breakdown - Cube'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEAM_I_NotifDowntime
  as select from ZEAM_B_NotifDowntime
  association [1..1] to ZEAM_B_MaintNotif as _MaintenanceNotification on $projection.MaintenanceNotification = _MaintenanceNotification.MaintenanceNotification
{
      @ObjectModel.foreignKey.association: '_MaintenanceNotification'
  key MaintenanceNotification,
      NotificationType,
      MaintPriority,
      MaintenanceObjectIsDown,
      MalfunctionIsClosed,
      MalfunctionStartDate,
      @EndUserText.label: 'Malfunction Start (Year/Month)'
      cast( substring( MalfunctionStartDate, 1, 6 ) as abap.numc( 6 ) ) as MalfunctionStartYearMonth,
      Equipment,
      FunctionalLocation,
      MaintenanceOrder,
      MaintenancePlanningPlant,
      MaintenancePlannerGroup,
      MaintenancePlant,
      PlantSection,
      MainWorkCenter,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Malfunctions'
      cast( 1 as abap.int4 ) as NumberOfMalfunctions,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Breakdowns'
      cast( case when MaintenanceObjectIsDown = 'X' then 1 else 0 end as abap.int4 ) as NumberOfBreakdowns,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Downtime (h)'
      DowntimeInHours,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Breakdown Downtime (h)'
      cast( case when MaintenanceObjectIsDown = 'X' then DowntimeInHours else 0 end as abap.dec( 15, 2 ) ) as BreakdownDowntimeInHours,

      /* Associations */
      _MaintenanceNotification
}
