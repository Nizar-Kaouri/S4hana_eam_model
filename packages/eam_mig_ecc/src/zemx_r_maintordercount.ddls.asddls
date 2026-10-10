// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of open maintenance orders per MaintenanceOrderType, MaintenancePlanningPlant on the ECC source (migration scope only); compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool reports every MaintenanceOrderType / MaintenancePlanningPlant combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_ORN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Open maintenance order count (reconciliation)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #COMPOSITE
define view ZEMX_R_MaintOrderCount
  as select from ZEMX_I_MaintOrder
{
  key MaintenanceOrderType     as MaintenanceOrderType,
  key MaintenancePlanningPlant as MaintenancePlanningPlant,
      count( * )               as RecordCount
}
where IsTechnicallyCompleted = '' and IsClosed = '' and IsMarkedForDeletion = ''
group by MaintenanceOrderType, MaintenancePlanningPlant
