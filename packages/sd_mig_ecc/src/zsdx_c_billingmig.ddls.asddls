// ModuPorter SD migration | Release 1.0.0
// Purpose: Read BillingMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V011C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BillingMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_BillingMig
  as select from ZSDX_I_Billing as src
{
  key src.BillingDocument as BillingDocument,
      src.BillingDocumentType as BillingDocumentType,
      src.BillingDocumentDate as BillingDocumentDate,
      src.CompanyCode as CompanyCode,
      src.TransactionCurrency as TransactionCurrency,
      src.Payer as Payer
}
