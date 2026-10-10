// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CollectSegmentCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FCT-006: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CollectSegmentCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZFCT_I_CollectSegmentCompare
  as select from zfct_fct006 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as BusinessPartner,
  key src.f005 as CollectionSegment,
      src.f006 as CollectionGroup,
      src.f007 as Specialist,
      src.f008 as ValidityStartDate,
      src.f009 as ValidityEndDate
}
