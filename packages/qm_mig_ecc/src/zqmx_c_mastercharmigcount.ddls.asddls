// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read MasterCharMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V016N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MasterCharMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZQMX_C_MasterCharMigCount
  as select from ZQMX_C_MasterCharMig as src
{
  key src.Plant as Plant,
      count( * ) as RecordCount
}
group by src.Plant
