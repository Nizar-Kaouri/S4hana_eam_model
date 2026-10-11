// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Reliability base per planning plant and technical object for a reporting period
//   (parameters): number of closed breakdowns, total breakdown downtime and observation time.
//   MTTR = downtime / breakdowns, MTBF = (observation time - downtime) / breakdowns are computed in
//   ZEAM_C_ReliabilityQ so that they aggregate correctly over any drill-down.
// Example: MTBF / MTTR per equipment for the last 12 months; fleet MTBF per plant.
// Module rpt_reliability has a hard dependency on rpt_downtime.
// KNOWN LIMITATION: only technical objects with at least one breakdown in the period appear;
//   fleet MTBF over objects without breakdowns needs the equipment population (see LNK-010, Batch 5).
// TODO-VERIFY[H] RPT-R01: parameter expression (observation hours) as a non-grouped element of an aggregating view entity
// TODO-VERIFY[H] RPT-R03: observation time is counted once per result row (plant, equipment, location); an equipment moved between locations in the period is counted twice
// TODO-VERIFY[M] RPT-R02: GROUP BY view entity with @Analytics.dataCategory: #CUBE and parameters
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Reliability KPI Base (MTBF / MTTR)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEAM_I_ReliabilityKPI
  with parameters
    P_StartDate : abap.dats,
    P_EndDate   : abap.dats
  as select from ZEAM_B_NotifDowntime
{
  key MaintenancePlanningPlant,
  key MaintenancePlant,
  key Equipment,
  key FunctionalLocation,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Breakdowns'
      cast( count( * ) as abap.int4 ) as NumberOfBreakdowns,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Breakdown Downtime (h)'
      cast( sum( DowntimeInHours ) as abap.dec( 15, 2 ) ) as TotalDowntimeInHours,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Observation Time (h)'
      cast( ( dats_days_between( $parameters.P_StartDate, $parameters.P_EndDate ) + 1 ) * 24
            as abap.dec( 15, 2 ) ) as ObservationTimeInHours
}
where
      MaintenanceObjectIsDown = 'X'
  and MalfunctionIsClosed     = 'X'
  and MalfunctionStartDate    between $parameters.P_StartDate and $parameters.P_EndDate
group by
  MaintenancePlanningPlant,
  MaintenancePlant,
  Equipment,
  FunctionalLocation
