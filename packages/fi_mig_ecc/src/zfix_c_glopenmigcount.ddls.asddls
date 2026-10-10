// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read GLOpenMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V012N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'GLOpenMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_GLOpenMigCount
  as select from ZFIX_C_GLOpenMig as src
{
  key src.CompanyCode as CompanyCode,
      count( * ) as RecordCount
}
group by src.CompanyCode
