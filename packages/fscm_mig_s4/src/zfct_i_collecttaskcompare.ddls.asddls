// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CollectTaskCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FCT-008: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CollectTaskCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZFCT_I_CollectTaskCompare
  as select from zfct_fct008 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as BusinessPartner,
  key src.f005 as CollectionSegment,
  key src.f006 as TaskID,
      src.f007 as Reason,
      src.f008 as DueAtUTC,
      src.f009 as TaskStatus,
      src.f010 as RelatedContact
}
