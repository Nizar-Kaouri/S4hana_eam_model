// ModuPorter SD migration | Release 1.0.0
// Purpose: Read BillingCompare as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BillingCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZSDT_I_BillingCompare
  as select from I_BillingDocument as src
{
  key src.BillingDocument as BillingDocument,
      src.BillingDocumentType as BillingDocumentType,
      src.BillingDocumentDate as BillingDocumentDate,
      src.CompanyCode as CompanyCode,
      src.TransactionCurrency as TransactionCurrency,
      src.Payer as Payer
}
