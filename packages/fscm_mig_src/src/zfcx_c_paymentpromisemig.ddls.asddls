// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Financial amount annotations, logical-system naming and invoice relations require DDIC verification. Invoice number is not assumed to be a native attribute field.
// Purpose: Read PaymentPromiseMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFCX_V009C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PaymentPromiseMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFCX_C_PaymentPromiseMig
  as select from ZFCX_I_PaymentPromise as src
{
  key src.CaseUUID as CaseUUID,
      src.CompanyCode as CompanyCode,
      src.Customer as Customer,
      src.Currency as Currency,
      src.DueDate as DueDate,
      src.PromiseDate as PromiseDate,
      src.PromiseState as PromiseState,
      src.PromiseLevel as PromiseLevel,
      src.PromisedBy as PromisedBy
}
