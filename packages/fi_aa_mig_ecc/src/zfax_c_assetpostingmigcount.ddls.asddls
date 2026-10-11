// ModuPorter FI_AA migration | Release 1.0.0
// Purpose: Read AssetPostingMigCount as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFAX_V004N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AssetPostingMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFAX_C_AssetPostingMigCount
  as select from ZFAX_C_AssetPostingMig as src
{
  key src.CompanyCode as CompanyCode,
      count( * ) as RecordCount
}
group by src.CompanyCode
