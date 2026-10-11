// ModuPorter PS migration | Release 1.0.0
// Purpose: Read InvestProgramMigCount as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V012N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InvestProgramMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPSX_C_InvestProgramMigCount
  as select from ZPSX_C_InvestProgramMig as src
{
  key src.InvestmentProgram as InvestmentProgram,
      count( * ) as RecordCount
}
group by src.InvestmentProgram
