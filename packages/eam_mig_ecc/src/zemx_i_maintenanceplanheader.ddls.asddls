// ModuPorter EAM migration | Release 1.0.0
// Purpose: Maintenance plans (MPLA) with category, strategy and scheduling parameters.
// Example: Read the strategy plans: filter MaintenanceStrategy <> ''.
@AbapCatalog.sqlViewName: 'ZEMX_MPLA'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Maintenance plan header'
@ObjectModel.representativeKey: 'MaintenancePlan'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_MaintenancePlanHeader
  as select from mpla
  association [0..1] to ZEMX_I_StatusDeletionFlag as _DeletionFlag on $projection.ObjectNumber = _DeletionFlag.ObjectNumber
{
      @EndUserText.label: 'Maintenance Plan'
  key mpla.warpl as MaintenancePlan,
      @EndUserText.label: 'Maintenance Plan Desc'
      mpla.wptxt as MaintenancePlanDesc,
      @EndUserText.label: 'Maintenance Plan Category'
      mpla.mptyp as MaintenancePlanCategory,
      @EndUserText.label: 'Maintenance Strategy'
      mpla.strat as MaintenanceStrategy,
      // Compatibility note: MPLA field names BEGRU, ERSDT, ERNAM, AEDAT
      @EndUserText.label: 'Authorization Group'
      mpla.begru as AuthorizationGroup,
      // Compatibility note: MPLA scheduling fields ABRHO, HUNIT, HORIZ, SFAKT, STICH, VSPOS, TOPOS, VSNEG, TONEG, FABKL
      @EndUserText.label: 'Scheduling Period'
      mpla.abrho as SchedulingPeriod,
      @EndUserText.label: 'Scheduling Period Unit'
      mpla.hunit as SchedulingPeriodUnit,
      @EndUserText.label: 'Call Horizon Percent'
      mpla.horiz as CallHorizonPercent,
      @EndUserText.label: 'Cycle Modification Factor'
      mpla.sfakt as CycleModificationFactor,
      @EndUserText.label: 'Scheduling Indicator'
      mpla.stich as SchedulingIndicator,
      @EndUserText.label: 'Late Completion Shift Factor'
      mpla.vspos as LateCompletionShiftFactor,
      @EndUserText.label: 'Late Completion Tolerance'
      mpla.topos as LateCompletionTolerance,
      @EndUserText.label: 'Early Completion Shift Factor'
      mpla.vsneg as EarlyCompletionShiftFactor,
      @EndUserText.label: 'Early Completion Tolerance'
      mpla.toneg as EarlyCompletionTolerance,
      @EndUserText.label: 'Factory Calendar'
      mpla.fabkl as FactoryCalendar,
      @EndUserText.label: 'Object Number'
      mpla.objnr as ObjectNumber,
      @EndUserText.label: 'Creation Date'
      mpla.ersdt as CreationDate,
      @EndUserText.label: 'Created By User'
      mpla.ernam as CreatedByUser,
      @EndUserText.label: 'Last Change Date'
      mpla.aedat as LastChangeDate,
      _DeletionFlag
}
