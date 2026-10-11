// ModuPorter FI migration | Release 1.0.0
// Purpose: Read ARCleared as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V017R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ARCleared'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_ARCleared
  as select from ZFIX_I_ARClearedData as src
{
  key src.CompanyCode as CompanyCode,
  key src.Customer as Customer,
  key src.SpecialGLTransactionType as SpecialGLTransactionType,
  key src.SpecialGLCode as SpecialGLCode,
  key src.ClearingDate as ClearingDate,
  key src.ClearingDocument as ClearingDocument,
  key src.AssignmentReference as AssignmentReference,
  key src.FiscalYear as FiscalYear,
  key src.AccountingDocument as AccountingDocument,
  key src.AccountingDocumentItem as AccountingDocumentItem,
      src.PostingDate as PostingDate,
      src.DebitCreditCode as DebitCreditCode,
      src.DocumentAmount as DocumentAmount,
      src.CompanyCodeAmount as CompanyCodeAmount,
      src.DocumentCurrency as DocumentCurrency
}
