// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PaymentPromiseData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FCX-009: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFCX_V009'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PaymentPromiseData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFCX_I_PaymentPromiseData
  as select from zfcx_fcs009 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as BusinessPartner,
  key src.f005 as PromiseID,
      src.f006 as PromiseDate,
      src.f007 as DueDate,
      src.f008 as PromisedAmount,
      src.f009 as Currency,
      src.f010 as PromiseStatus
}
