// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: NotifTask migration extract
// Example: Export the selected migration scope; validate keys and row counts before loading.
@AbapCatalog.sqlViewName: 'ZEMX_N2C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'NotifTask migration extract'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_NotifTaskMig
  as select from ZEMX_I_NotifTask as src
  association [0..1] to ZEMX_I_MaintNotification as _Parent on _Parent.MaintenanceNotification = $projection.MaintenanceNotification
{
      @EndUserText.label: 'Maintenance Notification'
  key src.MaintenanceNotification as MaintenanceNotification,
      @EndUserText.label: 'Task Number'
  key src.TaskNumber as TaskNumber,
      @EndUserText.label: 'Maint Notification Item'
      src.MaintNotificationItem as MaintNotificationItem,
      @EndUserText.label: 'Task Code Group'
      src.TaskCodeGroup as TaskCodeGroup,
      @EndUserText.label: 'Task Code'
      src.TaskCode as TaskCode,
      @EndUserText.label: 'Task Text'
      src.TaskText as TaskText,
      @EndUserText.label: 'Partner Function'
      src.PartnerFunction as PartnerFunction,
      @EndUserText.label: 'Responsible Partner'
      src.ResponsiblePartner as ResponsiblePartner,
      @EndUserText.label: 'Planned Start Date'
      src.PlannedStartDate as PlannedStartDate,
      @EndUserText.label: 'Planned End Date'
      src.PlannedEndDate as PlannedEndDate,
      @EndUserText.label: 'Completion Date'
      src.CompletionDate as CompletionDate
}
where src.IsMarkedForDeletion = '' and _Parent.IsCompleted = '' and _Parent.IsMarkedForDeletion = ''
