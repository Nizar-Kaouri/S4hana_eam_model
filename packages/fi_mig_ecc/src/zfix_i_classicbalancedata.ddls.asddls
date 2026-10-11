// ModuPorter FI migration | Release 1.0.0
// Purpose: Read ClassicBalanceData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFIX_V019'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ClassicBalanceData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_I_ClassicBalanceData
  as select from glt0 as src
{
  key src.rldnr as Ledger,
  key src.rrcty as RecordType,
  key src.rvers as Version,
  key src.bukrs as CompanyCode,
  key src.ryear as FiscalYear,
  key src.racct as GLAccount,
  key src.rbusa as BusinessArea,
  key src.rtcur as TransactionCurrency,
  key src.drcrk as DebitCreditCode,
      src.tsl00 as TransactionAmount00,
      src.hsl00 as LocalAmount00,
      src.tsl01 as TransactionAmount01,
      src.hsl01 as LocalAmount01,
      src.tsl02 as TransactionAmount02,
      src.hsl02 as LocalAmount02,
      src.tsl03 as TransactionAmount03,
      src.hsl03 as LocalAmount03,
      src.tsl04 as TransactionAmount04,
      src.hsl04 as LocalAmount04,
      src.tsl05 as TransactionAmount05,
      src.hsl05 as LocalAmount05,
      src.tsl06 as TransactionAmount06,
      src.hsl06 as LocalAmount06,
      src.tsl07 as TransactionAmount07,
      src.hsl07 as LocalAmount07,
      src.tsl08 as TransactionAmount08,
      src.hsl08 as LocalAmount08,
      src.tsl09 as TransactionAmount09,
      src.hsl09 as LocalAmount09,
      src.tsl10 as TransactionAmount10,
      src.hsl10 as LocalAmount10,
      src.tsl11 as TransactionAmount11,
      src.hsl11 as LocalAmount11,
      src.tsl12 as TransactionAmount12,
      src.hsl12 as LocalAmount12,
      src.tsl13 as TransactionAmount13,
      src.hsl13 as LocalAmount13,
      src.tsl14 as TransactionAmount14,
      src.hsl14 as LocalAmount14,
      src.tsl15 as TransactionAmount15,
      src.hsl15 as LocalAmount15,
      src.tsl16 as TransactionAmount16,
      src.hsl16 as LocalAmount16
}
