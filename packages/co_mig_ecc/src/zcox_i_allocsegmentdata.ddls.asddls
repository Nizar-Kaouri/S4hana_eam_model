// ModuPorter CO migration | Release 1.0.0
// Purpose: Read AllocSegmentData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
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
