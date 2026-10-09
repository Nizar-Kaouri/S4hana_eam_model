// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Value help for Functional Location. The external label is the primary search element.
// Authorization-relevant elements are kept so the DCL can inherit from ZEAM_I_FuncLoc.
// TODO-VERIFY[M] FL-V01: path filter syntax _Text[1: Language = $session.system_language] accepted in a view entity
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Functional Location - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'FunctionalLocation'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZEAM_I_FuncLocVH
  as select from ZEAM_I_FuncLoc
{
      @ObjectModel.text.element: [ 'FunctionalLocationName' ]
      @Search.defaultSearchElement: true
      @Search.ranking: #MEDIUM
  key FunctionalLocation,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      FunctionalLocationLabelName,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @Semantics.text: true
      _Text[1: Language = $session.system_language].FunctionalLocationName as FunctionalLocationName,
      FunctionalLocationCategory,
      TechnicalObjectType,
      SuperiorFunctionalLocation,
      MaintenancePlant,
      MaintenancePlanningPlant,
      PlantSection,
      AuthorizationGroup,
      CompanyCode,
      BusinessArea,
      CostCenter
}
