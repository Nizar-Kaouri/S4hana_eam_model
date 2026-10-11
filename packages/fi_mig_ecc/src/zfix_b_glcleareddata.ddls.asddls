// ModuPorter FI migration | Release 1.0.0
// Purpose: Read GLClearedData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFIX_V013'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'GLClearedData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_B_GLClearedData
  as select from bsas as src
{
  key src.bukrs as CompanyCode,
  key src.hkont as GLAccount,
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
