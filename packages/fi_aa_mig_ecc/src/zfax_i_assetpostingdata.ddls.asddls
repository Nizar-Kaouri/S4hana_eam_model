// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read AssetPostingData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FAX-004: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFAX_V004'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AssetPostingData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFAX_I_AssetPostingData
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
