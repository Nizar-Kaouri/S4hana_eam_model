// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read Depreciation as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFAX_V003R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Depreciation'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFAX_I_Depreciation
  as select from ZFAX_I_DepreciationData as src
{
  key src.CompanyCode as CompanyCode,
  key src.MasterFixedAsset as MasterFixedAsset,
  key src.FixedAsset as FixedAsset,
  key src.DepreciationArea as DepreciationArea,
      src.DepreciationKey as DepreciationKey,
      src.UsefulLifeYears as UsefulLifeYears,
      src.UsefulLifePeriods as UsefulLifePeriods,
      src.DepreciationStartDate as DepreciationStartDate
}
