// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read AllocCycleData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] COX-012: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZCOX_V012'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AllocCycleData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZCOX_I_AllocCycleData
  as select from t811c as src
{
  key src.tab as AllocationTable,
  key src.cycle as AllocationCycle,
  key src.sdate as ValidityStartDate,
      src.edate as ValidityEndDate
}
