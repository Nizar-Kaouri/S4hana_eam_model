// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read AccountingItemMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V011C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AccountingItemMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_AccountingItemMig
  as select from ZFIX_I_AccountingItem as src
{
  key src.CompanyCode as CompanyCode,
  key src.AccountingDocument as AccountingDocument,
  key src.FiscalYear as FiscalYear,
  key src.AccountingDocumentItem as AccountingDocumentItem,
      src.GLAccount as GLAccount,
      src.AccountType as AccountType,
      src.DebitCreditCode as DebitCreditCode,
      src.DocumentAmount as DocumentAmount,
      src.CompanyCodeAmount as CompanyCodeAmount,
      src.ClearingDate as ClearingDate,
      src.ClearingDocument as ClearingDocument
}
