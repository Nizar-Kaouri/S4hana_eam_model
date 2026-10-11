// ModuPorter FI_AA migration | Release 1.0.0
// Purpose: Read AssetPostingMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFAX_V004C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AssetPostingMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFAX_C_AssetPostingMig
  as select from ZFAX_I_AssetPosting as src
{
  key src.CompanyCode as CompanyCode,
  key src.MasterFixedAsset as MasterFixedAsset,
  key src.FixedAsset as FixedAsset,
  key src.FiscalYear as FiscalYear,
  key src.AssetLineItem as AssetLineItem,
  key src.DepreciationArea as DepreciationArea,
      src.AssetValueDate as AssetValueDate,
      src.AssetTransactionType as AssetTransactionType,
      src.AssetAmount as AssetAmount,
      src.AccountingDocument as AccountingDocument
}
