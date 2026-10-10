// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Items of PM notifications (object part and damage codes with text).
// Example: Extract the items of the open notifications: join on MaintenanceNotification with ZEMX_I_MaintNotification.
@AbapCatalog.sqlViewName: 'ZEMX_NOI'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Maintenance notification item (migration extract)'
@ObjectModel.representativeKey: 'MaintNotificationItem'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_MaintNotifItem
  as select from qmfe
    inner join qmih on qmih.qmnum = qmfe.qmnum
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
