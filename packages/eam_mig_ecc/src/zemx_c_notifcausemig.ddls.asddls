// ModuPorter EAM migration | Release 1.0.0
// Purpose: NotifCause migration extract
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N1C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'NotifCause migration extract'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_NotifCauseMig
  as select from ZEMX_I_NotifCause as src
  association [0..1] to ZEMX_I_MaintNotification as _Parent on _Parent.MaintenanceNotification = $projection.MaintenanceNotification
{
      @EndUserText.label: 'Maintenance Notification'
  key src.MaintenanceNotification as MaintenanceNotification,
      @EndUserText.label: 'Maint Notification Item'
  key src.MaintNotificationItem as MaintNotificationItem,
      @EndUserText.label: 'Cause Number'
  key src.CauseNumber as CauseNumber,
      @EndUserText.label: 'Cause Code Group'
      src.CauseCodeGroup as CauseCodeGroup,
      @EndUserText.label: 'Cause Code'
      src.CauseCode as CauseCode,
      @EndUserText.label: 'Cause Text'
      src.CauseText as CauseText
}
where src.IsMarkedForDeletion = '' and _Parent.IsCompleted = '' and _Parent.IsMarkedForDeletion = ''
