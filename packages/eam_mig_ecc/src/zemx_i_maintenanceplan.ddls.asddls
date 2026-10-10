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
  key pl.MaintenancePlan             as MaintenancePlan,
      pl.MaintenancePlanDesc         as MaintenancePlanDesc,
      pl.MaintenancePlanCategory     as MaintenancePlanCategory,
      pl.MaintenanceStrategy         as MaintenanceStrategy,
      pl.AuthorizationGroup          as AuthorizationGroup,
      pl.SchedulingPeriod            as SchedulingPeriod,
      pl.SchedulingPeriodUnit        as SchedulingPeriodUnit,
      pl.CallHorizonPercent          as CallHorizonPercent,
      pl.CycleModificationFactor     as CycleModificationFactor,
      pl.SchedulingIndicator         as SchedulingIndicator,
      pl.LateCompletionShiftFactor   as LateCompletionShiftFactor,
      pl.LateCompletionTolerance     as LateCompletionTolerance,
      pl.EarlyCompletionShiftFactor  as EarlyCompletionShiftFactor,
      pl.EarlyCompletionTolerance    as EarlyCompletionTolerance,
      pl.FactoryCalendar             as FactoryCalendar,
      pl.ObjectNumber                as ObjectNumber,
      case pl._DeletionFlag.StatusCode when 'I0076' then 'X' else '' end as IsMarkedForDeletion,
      pl.CreationDate                as CreationDate,
      pl.CreatedByUser               as CreatedByUser,
      pl.LastChangeDate              as LastChangeDate,
      _LastCall.LastCallNumber       as LastCallNumber,
      _LastCall.LastCompletionDate   as LastCompletionDate
}
