// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Cycles of single-cycle and multiple-counter plans and packages of strategy plans: cycle value, unit, text and counter (measuring point) for performance-based cycles.
// Example: Extract the performance-based cycles: filter MeasuringPoint <> ''.
@AbapCatalog.sqlViewName: 'ZEMX_PLC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance plan cycle (migration extract)'
@ObjectModel.representativeKey: 'MaintenancePlanCycle'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #BASIC
define view ZEMX_I_MaintPlanCycle
  as select from mmpt
{
  key mmpt.warpl    as MaintenancePlan,
      // TODO-VERIFY[H] XPL-005: MMPT field names (NUMMER, ZYKL1, ZEIEH, PAK_TEXT, POINT); ZYKL1 is stored as floating point in the SI unit
  key mmpt.nummer   as MaintenancePlanCycle,
      mmpt.zykl1    as CycleValue,
      mmpt.zeieh    as CycleUnit,
      mmpt.pak_text as CycleText,
      mmpt.point    as MeasuringPoint
}
