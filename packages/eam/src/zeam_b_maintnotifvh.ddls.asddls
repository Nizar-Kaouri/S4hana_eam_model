// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for maintenance notifications (number and short text).
// Example: @Consumption.valueHelpDefinition on a MaintenanceNotification element of a consumption view.
// Authorization-relevant elements are kept so the DCL can inherit from ZEAM_B_MaintNotif.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Maintenance Notification - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'MaintenanceNotification'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZEAM_B_MaintNotifVH
  as select from ZEAM_B_MaintNotif
{
      @ObjectModel.text.element: [ 'NotificationText' ]
      @Search.defaultSearchElement: true
      @Search.ranking: #HIGH
  key MaintenanceNotification,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #MEDIUM
      @Semantics.text: true
      NotificationText,
      NotificationType,
      NotifProcessingPhase,
      Equipment,
      FunctionalLocation,
      MaintenancePlanningPlant,
      MaintenancePlannerGroup,
      MaintenancePlant,
      PlantSection,
      CreationDate
}
