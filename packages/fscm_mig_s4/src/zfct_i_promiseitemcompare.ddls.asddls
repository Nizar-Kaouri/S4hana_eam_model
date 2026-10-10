// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PromiseItemCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FCT-010: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PromiseItemCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZFCT_I_PromiseItemCompare
  as select from zfct_fct010 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as BusinessPartner,
  key src.f005 as PromiseID,
  key src.f006 as CompanyCode,
  key src.f007 as FiscalYear,
  key src.f008 as AccountingDocument,
  key src.f009 as AccountingItem,
      src.f010 as AssignedAmount,
      src.f011 as Currency
}
