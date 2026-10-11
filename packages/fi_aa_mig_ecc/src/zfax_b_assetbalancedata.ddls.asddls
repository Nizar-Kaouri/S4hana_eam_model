// ModuPorter FI_AA migration | Release 1.0.0
// Purpose: Read AssetBalanceData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFAX_V005'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AssetBalanceData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFAX_B_AssetBalanceData
  as select from anlc as src
{
  key src.bukrs as CompanyCode,
  key src.anln1 as MasterFixedAsset,
  key src.anln2 as FixedAsset,
  key src.gjahr as FiscalYear,
  key src.afabe as DepreciationArea,
      src.kansw as CumulativeAcquisition,
      src.knafa as CumulativeDepreciation,
      src.answl as CurrentYearAcquisition,
      src.nafag as PostedDepreciation
}
