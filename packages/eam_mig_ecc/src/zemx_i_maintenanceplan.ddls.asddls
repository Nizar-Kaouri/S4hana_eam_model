// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per maintenance plan with category, strategy and the scheduling parameters needed to continue the schedule on S/4HANA.
// Example: Extract all strategy plans: filter MaintenanceStrategy <> ''.
@AbapCatalog.sqlViewName: 'ZEMX_PL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Maintenance plan (migration extract)'
@ObjectModel.representativeKey: 'MaintenancePlan'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_MaintenancePlan
  as select from mpla
    left outer join jest as dlfl on dlfl.objnr = mpla.objnr and dlfl.stat = 'I0076' and dlfl.inact = ''
{
  key mpla.warpl                     as MaintenancePlan,
      mpla.wptxt                     as MaintenancePlanDesc,
      mpla.mptyp                     as MaintenancePlanCategory,
      mpla.strat                     as MaintenanceStrategy,
      // TODO-VERIFY[M] XPL-002: MPLA field names BEGRU, ERSDT, ERNAM, AEDAT
      mpla.begru                     as AuthorizationGroup,
      // TODO-VERIFY[M] XPL-001: MPLA scheduling fields ABRHO, HUNIT, HORIZ, SFAKT, STICH, VSPOS, TOPOS, VSNEG, TONEG, FABKL
      mpla.abrho                     as SchedulingPeriod,
      mpla.hunit                     as SchedulingPeriodUnit,
      mpla.horiz                     as CallHorizonPercent,
      mpla.sfakt                     as CycleModificationFactor,
      mpla.stich                     as SchedulingIndicator,
      mpla.vspos                     as LateCompletionShiftFactor,
      mpla.topos                     as LateCompletionTolerance,
      mpla.vsneg                     as EarlyCompletionShiftFactor,
      mpla.toneg                     as EarlyCompletionTolerance,
      mpla.fabkl                     as FactoryCalendar,
      mpla.objnr                     as ObjectNumber,
      case dlfl.stat when 'I0076' then 'X' else '' end as IsMarkedForDeletion,
      mpla.ersdt                     as CreationDate,
      mpla.ernam                     as CreatedByUser,
      mpla.aedat                     as LastChangeDate
}
