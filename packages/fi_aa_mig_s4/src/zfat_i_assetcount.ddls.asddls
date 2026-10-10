// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read AssetCount as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AssetCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZFAT_I_AssetCount
  as select from ZFAT_I_AssetCompare as src
{
  key src.CompanyCode as CompanyCode,
      count( * ) as RecordCount
}
group by src.CompanyCode
