// ModuPorter EAM migration | Release 1.0.0
// Purpose: EquipBOMAssign source data
// Example: Export the selected migration scope; validate keys and row counts before loading.
// Compatibility note: Confirm EQST keys, all selected fields and meanings on the source release; posting-interface targets are provisional.
@AbapCatalog.sqlViewName: 'ZEMX_N8B'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'EquipBOMAssign source data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_EquipBOMAssignData
  as select from eqst as t
{
@EndUserText.label: 'Equipment'
  key t.equnr as Equipment,
      @EndUserText.label: 'Plant'
  key t.werks as Plant,
      @EndUserText.label: 'B O M Usage'
  key t.stlan as BOMUsage,
      @EndUserText.label: 'B O M Alternative'
  key t.stlal as BOMAlternative,
      @EndUserText.label: 'Bill Of Material'
      t.stlnr as BillOfMaterial
}
