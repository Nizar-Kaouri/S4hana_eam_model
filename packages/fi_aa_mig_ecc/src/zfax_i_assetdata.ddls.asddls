// ModuPorter FI_AA migration | Release 1.0.0
// Purpose: Read AssetData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFAX_V001'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AssetData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFAX_I_AssetData
  as select from anla as src
{
  key src.bukrs as CompanyCode,
  key src.anln1 as MasterFixedAsset,
  key src.anln2 as FixedAsset,
      src.anlkl as AssetClass,
      src.txt50 as FixedAssetDescription,
      src.invnr as InventoryNumber,
      src.aktiv as AssetCapitalizationDate,
      src.deakt as AssetDeactivationDate
}
