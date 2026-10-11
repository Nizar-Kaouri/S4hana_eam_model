// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for maintenance orders (number and description).
// Example: @Consumption.valueHelpDefinition on a MaintenanceOrder element of a consumption view.
// Authorization-relevant elements are kept so the DCL can inherit from ZEAM_B_MaintOrder.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Maintenance Order - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'MaintenanceOrder'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #TRANSACTIONAL
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZEAM_B_MaintOrderVH
  as select from ZEAM_B_MaintOrder
{
      @ObjectModel.text.element: [ 'MaintenanceOrderDesc' ]
      @Search.defaultSearchElement: true
      @Search.ranking: #HIGH
  key MaintenanceOrder,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #MEDIUM
      @Semantics.text: true
      MaintenanceOrderDesc,
      MaintenanceOrderType,
      MaintOrderIsOpen,
      Equipment,
      FunctionalLocation,
      MaintenancePlanningPlant,
      MaintenancePlannerGroup,
      MaintenancePlant,
      CompanyCode,
      BusinessArea,
      CostCenter
}
