// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Notification items (QMFE): object part and damage codes with text.
// Example: Read the items of notification 10000001.
@AbapCatalog.sqlViewName: 'ZEMX_QMFE'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Notification item'
@ObjectModel.representativeKey: 'MaintNotificationItem'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_NotificationItemData
  as select from qmfe
{
      @EndUserText.label: 'Maintenance Notification'
  key qmfe.qmnum    as MaintenanceNotification,
      @EndUserText.label: 'Maint Notification Item'
  key qmfe.fenum    as MaintNotificationItem,
      // TODO-VERIFY[M] XNO-004: QMFE field names OTGRP, OTEIL, FEGRP, FECOD, FETXT, KZLOESCH
      @EndUserText.label: 'Object Part Code Group'
      qmfe.otgrp    as ObjectPartCodeGroup,
      @EndUserText.label: 'Object Part Code'
      qmfe.oteil    as ObjectPartCode,
      @EndUserText.label: 'Damage Code Group'
      qmfe.fegrp    as DamageCodeGroup,
      @EndUserText.label: 'Damage Code'
      qmfe.fecod    as DamageCode,
      @EndUserText.label: 'Maint Notif Item Text'
      qmfe.fetxt    as MaintNotifItemText,
      @EndUserText.label: 'Is Marked For Deletion'
      qmfe.kzloesch as IsMarkedForDeletion
}
