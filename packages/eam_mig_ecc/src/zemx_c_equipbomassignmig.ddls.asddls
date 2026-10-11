// ModuPorter EAM migration | Release 1.0.0
// Purpose: EquipBOMAssign migration extract
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N8C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'EquipBOMAssign migration extract'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_EquipBOMAssignMig
  as select from ZEMX_I_EquipBOMAssign as src
  association [0..1] to ZEMX_I_Equipment as _Parent on _Parent.Equipment = $projection.Equipment
{
@EndUserText.label: 'Equipment'
  key src.Equipment as Equipment,
      @EndUserText.label: 'Plant'
  key src.Plant as Plant,
      @EndUserText.label: 'B O M Usage'
  key src.BOMUsage as BOMUsage,
      @EndUserText.label: 'B O M Alternative'
  key src.BOMAlternative as BOMAlternative,
      @EndUserText.label: 'Bill Of Material'
      src.BillOfMaterial as BillOfMaterial
}
where _Parent.IsMarkedForDeletion = ''
