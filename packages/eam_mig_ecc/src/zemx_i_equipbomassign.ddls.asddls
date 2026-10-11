// ModuPorter EAM migration | Release 1.0.0
// Purpose: EquipBOMAssign migration business data
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N8I'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'EquipBOMAssign migration business data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_EquipBOMAssign
  as select from ZEMX_I_EquipBOMAssignData as b
{
@EndUserText.label: 'Equipment'
  key b.Equipment as Equipment,
      @EndUserText.label: 'Plant'
  key b.Plant as Plant,
      @EndUserText.label: 'B O M Usage'
  key b.BOMUsage as BOMUsage,
      @EndUserText.label: 'B O M Alternative'
  key b.BOMAlternative as BOMAlternative,
      @EndUserText.label: 'Bill Of Material'
      b.BillOfMaterial as BillOfMaterial
}
