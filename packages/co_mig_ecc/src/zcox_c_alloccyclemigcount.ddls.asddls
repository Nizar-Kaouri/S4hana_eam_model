// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read AllocCycleMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V012N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'AllocCycleMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZCOX_C_AllocCycleMigCount
  as select from ZCOX_C_AllocCycleMig as src
{
  key src.AllocationTable as AllocationTable,
      count( * ) as RecordCount
}
group by src.AllocationTable
