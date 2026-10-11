// ModuPorter EAM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZEMX_235N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaintPlanCycle'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_MaintPlanCycle
  as select from ZEMX_B_MaintPlanCycle as src
{
  key src.MaintenancePlan as MaintenancePlan,
  key src.MaintenancePlanCycle as MaintenancePlanCycle,
      src.CycleValue as CycleValue,
      src.CycleUnit as CycleUnit,
      src.CycleText as CycleText,
      src.MeasuringPoint as MeasuringPoint
}
