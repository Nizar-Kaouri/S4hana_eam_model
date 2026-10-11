// ModuPorter FI migration | Release 1.0.0
// Purpose: Read CustomerMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V007C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_CustomerMig
  as select from ZFIX_I_Customer as src
{
  key src.Customer as Customer,
      src.CustomerName as CustomerName,
      src.Country as Country,
      src.Region as Region,
      src.AccountGroup as AccountGroup,
      src.DeletionFlag as DeletionFlag
}
