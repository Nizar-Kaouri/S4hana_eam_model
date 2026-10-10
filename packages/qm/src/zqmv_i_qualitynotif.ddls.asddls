// ZQMV QM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: One row per quality notification: type (supplier, internal, customer complaint), text, priority,
//   processing phase, material, plant, batch, supplier, customer, inspection lot and dates; derived open flag.
// Example: Open supplier complaints per plant; customer complaints per material.
// TODO-VERIFY[H] QM-020: SAP released view for quality notifications is I_QualityNotification (name not confirmed)
// TODO-VERIFY[M] QM-021: elements NotificationType, NotificationText, NotificationPriority, NotifProcessingPhase (same phase codes as PM notifications)
// TODO-VERIFY[M] QM-022: reference elements Material, Plant, Batch, Supplier, Customer, InspectionLot, CreationDate, CompletionDate
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataCategory: #DIMENSION
@Analytics.internalName: #LOCAL
@EndUserText.label: 'Quality Notification'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'QualityNotification'
@ObjectModel.modelingPattern: #ANALYTICAL_DIMENSION
@ObjectModel.supportedCapabilities: [ #ANALYTICAL_DIMENSION, #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@VDM.viewType: #BASIC
define view entity ZQMV_I_QualityNotif
  as select from I_QualityNotification
  association [0..1] to I_Plant as _Plant on $projection.Plant = _Plant.Plant
{
      @ObjectModel.text.element: [ 'NotificationText' ]
  key QualityNotification,
      NotificationType,
      @Semantics.text: true
      NotificationText,
      NotificationPriority,
      NotifProcessingPhase,
      Material,
      @ObjectModel.foreignKey.association: '_Plant'
      Plant,
      Batch,
      Supplier,
      Customer,
      InspectionLot,
      CreationDate,
      CompletionDate,
      @EndUserText.label: 'Notification Is Open'
      cast( case when NotifProcessingPhase = '1' or NotifProcessingPhase = '2' or NotifProcessingPhase = '3' then 'X' else ' ' end as abap_boolean ) as QualityNotifIsOpen,

      /* Associations */
      _Plant
}
