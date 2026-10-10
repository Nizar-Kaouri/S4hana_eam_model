// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Maintenance plan with scheduling parameters, deletion flag and the restart point (last call / last completion date).
// Example: Read the restart point of every strategy plan.
@AbapCatalog.sqlViewName: 'ZEMX_PL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Maintenance plan'
@ObjectModel.representativeKey: 'MaintenancePlan'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_MaintenancePlan
  as select from ZEMX_I_MaintenancePlanHeader as pl
  association [0..1] to ZEMX_I_MaintPlanLastCall as _LastCall on $projection.MaintenancePlan = _LastCall.MaintenancePlan
{
      @EndUserText.label: 'Maintenance Plan'
  key pl.MaintenancePlan             as MaintenancePlan,
      @EndUserText.label: 'Maintenance Plan Desc'
      pl.MaintenancePlanDesc         as MaintenancePlanDesc,
      @EndUserText.label: 'Maintenance Plan Category'
      pl.MaintenancePlanCategory     as MaintenancePlanCategory,
      @EndUserText.label: 'Maintenance Strategy'
      pl.MaintenanceStrategy         as MaintenanceStrategy,
      @EndUserText.label: 'Authorization Group'
      pl.AuthorizationGroup          as AuthorizationGroup,
      @EndUserText.label: 'Scheduling Period'
      pl.SchedulingPeriod            as SchedulingPeriod,
      @EndUserText.label: 'Scheduling Period Unit'
      pl.SchedulingPeriodUnit        as SchedulingPeriodUnit,
      @EndUserText.label: 'Call Horizon Percent'
      pl.CallHorizonPercent          as CallHorizonPercent,
      @EndUserText.label: 'Cycle Modification Factor'
      pl.CycleModificationFactor     as CycleModificationFactor,
      @EndUserText.label: 'Scheduling Indicator'
      pl.SchedulingIndicator         as SchedulingIndicator,
      @EndUserText.label: 'Late Completion Shift Factor'
      pl.LateCompletionShiftFactor   as LateCompletionShiftFactor,
      @EndUserText.label: 'Late Completion Tolerance'
      pl.LateCompletionTolerance     as LateCompletionTolerance,
      @EndUserText.label: 'Early Completion Shift Factor'
      pl.EarlyCompletionShiftFactor  as EarlyCompletionShiftFactor,
      @EndUserText.label: 'Early Completion Tolerance'
      pl.EarlyCompletionTolerance    as EarlyCompletionTolerance,
      @EndUserText.label: 'Factory Calendar'
      pl.FactoryCalendar             as FactoryCalendar,
      @EndUserText.label: 'Object Number'
      pl.ObjectNumber                as ObjectNumber,
      @EndUserText.label: 'Is Marked For Deletion'
      case pl._DeletionFlag.StatusCode when 'I0076' then 'X' else '' end as IsMarkedForDeletion,
      @EndUserText.label: 'Creation Date'
      pl.CreationDate                as CreationDate,
      @EndUserText.label: 'Created By User'
      pl.CreatedByUser               as CreatedByUser,
      @EndUserText.label: 'Last Change Date'
      pl.LastChangeDate              as LastChangeDate,
      @EndUserText.label: 'Last Call Number'
      _LastCall.LastCallNumber       as LastCallNumber,
      @EndUserText.label: 'Last Completion Date'
      _LastCall.LastCompletionDate   as LastCompletionDate
}
