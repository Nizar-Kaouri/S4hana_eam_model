// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
  key mpla.warpl as MaintenancePlan,
      mpla.wptxt as MaintenancePlanDesc,
      mpla.mptyp as MaintenancePlanCategory,
      mpla.strat as MaintenanceStrategy,
      // TODO-VERIFY[M] XPL-002: MPLA field names BEGRU, ERSDT, ERNAM, AEDAT
      mpla.begru as AuthorizationGroup,
      // TODO-VERIFY[M] XPL-001: MPLA scheduling fields ABRHO, HUNIT, HORIZ, SFAKT, STICH, VSPOS, TOPOS, VSNEG, TONEG, FABKL
      mpla.abrho as SchedulingPeriod,
      mpla.hunit as SchedulingPeriodUnit,
      mpla.horiz as CallHorizonPercent,
      mpla.sfakt as CycleModificationFactor,
      mpla.stich as SchedulingIndicator,
      mpla.vspos as LateCompletionShiftFactor,
      mpla.topos as LateCompletionTolerance,
      mpla.vsneg as EarlyCompletionShiftFactor,
      mpla.toneg as EarlyCompletionTolerance,
      mpla.fabkl as FactoryCalendar,
      mpla.objnr as ObjectNumber,
      mpla.ersdt as CreationDate,
      mpla.ernam as CreatedByUser,
      mpla.aedat as LastChangeDate,
      _DeletionFlag
}
