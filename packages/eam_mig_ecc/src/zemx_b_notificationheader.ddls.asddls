// ModuPorter EAM migration | Release 1.0.0
// Purpose: Notification headers (QMEL): type, texts, dates, priority, coding, order reference and object number.
// Example: Read the notifications created in 2025.
@AbapCatalog.sqlViewName: 'ZEMX_QMEL'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Notification header'
@ObjectModel.representativeKey: 'MaintenanceNotification'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_B_NotificationHeader
  as select from qmel
  association [0..1] to ZEMX_B_WorkCenterHeader as _MainWorkCenter on $projection.MainWorkCenterInternalID = _MainWorkCenter.WorkCenterInternalID
  association [0..1] to ZEMX_B_StatusNotifCompleted as _CompletedFlag on $projection.ObjectNumber = _CompletedFlag.ObjectNumber
  association [0..1] to ZEMX_B_StatusDeletionFlag as _DeletionFlag on $projection.ObjectNumber = _DeletionFlag.ObjectNumber
{
      @EndUserText.label: 'Maintenance Notification'
  key qmel.qmnum as MaintenanceNotification,
      @EndUserText.label: 'Notification Type'
      qmel.qmart as NotificationType,
      @EndUserText.label: 'Notification Text'
      qmel.qmtxt as NotificationText,
      @EndUserText.label: 'Maint Priority'
      qmel.priok as MaintPriority,
      @EndUserText.label: 'Maint Priority Type'
      qmel.artpr as MaintPriorityType,
      @EndUserText.label: 'Notification Date'
      qmel.qmdat as NotificationDate,
      @EndUserText.label: 'Notification Time'
      qmel.mzeit as NotificationTime,
      @EndUserText.label: 'Reported By User'
      qmel.qmnam as ReportedByUser,
      @EndUserText.label: 'Required Start Date'
      qmel.strmn as RequiredStartDate,
      @EndUserText.label: 'Required End Date'
      qmel.ltrmn as RequiredEndDate,
      // Compatibility note: QMEL field names ARTPR, QMKAT, QMGRP, QMCOD, STRMN, LTRMN, QMNAM, ARBPL
      @EndUserText.label: 'Notification Catalog'
      qmel.qmkat as NotificationCatalog,
      @EndUserText.label: 'Notification Code Group'
      qmel.qmgrp as NotificationCodeGroup,
      @EndUserText.label: 'Notification Code'
      qmel.qmcod as NotificationCode,
      @EndUserText.label: 'Maintenance Order'
      qmel.aufnr as MaintenanceOrder,
      // Compatibility note: QMEL-ARBPL holds the CRHD object ID of the main work center
      @EndUserText.label: 'Main Work Center Internal ID'
      qmel.arbpl as MainWorkCenterInternalID,
      @EndUserText.label: 'Object Number'
      qmel.objnr as ObjectNumber,
      @EndUserText.label: 'Creation Date'
      qmel.erdat as CreationDate,
      @EndUserText.label: 'Created By User'
      qmel.ernam as CreatedByUser,
      @EndUserText.label: 'Last Change Date'
      qmel.aedat as LastChangeDate,
      _MainWorkCenter,
      _CompletedFlag,
      _DeletionFlag
}
