// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read Bank as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V018R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Bank'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_Bank
  as select from ZFIX_I_BankData as src
{
  key src.BankCountry as BankCountry,
  key src.BankKey as BankKey,
      src.BankName as BankName,
      src.City as City,
      src.Street as Street,
      src.SWIFTCode as SWIFTCode,
      src.DeletionFlag as DeletionFlag
}
