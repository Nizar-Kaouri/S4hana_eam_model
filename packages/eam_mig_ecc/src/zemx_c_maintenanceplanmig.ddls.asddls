// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance plans to migrate with scheduling parameters, restart point and codes translated.
// Example: The load program creates the plan and starts it from LastCompletionDate (no open calls are migrated).
@AbapCatalog.sqlViewName: 'ZEMX_CPL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Maintenance plan (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MaintenancePlanMig
  as select from ZEMX_I_MaintenancePlan as src
    left outer join ZEMX_I_MigrationMap as map01 on map01.MapName = 'MAINTENANCE_PLAN' and map01.SourceValue = src.MaintenancePlan
    left outer join ZEMX_I_MigrationMap as map02 on map02.MapName = 'MAINTENANCE_PLAN_CATEGORY' and map02.SourceValue = src.MaintenancePlanCategory
    left outer join ZEMX_I_MigrationMap as map03 on map03.MapName = 'MAINTENANCE_STRATEGY' and map03.SourceValue = src.MaintenanceStrategy
    left outer join ZEMX_I_MigrationMap as map04 on map04.MapName = 'AUTHORIZATION_GROUP' and map04.SourceValue = src.AuthorizationGroup
    left outer join ZEMX_I_MigrationMap as map05 on map05.MapName = 'UNIT_OF_MEASURE' and map05.SourceValue = src.SchedulingPeriodUnit
    left outer join ZEMX_I_MigrationMap as map06 on map06.MapName = 'FACTORY_CALENDAR' and map06.SourceValue = src.FactoryCalendar
{
  key src.MaintenancePlan            as LegacyMaintenancePlan,
      coalesce( map01.TargetValue, src.MaintenancePlan ) as MaintenancePlan,
      src.MaintenancePlanDesc        as MaintenancePlanDesc,
      coalesce( map02.TargetValue, src.MaintenancePlanCategory ) as MaintenancePlanCategory,
      coalesce( map03.TargetValue, src.MaintenanceStrategy ) as MaintenanceStrategy,
      coalesce( map04.TargetValue, src.AuthorizationGroup ) as AuthorizationGroup,
      src.SchedulingPeriod           as SchedulingPeriod,
      coalesce( map05.TargetValue, src.SchedulingPeriodUnit ) as SchedulingPeriodUnit,
      src.CallHorizonPercent         as CallHorizonPercent,
      src.CycleModificationFactor    as CycleModificationFactor,
      src.SchedulingIndicator        as SchedulingIndicator,
      src.LateCompletionShiftFactor  as LateCompletionShiftFactor,
      src.LateCompletionTolerance    as LateCompletionTolerance,
      src.EarlyCompletionShiftFactor as EarlyCompletionShiftFactor,
      src.EarlyCompletionTolerance   as EarlyCompletionTolerance,
      coalesce( map06.TargetValue, src.FactoryCalendar ) as FactoryCalendar,
      src.LastCompletionDate         as LastCompletionDate,
      src.LastChangeDate             as LastChangeDate
}
where src.IsMarkedForDeletion = ''
