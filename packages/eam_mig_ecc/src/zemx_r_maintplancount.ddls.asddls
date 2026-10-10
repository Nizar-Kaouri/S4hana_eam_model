// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of maintenance plans per MaintenancePlanCategory, MaintenanceStrategy on the ECC source (migration scope only); compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool reports every MaintenancePlanCategory / MaintenanceStrategy combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_PLN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance plan count (reconciliation)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #COMPOSITE
define view ZEMX_R_MaintPlanCount
  as select from ZEMX_I_MaintenancePlan
{
  key MaintenancePlanCategory as MaintenancePlanCategory,
  key MaintenanceStrategy     as MaintenanceStrategy,
      count( * )              as RecordCount
}
where IsMarkedForDeletion = ''
group by MaintenancePlanCategory, MaintenanceStrategy
