// ZEMX EAM migration - status: draft-unverified (no SAP system; never activated)
// Purpose: NotifCause source data
// Example: Export the selected migration scope; validate keys and row counts before loading.
// TODO-VERIFY[H] XADD-1: Confirm QMUR keys, all selected fields and meanings on the source release; posting-interface targets are provisional.
@AbapCatalog.sqlViewName: 'ZEMX_N1B'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NotifCause source data'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_NotifCauseData
  as select from qmur as t
{
      @EndUserText.label: 'Maintenance Notification'
  key t.qmnum as MaintenanceNotification,
      @EndUserText.label: 'Maint Notification Item'
  key t.fenum as MaintNotificationItem,
      @EndUserText.label: 'Cause Number'
  key t.urnum as CauseNumber,
      @EndUserText.label: 'Cause Code Group'
      t.urgrp as CauseCodeGroup,
      @EndUserText.label: 'Cause Code'
      t.urcod as CauseCode,
      @EndUserText.label: 'Cause Text'
      t.urtxt as CauseText,
      @EndUserText.label: 'Is Marked For Deletion'
      t.kzloesch as IsMarkedForDeletion
}
