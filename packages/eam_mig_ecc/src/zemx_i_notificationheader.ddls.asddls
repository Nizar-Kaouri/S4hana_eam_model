// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
define view ZEMX_I_NotificationHeader
  as select from qmel
  association [0..1] to ZEMX_I_WorkCenterHeader as _MainWorkCenter on $projection.MainWorkCenterInternalID = _MainWorkCenter.WorkCenterInternalID
  association [0..1] to ZEMX_I_StatusNotifCompleted as _CompletedFlag on $projection.ObjectNumber = _CompletedFlag.ObjectNumber
  association [0..1] to ZEMX_I_StatusDeletionFlag as _DeletionFlag on $projection.ObjectNumber = _DeletionFlag.ObjectNumber
{
  key qmel.qmnum as MaintenanceNotification,
      qmel.qmart as NotificationType,
      qmel.qmtxt as NotificationText,
      qmel.priok as MaintPriority,
      qmel.artpr as MaintPriorityType,
      qmel.qmdat as NotificationDate,
      qmel.mzeit as NotificationTime,
      qmel.qmnam as ReportedByUser,
      qmel.strmn as RequiredStartDate,
      qmel.ltrmn as RequiredEndDate,
      // TODO-VERIFY[M] XNO-001: QMEL field names ARTPR, QMKAT, QMGRP, QMCOD, STRMN, LTRMN, QMNAM, ARBPL
      qmel.qmkat as NotificationCatalog,
      qmel.qmgrp as NotificationCodeGroup,
      qmel.qmcod as NotificationCode,
      qmel.aufnr as MaintenanceOrder,
      // TODO-VERIFY[H] XNO-002: QMEL-ARBPL holds the CRHD object ID of the main work center
      qmel.arbpl as MainWorkCenterInternalID,
      qmel.objnr as ObjectNumber,
      qmel.erdat as CreationDate,
      qmel.ernam as CreatedByUser,
      qmel.aedat as LastChangeDate,
      _MainWorkCenter,
      _CompletedFlag,
      _DeletionFlag
}
