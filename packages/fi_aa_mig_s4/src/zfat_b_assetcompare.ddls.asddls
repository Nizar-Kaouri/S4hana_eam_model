// ModuPorter FI_AA migration | Release 1.0.0
// Purpose: Read AssetCompare as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AssetCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZFAT_B_AssetCompare
  as select from I_FixedAsset as src
{
  key src.CompanyCode as CompanyCode,
  key src.MasterFixedAsset as MasterFixedAsset,
  key src.FixedAsset as FixedAsset,
      src.AssetClass as AssetClass,
      src.FixedAssetDescription as FixedAssetDescription,
      src.InventoryNumber as InventoryNumber,
      src.AssetCapitalizationDate as AssetCapitalizationDate,
      src.AssetDeactivationDate as AssetDeactivationDate
}
