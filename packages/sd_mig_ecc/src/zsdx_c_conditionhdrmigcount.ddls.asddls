// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ConditionHdrMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V013N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ConditionHdrMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_ConditionHdrMigCount
  as select from ZSDX_C_ConditionHdrMig as src
{
  key src.ConditionRecord as ConditionRecord,
      count( * ) as RecordCount
}
group by src.ConditionRecord
