// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Notifications that have a maintenance order assigned, with order type, open flag and
//   dates of that order (path expressions) and an association to the order.
// Example: Lead time from notification creation to order creation; notifications whose order is still open.
// LINK VIEW (ships only when modules "maintenance_notification" AND "maintenance_order" are selected).
// Authorization: notification conditions only (inherited from ZEAM_I_MaintNotif); order
// authorizations apply when the consumer follows _MaintenanceOrder.
// TODO-VERIFY[M] LNK-003: QMEL-AUFNR (notification's MaintenanceOrder) is the leading link; orders created with several notifications (object list) are not covered
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Notification with Maintenance Order'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MaintenanceNotification'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZEAM_I_NotifWithOrder
  as select from ZEAM_I_MaintNotif
  association [0..1] to ZEAM_I_MaintOrder as _MaintenanceOrder on $projection.MaintenanceOrder = _MaintenanceOrder.MaintenanceOrder
{
  key MaintenanceNotification,
      @ObjectModel.foreignKey.association: '_MaintenanceOrder'
      MaintenanceOrder,
      NotificationType,
      MaintenanceObjectIsDown,
      CreationDate,
      MaintenancePlanningPlant,
      MaintenancePlannerGroup,
      MaintenancePlant,
      PlantSection,

      /* Order attributes (path expressions) */
      _MaintenanceOrder.MaintenanceOrderType,
      _MaintenanceOrder.MaintOrderIsOpen,
      _MaintenanceOrder.CreationDate as MaintOrderCreationDate,
      _MaintenanceOrder.TechnicalCompletionDate,

      /* Associations */
      _MaintenanceOrder
}
where
  MaintenanceOrder <> ''
