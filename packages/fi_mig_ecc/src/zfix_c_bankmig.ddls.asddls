// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read BankMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V018C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BankMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_BankMig
  as select from ZFIX_I_Bank as src
{
  key src.BankCountry as BankCountry,
  key src.BankKey as BankKey,
      src.BankName as BankName,
      src.City as City,
      src.Street as Street,
      src.SWIFTCode as SWIFTCode,
      src.DeletionFlag as DeletionFlag
}
