// ModuPorter migration - status: draft-unverified (never activated on SAP)
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
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.BusinessPartner as BusinessPartner,
  key src.PromiseID as PromiseID,
      src.PromiseDate as PromiseDate,
      src.DueDate as DueDate,
      src.PromisedAmount as PromisedAmount,
      src.Currency as Currency,
      src.PromiseStatus as PromiseStatus
}
