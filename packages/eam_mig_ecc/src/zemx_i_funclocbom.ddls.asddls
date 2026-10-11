// ModuPorter EAM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZEMX_239N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FuncLocBOM'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_FuncLocBOM
  as select from ZEMX_B_FuncLocBOMData as ch
    inner join ZEMX_I_FuncLoc as obj on ch.FunctionalLocation = obj.FunctionalLocation
{
  key ch.FunctionalLocation as FunctionalLocation,
  key ch.Plant as Plant,
  key ch.BOMUsage as BOMUsage,
  key ch.BillOfMaterial as BillOfMaterial,
  key ch.BOMAlternative as BOMAlternative
}
where obj.IsMarkedForDeletion = ''
