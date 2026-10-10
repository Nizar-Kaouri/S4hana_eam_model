// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CustomerCompanMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V008C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerCompanMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_CustomerCompanMig
  as select from ZFIX_I_CustomerCompan as src
{
  key src.Customer as Customer,
  key src.CompanyCode as CompanyCode,
      src.ReconciliationAccount as ReconciliationAccount,
      src.PaymentTerms as PaymentTerms,
      src.PaymentMethods as PaymentMethods,
      src.DeletionFlag as DeletionFlag
}
