// ZQMV QM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for inspection lots (lot number, material, batch).
// Example: Value help for InspectionLot in result or notification analyses.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Inspection Lot - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'InspectionLot'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZQMV_I_InspectionLotVH
  as select from ZQMV_I_InspectionLot
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
  key InspectionLot,
      InspectionLotType,
      InspectionLotOrigin,
      @Search.defaultSearchElement: true
      @Search.ranking: #LOW
      Material,
      Plant,
      @Search.defaultSearchElement: true
      @Search.ranking: #LOW
      Batch,
      Supplier
}
