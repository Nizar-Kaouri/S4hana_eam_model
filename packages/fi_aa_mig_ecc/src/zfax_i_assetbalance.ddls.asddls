// ModuPorter FI_AA migration | Release 1.0.0
// Purpose: Read AssetBalance as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFAX_V005R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AssetBalance'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFAX_I_AssetBalance
  as select from ZFAX_I_AssetBalanceData as src
{
  key src.CompanyCode as CompanyCode,
  key src.MasterFixedAsset as MasterFixedAsset,
  key src.FixedAsset as FixedAsset,
  key src.FiscalYear as FiscalYear,
  key src.DepreciationArea as DepreciationArea,
      src.CumulativeAcquisition as CumulativeAcquisition,
      src.CumulativeDepreciation as CumulativeDepreciation,
      src.CurrentYearAcquisition as CurrentYearAcquisition,
      src.PostedDepreciation as PostedDepreciation
}
