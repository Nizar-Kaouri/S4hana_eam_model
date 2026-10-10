// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PromiseItemMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFCX_V010C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PromiseItemMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFCX_C_PromiseItemMig
  as select from ZFCX_I_PromiseItem as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.BusinessPartner as BusinessPartner,
  key src.PromiseID as PromiseID,
  key src.CompanyCode as CompanyCode,
  key src.FiscalYear as FiscalYear,
  key src.AccountingDocument as AccountingDocument,
  key src.AccountingItem as AccountingItem,
      src.AssignedAmount as AssignedAmount,
      src.Currency as Currency
}
