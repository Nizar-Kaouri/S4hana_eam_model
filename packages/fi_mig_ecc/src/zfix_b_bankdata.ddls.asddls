// ModuPorter FI migration | Release 1.0.0
// Purpose: Read BankData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFIX_V018'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BankData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_B_BankData
  as select from bnka as src
{
  key src.banks as BankCountry,
  key src.bankl as BankKey,
      src.banka as BankName,
      src.ort01 as City,
      src.stras as Street,
      src.swift as SWIFTCode,
      src.loevm as DeletionFlag
}
