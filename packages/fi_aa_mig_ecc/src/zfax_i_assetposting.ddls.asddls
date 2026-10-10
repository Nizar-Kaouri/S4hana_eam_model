// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read AssetPosting as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFAX_V004R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AssetPosting'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFAX_I_AssetPosting
  as select from ZFAX_I_AssetPostingData as src
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
