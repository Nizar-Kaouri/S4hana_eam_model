// ModuPorter FI migration | Release 1.0.0
// Purpose: Read APClearedData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFIX_V015'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'APClearedData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_B_APClearedData
  as select from bsak as src
{
  key src.bukrs as CompanyCode,
  key src.lifnr as Supplier,
  key src.umsks as SpecialGLTransactionType,
  key src.umskz as SpecialGLCode,
  key src.augdt as ClearingDate,
  key src.augbl as ClearingDocument,
  key src.zuonr as AssignmentReference,
  key src.gjahr as FiscalYear,
  key src.belnr as AccountingDocument,
  key src.buzei as AccountingDocumentItem,
      src.budat as PostingDate,
      src.shkzg as DebitCreditCode,
      src.wrbtr as DocumentAmount,
      src.dmbtr as CompanyCodeAmount,
      src.waers as DocumentCurrency,
      src.sgtxt as ItemText,
      src.mwskz as TaxCode
}
