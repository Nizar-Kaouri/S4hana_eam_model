// ModuPorter FI_AA migration | Release 1.0.0
// Purpose: Read AssetPostingData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFAX_V004'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AssetPostingData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFAX_B_AssetPostingData
  as select from anep as src
{
  key src.bukrs as CompanyCode,
  key src.anln1 as MasterFixedAsset,
  key src.anln2 as FixedAsset,
  key src.gjahr as FiscalYear,
  key src.lnran as AssetLineItem,
  key src.afabe as DepreciationArea,
      src.bzdat as AssetValueDate,
      src.bwasl as AssetTransactionType,
      src.anbtr as AssetAmount,
      src.belnr as AccountingDocument
}
