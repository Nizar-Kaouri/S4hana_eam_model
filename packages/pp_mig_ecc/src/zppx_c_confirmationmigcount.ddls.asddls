// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ConfirmationMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V017N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ConfirmationMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPPX_C_ConfirmationMigCount
  as select from ZPPX_C_ConfirmationMig as src
{
  key src.ConfirmationNumber as ConfirmationNumber,
      count( * ) as RecordCount
}
group by src.ConfirmationNumber
