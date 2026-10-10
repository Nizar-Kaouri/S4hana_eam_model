// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read DisputeItemCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FCT-012: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DisputeItemCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZFCT_I_DisputeItemCompare
  as select from zfct_fct012 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as CaseID,
  key src.f005 as CompanyCode,
  key src.f006 as FiscalYear,
  key src.f007 as AccountingDocument,
  key src.f008 as AccountingItem,
      src.f009 as DisputedAmount,
      src.f010 as Currency
}
