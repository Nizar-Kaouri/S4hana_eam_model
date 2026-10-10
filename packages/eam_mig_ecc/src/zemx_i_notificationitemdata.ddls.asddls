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
  key qmfe.qmnum    as MaintenanceNotification,
  key qmfe.fenum    as MaintNotificationItem,
      // TODO-VERIFY[M] XNO-004: QMFE field names OTGRP, OTEIL, FEGRP, FECOD, FETXT, KZLOESCH
      qmfe.otgrp    as ObjectPartCodeGroup,
      qmfe.oteil    as ObjectPartCode,
      qmfe.fegrp    as DamageCodeGroup,
      qmfe.fecod    as DamageCode,
      qmfe.fetxt    as MaintNotifItemText,
      qmfe.kzloesch as IsMarkedForDeletion
}
