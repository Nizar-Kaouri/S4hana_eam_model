// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: NotifActivity migration business data
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N3I'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NotifActivity migration business data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_NotifActivity
  as select from ZEMX_I_NotifActivityData as b
{
      @EndUserText.label: 'Maintenance Notification'
  key b.MaintenanceNotification as MaintenanceNotification,
      @EndUserText.label: 'Activity Number'
  key b.ActivityNumber as ActivityNumber,
      @EndUserText.label: 'Maint Notification Item'
      b.MaintNotificationItem as MaintNotificationItem,
      @EndUserText.label: 'Activity Code Group'
      b.ActivityCodeGroup as ActivityCodeGroup,
      @EndUserText.label: 'Activity Code'
      b.ActivityCode as ActivityCode,
      @EndUserText.label: 'Activity Text'
      b.ActivityText as ActivityText,
      @EndUserText.label: 'Activity Start Date'
      b.ActivityStartDate as ActivityStartDate,
      @EndUserText.label: 'Activity End Date'
      b.ActivityEndDate as ActivityEndDate,
      @EndUserText.label: 'Is Marked For Deletion'
      b.IsMarkedForDeletion as IsMarkedForDeletion
}
