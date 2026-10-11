// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per maintenance notification with type, priority, processing phase, malfunction
//   period, breakdown indicator, reference objects (as plain fields) and planning data; analytical
//   dimension for every cube that references a notification.
// Example: Feed the downtime / MTBF reports (Batch 4) or list open breakdown notifications per plant.
// Basic interface view / analytical dimension. Equipment, functional location and order are plain
// fields here; associations to those modules live in link views (ZEAM_I_*WithNotif, ZEAM_B_NotifWithOrder).
// TODO-VERIFY[M] NT-001: I_MaintenanceNotification exists, is released (C1) and its key element is MaintenanceNotification
// TODO-VERIFY[M] NT-002: element names NotificationType, NotificationText, MaintPriority, NotifProcessingPhase
// TODO-VERIFY[H] NT-003: breakdown indicator (QMEL-MSAUS equivalent) is named MaintenanceObjectIsDown
// TODO-VERIFY[M] NT-004: malfunction elements MalfunctionStartDate/-Time and MalfunctionEndDate/-Time
// TODO-VERIFY[M] NT-005: processing phase codes 1 outstanding, 2 postponed, 3 in process, 4 completed (QMEL-PHASE)
// TODO-VERIFY[M] NT-006: reference elements Equipment, FunctionalLocation, MaintenanceOrder exist directly in I_MaintenanceNotification
// TODO-VERIFY[M] NT-007: planning elements MaintenancePlanningPlant, MaintenancePlannerGroup, MaintenancePlant, PlantSection, MainWorkCenter
// TODO-VERIFY[L] GEN-C01: cast of a char(1) case expression to data element abap_boolean in a view entity
// TODO-VERIFY[M] NT-008: dates CreationDate, ReportedByUser, RequiredStartDate, RequiredEndDate
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Maintenance Notification'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'MaintenanceNotification'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZEAM_B_MaintNotif
  as select from I_MaintenanceNotification
  association [0..1] to I_Plant       as _MaintenancePlant         on $projection.MaintenancePlant = _MaintenancePlant.Plant
  association [0..1] to I_Plant       as _MaintenancePlanningPlant on $projection.MaintenancePlanningPlant = _MaintenancePlanningPlant.Plant
{
      @ObjectModel.text.element: [ 'NotificationText' ]
  key MaintenanceNotification,
      @Semantics.text: true
      NotificationText,
      NotificationType,
      MaintPriority,
      NotifProcessingPhase,
      cast( case when NotifProcessingPhase = '1' or NotifProcessingPhase = '2' or NotifProcessingPhase = '3'
                 then 'X' else ' ' end as abap_boolean ) as MaintNotifIsOpen,
      MaintenanceObjectIsDown,
      MalfunctionStartDate,
      MalfunctionStartTime,
      MalfunctionEndDate,
      MalfunctionEndTime,
      RequiredStartDate,
      RequiredEndDate,
      CreationDate,
      ReportedByUser,
      Equipment,
      FunctionalLocation,
      MaintenanceOrder,
      @ObjectModel.foreignKey.association: '_MaintenancePlanningPlant'
      MaintenancePlanningPlant,
      MaintenancePlannerGroup,
      @ObjectModel.foreignKey.association: '_MaintenancePlant'
      MaintenancePlant,
      PlantSection,
      MainWorkCenter,

      /* Associations */
      _MaintenancePlant,
      _MaintenancePlanningPlant
}
