// ModuPorter CO migration | Release 1.0.0
// Purpose: Read ProfitCenterMigCount as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V003N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProfitCenterMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZCOX_C_ProfitCenterMigCount
  as select from ZCOX_C_ProfitCenterMig as src
{
  key src.ProfitCenter as ProfitCenter,
      count( * ) as RecordCount
}
group by src.ProfitCenter
