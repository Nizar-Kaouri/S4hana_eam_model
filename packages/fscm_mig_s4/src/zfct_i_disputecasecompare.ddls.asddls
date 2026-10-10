// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read DisputeCaseCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FCT-011: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DisputeCaseCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZFCT_I_DisputeCaseCompare
  as select from zfct_fct011 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as CaseID,
      src.f005 as NativeGUID,
      src.f006 as BusinessPartner,
      src.f007 as CaseType,
      src.f008 as Reason,
      src.f009 as CaseStatus,
      src.f010 as Priority,
      src.f011 as DisputedAmount,
      src.f012 as Currency,
      src.f013 as CreatedAtUTC
}
