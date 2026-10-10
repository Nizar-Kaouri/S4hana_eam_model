// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: NotifTask source data
// Example: Export the selected migration scope; validate keys and row counts before loading.
// TODO-VERIFY[H] XADD-2: Confirm QMSM keys, all selected fields and meanings on the source release; posting-interface targets are provisional.
@AbapCatalog.sqlViewName: 'ZEMX_N2B'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NotifTask source data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_NotifTaskData
  as select from qmsm as t
{
      @EndUserText.label: 'Maintenance Notification'
  key t.qmnum as MaintenanceNotification,
      @EndUserText.label: 'Task Number'
  key t.manum as TaskNumber,
      @EndUserText.label: 'Maint Notification Item'
      t.fenum as MaintNotificationItem,
      @EndUserText.label: 'Task Code Group'
      t.mngrp as TaskCodeGroup,
      @EndUserText.label: 'Task Code'
      t.mncod as TaskCode,
      @EndUserText.label: 'Task Text'
      t.matxt as TaskText,
      @EndUserText.label: 'Partner Function'
      t.parvw as PartnerFunction,
      @EndUserText.label: 'Responsible Partner'
      t.parnr as ResponsiblePartner,
      @EndUserText.label: 'Planned Start Date'
      t.pster as PlannedStartDate,
      @EndUserText.label: 'Planned End Date'
      t.peter as PlannedEndDate,
      @EndUserText.label: 'Completion Date'
      t.erldat as CompletionDate,
      @EndUserText.label: 'Is Marked For Deletion'
      t.kzloesch as IsMarkedForDeletion
}
