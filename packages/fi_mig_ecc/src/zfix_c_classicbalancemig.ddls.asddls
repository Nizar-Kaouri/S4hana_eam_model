// ModuPorter FI migration | Release 1.0.0
// Purpose: Read ClassicBalanceMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V019C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ClassicBalanceMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_ClassicBalanceMig
  as select from ZFIX_I_ClassicBalance as src
{
  key src.Ledger as Ledger,
  key src.RecordType as RecordType,
  key src.Version as Version,
  key src.CompanyCode as CompanyCode,
  key src.FiscalYear as FiscalYear,
  key src.GLAccount as GLAccount,
  key src.BusinessArea as BusinessArea,
  key src.TransactionCurrency as TransactionCurrency,
  key src.DebitCreditCode as DebitCreditCode,
      src.TransactionAmount00 as TransactionAmount00,
      src.LocalAmount00 as LocalAmount00,
      src.TransactionAmount01 as TransactionAmount01,
      src.LocalAmount01 as LocalAmount01,
      src.TransactionAmount02 as TransactionAmount02,
      src.LocalAmount02 as LocalAmount02,
      src.TransactionAmount03 as TransactionAmount03,
      src.LocalAmount03 as LocalAmount03,
      src.TransactionAmount04 as TransactionAmount04,
      src.LocalAmount04 as LocalAmount04,
      src.TransactionAmount05 as TransactionAmount05,
      src.LocalAmount05 as LocalAmount05,
      src.TransactionAmount06 as TransactionAmount06,
      src.LocalAmount06 as LocalAmount06,
      src.TransactionAmount07 as TransactionAmount07,
      src.LocalAmount07 as LocalAmount07,
      src.TransactionAmount08 as TransactionAmount08,
      src.LocalAmount08 as LocalAmount08,
      src.TransactionAmount09 as TransactionAmount09,
      src.LocalAmount09 as LocalAmount09,
      src.TransactionAmount10 as TransactionAmount10,
      src.LocalAmount10 as LocalAmount10,
      src.TransactionAmount11 as TransactionAmount11,
      src.LocalAmount11 as LocalAmount11,
      src.TransactionAmount12 as TransactionAmount12,
      src.LocalAmount12 as LocalAmount12,
      src.TransactionAmount13 as TransactionAmount13,
      src.LocalAmount13 as LocalAmount13,
      src.TransactionAmount14 as TransactionAmount14,
      src.LocalAmount14 as LocalAmount14,
      src.TransactionAmount15 as TransactionAmount15,
      src.LocalAmount15 as LocalAmount15,
      src.TransactionAmount16 as TransactionAmount16,
      src.LocalAmount16 as LocalAmount16
}
