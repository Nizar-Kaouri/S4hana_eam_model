// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Record count of the open maintenance notifications delivered by ZEMX_C_MaintNotificationMig per NotificationType, MaintenancePlanningPlant; compared with the same count on S/4HANA by tools/mig_reconcile.py.
// Example: Export this view before the load and the S/4HANA count view after it; the reconcile tool lists every NotificationType / MaintenancePlanningPlant combination whose counts differ.
@AbapCatalog.sqlViewName: 'ZEMX_CNON'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Open notification count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MaintNotifMigCount
  as select from ZEMX_C_MaintNotificationMig
{
      @EndUserText.label: 'Notification Type'
  key NotificationType         as NotificationType,
      @EndUserText.label: 'Maintenance Planning Plant'
  key MaintenancePlanningPlant as MaintenancePlanningPlant,
      @EndUserText.label: 'Record Count'
      count( * )               as RecordCount
}
group by NotificationType, MaintenancePlanningPlant
