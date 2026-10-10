// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Cycles / packages of the plans in scope with unit and measuring point translated; cycle values in the SI unit.
// Example: The load program adds the cycles to the plan (converting the cycle value to CycleUnit).
@AbapCatalog.sqlViewName: 'ZEMX_CPLC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance plan cycle (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MaintPlanCycleMig
  as select from ZEMX_I_MaintPlanCycle as src
    inner join ZEMX_I_MaintenancePlan as obj on obj.MaintenancePlan = src.MaintenancePlan
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'MAINTENANCE_PLAN' and map01.SourceValue = src.MaintenancePlan
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'UNIT_OF_MEASURE' and map02.SourceValue = src.CycleUnit
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'MEASURING_POINT' and map03.SourceValue = src.MeasuringPoint
{
  key src.MaintenancePlan            as LegacyMaintenancePlan,
  key src.MaintenancePlanCycle       as MaintenancePlanCycle,
      coalesce( map01.TargetValue, src.MaintenancePlan ) as MaintenancePlan,
      src.CycleValue                 as CycleValue,
      coalesce( map02.TargetValue, src.CycleUnit ) as CycleUnit,
      src.CycleText                  as CycleText,
      coalesce( map03.TargetValue, src.MeasuringPoint ) as MeasuringPoint
}
where obj.IsMarkedForDeletion = ''
