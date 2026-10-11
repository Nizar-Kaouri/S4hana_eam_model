// ModuPorter EAM migration | Release 1.0.0
// Purpose: NotifTask migration business data
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N2I'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NotifTask migration business data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_NotifTask
  as select from ZEMX_I_NotifTaskData as b
{
      @EndUserText.label: 'Maintenance Notification'
  key b.MaintenanceNotification as MaintenanceNotification,
      @EndUserText.label: 'Task Number'
  key b.TaskNumber as TaskNumber,
      @EndUserText.label: 'Maint Notification Item'
      b.MaintNotificationItem as MaintNotificationItem,
      @EndUserText.label: 'Task Code Group'
      b.TaskCodeGroup as TaskCodeGroup,
      @EndUserText.label: 'Task Code'
      b.TaskCode as TaskCode,
      @EndUserText.label: 'Task Text'
      b.TaskText as TaskText,
      @EndUserText.label: 'Partner Function'
      b.PartnerFunction as PartnerFunction,
      @EndUserText.label: 'Responsible Partner'
      b.ResponsiblePartner as ResponsiblePartner,
      @EndUserText.label: 'Planned Start Date'
      b.PlannedStartDate as PlannedStartDate,
      @EndUserText.label: 'Planned End Date'
      b.PlannedEndDate as PlannedEndDate,
      @EndUserText.label: 'Completion Date'
      b.CompletionDate as CompletionDate,
      @EndUserText.label: 'Is Marked For Deletion'
      b.IsMarkedForDeletion as IsMarkedForDeletion
}
