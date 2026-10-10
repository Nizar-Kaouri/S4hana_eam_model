// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read AssetCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FAT-001: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AssetCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZFAT_I_AssetCompare
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
