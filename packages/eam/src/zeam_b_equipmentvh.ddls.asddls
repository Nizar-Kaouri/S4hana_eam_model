// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for equipment with the description in the logon language.
// Example: @Consumption.valueHelpDefinition: [{ entity: { name: 'ZEAM_B_EquipmentVH', element: 'Equipment' } }] on an Equipment element.
// Value help for Equipment. Authorization-relevant elements are kept so the DCL can
// inherit the conditions of ZEAM_B_Equipment.
// TODO-VERIFY[M] EQ-V01: path filter syntax _Text[1: Language = $session.system_language] accepted in a view entity
// TODO-VERIFY[L] EQ-V02: @Search.* and @Consumption.ranked annotations on a view entity value help
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Equipment - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'Equipment'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZEAM_B_EquipmentVH
  as select from ZEAM_B_Equipment
{
      @ObjectModel.text.element: [ 'EquipmentName' ]
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
  key Equipment,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @Semantics.text: true
      _Text[1: Language = $session.system_language].EquipmentName as EquipmentName,
      EquipmentCategory,
      TechnicalObjectType,
      @Search.defaultSearchElement: true
      @Search.ranking: #LOW
      FunctionalLocation,
      MaintenancePlant,
      MaintenancePlanningPlant,
      PlantSection,
      AuthorizationGroup,
      CompanyCode,
      BusinessArea,
      CostCenter,
      @Search.defaultSearchElement: true
      @Search.ranking: #LOW
      SerialNumber
}
