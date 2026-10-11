// ZFAA FI-AA VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: Fixed asset with a to-many association to all Universal Journal line items posted on it.
// Example: Asset history in an object page: acquisitions, depreciation and retirements of one asset.
// LINK VIEW (ships only when modules "fixed_asset" AND "asset_transaction" are selected).
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Fixed Asset with Journal Items'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.representativeKey: 'FixedAsset'
@ObjectModel.supportedCapabilities: [ #CDS_MODELING_ASSOCIATION_TARGET, #SQL_DATA_SOURCE ]
@ObjectModel.usageType: {
  serviceQuality: #B,
  sizeCategory: #L,
  dataClass: #MIXED
}
@VDM.viewType: #BASIC
define view entity ZFAA_B_AssetWithJournalItem
  as select from ZFAA_B_FixedAsset
  association [0..*] to ZFAA_B_AssetJournalItem as _JournalItem on $projection.CompanyCode = _JournalItem.CompanyCode and $projection.MasterFixedAsset = _JournalItem.MasterFixedAsset and $projection.FixedAsset = _JournalItem.FixedAsset
{
  key CompanyCode,
  key MasterFixedAsset,
  key FixedAsset,
      AssetClass,
      FixedAssetDescription,
      FixedAssetIsActive,
      CostCenter,
      Plant,
      ProfitCenter,
      Segment,
      BusinessArea,

      /* Associations */
      _JournalItem
}
