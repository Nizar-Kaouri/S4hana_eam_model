// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read AllocSegmentMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V013C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AllocSegmentMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZCOX_C_AllocSegmentMig
  as select from ZCOX_I_AllocSegment as src
{
  key src.AllocationTable as AllocationTable,
  key src.AllocationCycle as AllocationCycle,
  key src.ValidityStartDate as ValidityStartDate,
  key src.SegmentSequence as SegmentSequence,
      src.SegmentName as SegmentName
}
