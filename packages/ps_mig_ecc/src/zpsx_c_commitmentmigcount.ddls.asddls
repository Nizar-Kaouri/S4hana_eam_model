// ModuPorter PS migration | Release 1.0.0
// Purpose: Read CommitmentMigCount as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V011N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CommitmentMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPSX_C_CommitmentMigCount
  as select from ZPSX_C_CommitmentMig as src
{
  key src.ObjectNumber as ObjectNumber,
      count( * ) as RecordCount
}
group by src.ObjectNumber
