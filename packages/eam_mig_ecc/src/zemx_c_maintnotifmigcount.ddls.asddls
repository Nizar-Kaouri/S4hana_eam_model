// ModuPorter EAM migration | Release 1.0.0
// Purpose: Record count of the open maintenance notifications delivered by ZEMX_C_MaintNotificationMig per NotificationType, MaintenancePlanningPlant.
// Example: Export this source count view to record the selected extraction population by its dimensions.
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
