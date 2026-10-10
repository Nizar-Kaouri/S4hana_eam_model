// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Fleet reliability per equipment for a reporting period: the whole current equipment
//   population (also equipment without any breakdown) with breakdowns, breakdown downtime and
//   observation time, so that fleet MTBF / MTTR aggregate correctly. Fixes the limitation of
//   ZEAM_R_ReliabilityKPI (objects without breakdowns missing).
// Example: Fleet MTBF per equipment category and plant for the last 12 months.
// LINK VIEW (ships only when modules "rpt_reliability" AND "equipment" are selected).
// TODO-VERIFY[H] LNK-010: left outer join of a view entity with a parameterized aggregating view entity plus GROUP BY and parameter expression (see RPT-R01)
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #CUBE
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Equipment Fleet Reliability'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.modelingPattern: #ANALYTICAL_CUBE
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_PROVIDER, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #COMPOSITE
define view entity ZEAM_R_EquipmentReliability
  with parameters
    P_StartDate : abap.dats,
    P_EndDate   : abap.dats
  as select from    ZEAM_I_Equipment as Equipment
    left outer join ZEAM_R_ReliabilityKPI( P_StartDate: $parameters.P_StartDate,
                                           P_EndDate:   $parameters.P_EndDate ) as Kpi on Kpi.Equipment = Equipment.Equipment
{
  key Equipment.Equipment,
      Equipment.EquipmentCategory,
      Equipment.TechnicalObjectType,
      Equipment.AuthorizationGroup,
      Equipment.MaintenancePlant,
      Equipment.MaintenancePlanningPlant,
      Equipment.PlantSection,
      Equipment.ABCIndicator,
      Equipment.AssetManufacturerName,
      Equipment.CompanyCode,
      Equipment.BusinessArea,
      Equipment.CostCenter,

      /* Measures */
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Breakdowns'
      cast( coalesce( sum( Kpi.NumberOfBreakdowns ), 0 ) as abap.int4 ) as NumberOfBreakdowns,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Breakdown Downtime (h)'
      cast( coalesce( sum( Kpi.TotalDowntimeInHours ), 0 ) as abap.dec( 15, 2 ) ) as TotalDowntimeInHours,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Observation Time (h)'
      cast( ( dats_days_between( $parameters.P_StartDate, $parameters.P_EndDate ) + 1 ) * 24
            as abap.dec( 15, 2 ) ) as ObservationTimeInHours,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Number of Equipment'
      cast( 1 as abap.int4 ) as NumberOfEquipments
}
group by
  Equipment.Equipment,
  Equipment.EquipmentCategory,
  Equipment.TechnicalObjectType,
  Equipment.AuthorizationGroup,
  Equipment.MaintenancePlant,
  Equipment.MaintenancePlanningPlant,
  Equipment.PlantSection,
  Equipment.ABCIndicator,
  Equipment.AssetManufacturerName,
  Equipment.CompanyCode,
  Equipment.BusinessArea,
  Equipment.CostCenter
