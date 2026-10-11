// ModuPorter CO migration | Release 1.0.0
// Purpose: Read AllocSegment as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V013R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AllocSegment'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZCOX_I_AllocSegment
  as select from ZCOX_I_AllocSegmentData as src
{
  key src.AllocationTable as AllocationTable,
  key src.AllocationCycle as AllocationCycle,
  key src.ValidityStartDate as ValidityStartDate,
  key src.SegmentSequence as SegmentSequence,
      src.SegmentName as SegmentName
}
