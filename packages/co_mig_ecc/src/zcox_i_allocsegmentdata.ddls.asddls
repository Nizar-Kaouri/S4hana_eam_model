// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read AllocSegmentData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] COX-013: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZCOX_V013'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AllocSegmentData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZCOX_I_AllocSegmentData
  as select from t811s as src
{
  key src.tab as AllocationTable,
  key src.cycle as AllocationCycle,
  key src.sdate as ValidityStartDate,
  key src.seqnr as SegmentSequence,
      src.segment as SegmentName
}
