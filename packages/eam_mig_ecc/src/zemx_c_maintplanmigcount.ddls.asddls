// ModuPorter EAM migration | Release 1.0.0
// Purpose: Record count of the maintenance plans delivered by ZEMX_C_MaintenancePlanMig per MaintenancePlanCategory, MaintenanceStrategy.
// Example: Export this source count view to record the selected extraction population by its dimensions.
@AbapCatalog.sqlViewName: 'ZEMX_CPLN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance plan count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MaintPlanMigCount
  as select from ZEMX_C_MaintenancePlanMig
{
      @EndUserText.label: 'Maintenance Plan Category'
  key MaintenancePlanCategory as MaintenancePlanCategory,
      @EndUserText.label: 'Maintenance Strategy'
  key MaintenanceStrategy     as MaintenanceStrategy,
      @EndUserText.label: 'Record Count'
      count( * )              as RecordCount
}
group by MaintenancePlanCategory, MaintenanceStrategy
