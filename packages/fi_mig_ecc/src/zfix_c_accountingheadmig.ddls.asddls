// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read AccountingHeadMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V010C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AccountingHeadMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_AccountingHeadMig
  as select from ZFIX_I_AccountingHead as src
{
  key src.CompanyCode as CompanyCode,
  key src.AccountingDocument as AccountingDocument,
  key src.FiscalYear as FiscalYear,
      src.AccountingDocumentType as AccountingDocumentType,
      src.DocumentDate as DocumentDate,
      src.PostingDate as PostingDate,
      src.DocumentCurrency as DocumentCurrency
}
