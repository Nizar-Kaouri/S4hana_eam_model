// ModuPorter EAM migration | Release 1.0.0
// Purpose: NotifCause migration business data
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N1I'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NotifCause migration business data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_NotifCause
  as select from ZEMX_B_NotifCauseData as b
{
      @EndUserText.label: 'Maintenance Notification'
  key b.MaintenanceNotification as MaintenanceNotification,
      @EndUserText.label: 'Maint Notification Item'
  key b.MaintNotificationItem as MaintNotificationItem,
      @EndUserText.label: 'Cause Number'
  key b.CauseNumber as CauseNumber,
      @EndUserText.label: 'Cause Code Group'
      b.CauseCodeGroup as CauseCodeGroup,
      @EndUserText.label: 'Cause Code'
      b.CauseCode as CauseCode,
      @EndUserText.label: 'Cause Text'
      b.CauseText as CauseText,
      @EndUserText.label: 'Is Marked For Deletion'
      b.IsMarkedForDeletion as IsMarkedForDeletion
}
