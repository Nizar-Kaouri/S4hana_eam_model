// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read AllocCycle as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V012R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AllocCycle'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZCOX_I_AllocCycle
  as select from ZCOX_I_AllocCycleData as src
{
  key src.AllocationTable as AllocationTable,
  key src.AllocationCycle as AllocationCycle,
  key src.ValidityStartDate as ValidityStartDate,
      src.ValidityEndDate as ValidityEndDate
}
