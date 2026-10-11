// ModuPorter EAM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZEMX_240N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'FuncLocBOMMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_FuncLocBOMMig
  as select from ZEMX_I_FuncLocBOM as src
{
  key src.FunctionalLocation as FunctionalLocation,
  key src.Plant as Plant,
  key src.BOMUsage as BOMUsage,
  key src.BillOfMaterial as BillOfMaterial,
  key src.BOMAlternative as BOMAlternative
}
