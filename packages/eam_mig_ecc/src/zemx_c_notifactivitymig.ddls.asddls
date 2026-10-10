// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: NotifActivity migration extract
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N3C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'NotifActivity migration extract'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_NotifActivityMig
  as select from ZEMX_I_NotifActivity as src
  association [0..1] to ZEMX_I_MaintNotification as _Parent on _Parent.MaintenanceNotification = $projection.MaintenanceNotification
{
      @EndUserText.label: 'Maintenance Notification'
  key src.MaintenanceNotification as MaintenanceNotification,
      @EndUserText.label: 'Activity Number'
  key src.ActivityNumber as ActivityNumber,
      @EndUserText.label: 'Maint Notification Item'
      src.MaintNotificationItem as MaintNotificationItem,
      @EndUserText.label: 'Activity Code Group'
      src.ActivityCodeGroup as ActivityCodeGroup,
      @EndUserText.label: 'Activity Code'
      src.ActivityCode as ActivityCode,
      @EndUserText.label: 'Activity Text'
      src.ActivityText as ActivityText,
      @EndUserText.label: 'Activity Start Date'
      src.ActivityStartDate as ActivityStartDate,
      @EndUserText.label: 'Activity End Date'
      src.ActivityEndDate as ActivityEndDate
}
where src.IsMarkedForDeletion = '' and _Parent.IsCompleted = '' and _Parent.IsMarkedForDeletion = ''
