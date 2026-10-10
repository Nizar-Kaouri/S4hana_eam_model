// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Cycles / packages of the plans in scope with unit and measuring point; cycle values in the SI unit.
// Example: The load program adds the cycles to the plan (converting the cycle value to CycleUnit).
@AbapCatalog.sqlViewName: 'ZEMX_CPLC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance plan cycle (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MaintPlanCycleMig
  as select from ZEMX_I_MaintPlanCycle as src
  association [0..1] to ZEMX_I_MaintenancePlan as _MaintenancePlan on _MaintenancePlan.MaintenancePlan = $projection.MaintenancePlan
{
      @EndUserText.label: 'Maintenance Plan'
  key src.MaintenancePlan      as MaintenancePlan,
      @EndUserText.label: 'Maintenance Plan Cycle'
  key src.MaintenancePlanCycle as MaintenancePlanCycle,
      @EndUserText.label: 'Cycle Value'
      src.CycleValue           as CycleValue,
      @EndUserText.label: 'Cycle Unit'
      src.CycleUnit            as CycleUnit,
      @EndUserText.label: 'Cycle Text'
      src.CycleText            as CycleText,
      @EndUserText.label: 'Measuring Point'
      src.MeasuringPoint       as MeasuringPoint
}
where _MaintenancePlan.IsMarkedForDeletion = ''
