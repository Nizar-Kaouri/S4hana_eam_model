// ZPPV PP VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for production orders (order number, material).
// Example: Value help for ManufacturingOrder in operation or confirmation analyses.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Production Order - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'ManufacturingOrder'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZPPV_I_ProductionOrderVH
  as select from ZPPV_I_ProductionOrder
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
  key ManufacturingOrder,
      ManufacturingOrderType,
      @Search.defaultSearchElement: true
      @Search.ranking: #LOW
      Material,
      ProductionPlant,
      MRPController,
      ProductionOrderIsOpen,
      CompanyCode
}
