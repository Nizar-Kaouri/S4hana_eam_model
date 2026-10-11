// ZCOV CO VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for cost centers valid today, with the name in the logon language.
// Example: Value help for CostCenter in all products of the library.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Cost Center - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'CostCenter'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZCOV_B_CostCenterVH
  as select from ZCOV_B_CostCenter
{
  key ControllingArea,
      @ObjectModel.text.element: [ 'CostCenterName' ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
  key CostCenter,
      CompanyCode,
      CostCenterCategory,
      ProfitCenter,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @Semantics.text: true
      _Text[1: Language = $session.system_language].CostCenterName as CostCenterName
}
