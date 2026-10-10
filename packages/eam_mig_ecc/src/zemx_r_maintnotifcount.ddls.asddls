// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of open maintenance notifications per NotificationType, MaintenancePlanningPlant on the ECC source (migration scope only); compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool reports every NotificationType / MaintenancePlanningPlant combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_NOC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Open notification count (reconciliation)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #COMPOSITE
define view ZEMX_R_MaintNotifCount
  as select from ZEMX_I_MaintNotification
{
  key NotificationType         as NotificationType,
  key MaintenancePlanningPlant as MaintenancePlanningPlant,
      count( * )               as RecordCount
}
where IsCompleted = '' and IsMarkedForDeletion = ''
group by NotificationType, MaintenancePlanningPlant
