// ZFAA FI-AA VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Searchable value help for fixed assets (company code, asset number, subnumber, description).
// Example: Value help for MasterFixedAsset / FixedAsset in asset reports or in the EAM bridge later.
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@Consumption.ranked: true
@EndUserText.label: 'Fixed Asset - Value Help'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.dataCategory: #VALUE_HELP
@ObjectModel.representativeKey: 'FixedAsset'
@ObjectModel.supportedCapabilities: [ #VALUE_HELP_PROVIDER, #SEARCHABLE_ENTITY ]
@ObjectModel.usageType: {
  serviceQuality: #A,
  sizeCategory: #L,
  dataClass: #MASTER
}
@Search.searchable: true
@VDM.viewType: #BASIC
define view entity ZFAA_I_FixedAssetVH
  as select from ZFAA_I_FixedAsset
{
  key CompanyCode,
      @Search.defaultSearchElement: true
      @Search.ranking: #HIGH
  key MasterFixedAsset,
      @ObjectModel.text.element: [ 'FixedAssetDescription' ]
  key FixedAsset,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Search.ranking: #HIGH
      @Semantics.text: true
      FixedAssetDescription,
      @Search.defaultSearchElement: true
      @Search.ranking: #LOW
      InventoryNumber,
      AssetClass,
      FixedAssetIsActive,
      CostCenter,
      Plant,
      ProfitCenter,
      Segment,
      BusinessArea
}
