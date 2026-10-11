// ModuPorter FI migration | Release 1.0.0
// Purpose: Read AccountingHeadData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFIX_V010'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AccountingHeadData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_B_AccountingHeadData
  as select from bkpf as src
{
  key src.bukrs as CompanyCode,
  key src.belnr as AccountingDocument,
  key src.gjahr as FiscalYear,
      src.blart as AccountingDocumentType,
      src.bldat as DocumentDate,
      src.budat as PostingDate,
      src.waers as DocumentCurrency,
      src.xblnr as ReferenceDocument,
      src.bktxt as HeaderText
}
