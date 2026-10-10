// ZQMV QM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for quality notifications (number and short text).
// Example: Value help for QualityNotification in complaint analyses.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Quality Notification - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'QualityNotification'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZQMV_I_QualityNotifVH
  as select from ZQMV_I_QualityNotif
{
      @ObjectModel.text.element: [ 'NotificationText' ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
  key QualityNotification,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @Semantics.text: true
      NotificationText,
      NotificationType,
      Material,
      Plant,
      Supplier,
      Customer
}
