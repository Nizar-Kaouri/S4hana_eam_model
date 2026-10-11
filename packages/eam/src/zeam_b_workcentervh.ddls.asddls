// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for maintenance work centers (external ID, plant, description).
// Example: Value help for WorkCenterInternalID / WorkCenter in backlog and operation analyses.
// TODO-VERIFY[M] WC-V01: path filter _Text[1: Language = $session.system_language] (same as EQ-V01)
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Work Center - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'WorkCenterInternalID'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #M,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZEAM_B_WorkCenterVH
  as select from ZEAM_B_WorkCenter
{
      @ObjectModel.text.element: [ 'WorkCenterText' ]
      @UI.hidden: true
  key WorkCenterInternalID,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      WorkCenter,
      @Search.defaultSearchElement: true
      @Search.ranking: #MEDIUM
      Plant,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @Semantics.text: true
      _Text[1: Language = $session.system_language].WorkCenterText as WorkCenterText,
      WorkCenterTypeCode,
      WorkCenterCategoryCode
}
