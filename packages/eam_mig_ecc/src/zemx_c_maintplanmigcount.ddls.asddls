// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of the maintenance plans delivered by ZEMX_C_MaintenancePlanMig per MaintenancePlanCategory, MaintenanceStrategy; compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every MaintenancePlanCategory / MaintenanceStrategy combination whose counts differ.
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
