// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PaymentPromiseCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FCT-009: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PaymentPromiseCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZFCT_I_PaymentPromiseCompare
  as select from zfct_fct009 as src
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
