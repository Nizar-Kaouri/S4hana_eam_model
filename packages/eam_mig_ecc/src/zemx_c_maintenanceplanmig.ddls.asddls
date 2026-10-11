// ModuPorter EAM migration | Release 1.0.0
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
      @EndUserText.label: 'Maintenance Plan'
  key src.MaintenancePlan            as MaintenancePlan,
      @EndUserText.label: 'Maintenance Plan Desc'
      src.MaintenancePlanDesc        as MaintenancePlanDesc,
      @EndUserText.label: 'Maintenance Plan Category'
      src.MaintenancePlanCategory    as MaintenancePlanCategory,
      @EndUserText.label: 'Maintenance Strategy'
      src.MaintenanceStrategy        as MaintenanceStrategy,
      @EndUserText.label: 'Authorization Group'
      src.AuthorizationGroup         as AuthorizationGroup,
      @EndUserText.label: 'Scheduling Period'
      src.SchedulingPeriod           as SchedulingPeriod,
      @EndUserText.label: 'Scheduling Period Unit'
      src.SchedulingPeriodUnit       as SchedulingPeriodUnit,
      @EndUserText.label: 'Call Horizon Percent'
      src.CallHorizonPercent         as CallHorizonPercent,
      @EndUserText.label: 'Cycle Modification Factor'
      src.CycleModificationFactor    as CycleModificationFactor,
      @EndUserText.label: 'Scheduling Indicator'
      src.SchedulingIndicator        as SchedulingIndicator,
      @EndUserText.label: 'Late Completion Shift Factor'
      src.LateCompletionShiftFactor  as LateCompletionShiftFactor,
      @EndUserText.label: 'Late Completion Tolerance'
      src.LateCompletionTolerance    as LateCompletionTolerance,
      @EndUserText.label: 'Early Completion Shift Factor'
      src.EarlyCompletionShiftFactor as EarlyCompletionShiftFactor,
      @EndUserText.label: 'Early Completion Tolerance'
      src.EarlyCompletionTolerance   as EarlyCompletionTolerance,
      @EndUserText.label: 'Factory Calendar'
      src.FactoryCalendar            as FactoryCalendar,
      @EndUserText.label: 'Last Completion Date'
      src.LastCompletionDate         as LastCompletionDate,
      @EndUserText.label: 'Last Change Date'
      src.LastChangeDate             as LastChangeDate
}
where src.IsMarkedForDeletion = ''
