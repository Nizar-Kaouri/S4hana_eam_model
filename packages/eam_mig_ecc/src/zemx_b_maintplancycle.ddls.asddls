// ModuPorter EAM migration | Release 1.0.0
// Purpose: Cycles of single-cycle and multiple-counter plans and packages of strategy plans (MMPT).
// Example: Read the performance-based cycles: filter MeasuringPoint <> ''.
@AbapCatalog.sqlViewName: 'ZEMX_MMPT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Maintenance plan cycle'
@ObjectModel.representativeKey: 'MaintenancePlanCycle'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #BASIC
define view ZEMX_B_MaintPlanCycle
  as select from mmpt
{
      @EndUserText.label: 'Maintenance Plan'
  key mmpt.warpl    as MaintenancePlan,
      // Compatibility note: MMPT field names (NUMMER, ZYKL1, ZEIEH, PAK_TEXT, POINT); ZYKL1 is stored as floating point in the SI unit
      @EndUserText.label: 'Maintenance Plan Cycle'
  key mmpt.nummer   as MaintenancePlanCycle,
      @EndUserText.label: 'Cycle Value'
      mmpt.zykl1    as CycleValue,
      @EndUserText.label: 'Cycle Unit'
      mmpt.zeieh    as CycleUnit,
      @EndUserText.label: 'Cycle Text'
      mmpt.pak_text as CycleText,
      @EndUserText.label: 'Measuring Point'
      mmpt.point    as MeasuringPoint
}
