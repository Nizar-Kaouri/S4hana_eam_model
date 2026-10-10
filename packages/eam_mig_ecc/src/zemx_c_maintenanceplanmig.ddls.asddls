// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance plans to migrate with scheduling parameters and restart point.
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
{
  key src.MaintenancePlan            as MaintenancePlan,
      src.MaintenancePlanDesc        as MaintenancePlanDesc,
      src.MaintenancePlanCategory    as MaintenancePlanCategory,
      src.MaintenanceStrategy        as MaintenanceStrategy,
      src.AuthorizationGroup         as AuthorizationGroup,
      src.SchedulingPeriod           as SchedulingPeriod,
      src.SchedulingPeriodUnit       as SchedulingPeriodUnit,
      src.CallHorizonPercent         as CallHorizonPercent,
      src.CycleModificationFactor    as CycleModificationFactor,
      src.SchedulingIndicator        as SchedulingIndicator,
      src.LateCompletionShiftFactor  as LateCompletionShiftFactor,
      src.LateCompletionTolerance    as LateCompletionTolerance,
      src.EarlyCompletionShiftFactor as EarlyCompletionShiftFactor,
      src.EarlyCompletionTolerance   as EarlyCompletionTolerance,
      src.FactoryCalendar            as FactoryCalendar,
      src.LastCompletionDate         as LastCompletionDate,
      src.LastChangeDate             as LastChangeDate
}
where src.IsMarkedForDeletion = ''
