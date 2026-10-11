// ModuPorter EAM migration | Release 1.0.0
// Purpose: NotifActivity source data
// Example: Export the selected migration scope; validate keys and row counts before loading.
// Compatibility note: Confirm QMMA keys, all selected fields and meanings on the source release; posting-interface targets are provisional.
@AbapCatalog.sqlViewName: 'ZEMX_N3B'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NotifActivity source data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_NotifActivityData
  as select from qmma as t
{
      @EndUserText.label: 'Maintenance Notification'
  key t.qmnum as MaintenanceNotification,
      @EndUserText.label: 'Activity Number'
  key t.manum as ActivityNumber,
      @EndUserText.label: 'Maint Notification Item'
      t.fenum as MaintNotificationItem,
      @EndUserText.label: 'Activity Code Group'
      t.mngrp as ActivityCodeGroup,
      @EndUserText.label: 'Activity Code'
      t.mncod as ActivityCode,
      @EndUserText.label: 'Activity Text'
      t.matxt as ActivityText,
      @EndUserText.label: 'Activity Start Date'
      t.startdat as ActivityStartDate,
      @EndUserText.label: 'Activity End Date'
      t.enddat as ActivityEndDate,
      @EndUserText.label: 'Is Marked For Deletion'
      t.kzloesch as IsMarkedForDeletion
}
