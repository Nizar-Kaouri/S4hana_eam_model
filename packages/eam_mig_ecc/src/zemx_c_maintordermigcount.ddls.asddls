// ModuPorter EAM migration | Release 1.0.0
// Purpose: Record count of the open maintenance orders delivered by ZEMX_C_MaintOrderMig per MaintenanceOrderType, MaintenancePlanningPlant; compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every MaintenanceOrderType / MaintenancePlanningPlant combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_CORN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Open maintenance order count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MaintOrderMigCount
  as select from ZEMX_C_MaintOrderMig
{
      @EndUserText.label: 'Maintenance Order Type'
  key MaintenanceOrderType     as MaintenanceOrderType,
      @EndUserText.label: 'Maintenance Planning Plant'
  key MaintenancePlanningPlant as MaintenancePlanningPlant,
      @EndUserText.label: 'Record Count'
      count( * )               as RecordCount
}
group by MaintenanceOrderType, MaintenancePlanningPlant
