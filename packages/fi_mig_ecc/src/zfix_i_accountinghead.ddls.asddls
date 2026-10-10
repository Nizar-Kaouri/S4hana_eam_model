// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read AccountingHead as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V010R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AccountingHead'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_AccountingHead
  as select from ZFIX_I_AccountingHeadData as src
{
  key src.CompanyCode as CompanyCode,
  key src.AccountingDocument as AccountingDocument,
  key src.FiscalYear as FiscalYear,
      src.AccountingDocumentType as AccountingDocumentType,
      src.DocumentDate as DocumentDate,
      src.PostingDate as PostingDate,
      src.DocumentCurrency as DocumentCurrency
}
