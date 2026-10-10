// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read BillingCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] SDT-011: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
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
