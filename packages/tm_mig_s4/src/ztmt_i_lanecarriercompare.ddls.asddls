// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read LaneCarrierCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMT-005: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'LaneCarrierCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZTMT_I_LaneCarrierCompare
  as select from ztmt_tmt005 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as LaneID,
  key src.f005 as CarrierID,
      src.f006 as Priority,
      src.f007 as ValidityStartDate,
      src.f008 as ValidityEndDate
}
