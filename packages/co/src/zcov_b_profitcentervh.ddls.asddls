// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for profit centers valid today, with the name in the logon language.
// Example: Value help for ProfitCenter in cost and margin queries.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Profit Center - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'ProfitCenter'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZCOV_B_ProfitCenterVH
  as select from ZCOV_B_ProfitCenter
{
  key ControllingArea,
      @ObjectModel.text.element: [ 'ProfitCenterName' ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
  key ProfitCenter,
      Segment,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @Semantics.text: true
      _Text[1: Language = $session.system_language].ProfitCenterName as ProfitCenterName
}
