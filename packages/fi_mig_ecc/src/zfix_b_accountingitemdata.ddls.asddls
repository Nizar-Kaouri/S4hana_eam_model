// ModuPorter FI migration | Release 1.0.0
// Purpose: Read AccountingItemData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFIX_V011'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AccountingItemData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_B_AccountingItemData
  as select from bseg as src
{
  key src.bukrs as CompanyCode,
  key src.belnr as AccountingDocument,
  key src.gjahr as FiscalYear,
  key src.buzei as AccountingDocumentItem,
      src.hkont as GLAccount,
      src.koart as AccountType,
      src.shkzg as DebitCreditCode,
      src.wrbtr as DocumentAmount,
      src.dmbtr as CompanyCodeAmount,
      src.augdt as ClearingDate,
      src.augbl as ClearingDocument
}
