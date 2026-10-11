// ModuPorter FI migration | Release 1.0.0
// Purpose: Read CustomerCompan as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V008R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerCompan'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_CustomerCompan
  as select from ZFIX_I_CustomerCompanData as src
{
  key src.Customer as Customer,
  key src.CompanyCode as CompanyCode,
      src.ReconciliationAccount as ReconciliationAccount,
      src.PaymentTerms as PaymentTerms,
      src.PaymentMethods as PaymentMethods,
      src.DeletionFlag as DeletionFlag
}
