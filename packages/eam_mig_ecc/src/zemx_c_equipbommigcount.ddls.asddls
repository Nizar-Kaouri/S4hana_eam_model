// ModuPorter EAM migration | Release 1.0.0
// Purpose: Equipment BOM assignment count
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_BOMCNT'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Equipment BOM assignment count'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_EquipBOMMigCount
  as select from ZEMX_C_EquipBOMAssignMig as src
{
      @EndUserText.label: 'Plant'
  key src.Plant as Plant,
      @EndUserText.label: 'B O M Usage'
  key src.BOMUsage as BOMUsage,
      @EndUserText.label: 'Record Count'
      count( * ) as RecordCount
}
group by src.Plant, src.BOMUsage
