// ModuPorter SD migration | Release 1.0.0
// Purpose: Read ConditionHdrMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V013C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ConditionHdrMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_ConditionHdrMig
  as select from ZSDX_I_ConditionHdr as src
{
  key src.ConditionRecord as ConditionRecord,
      src.ConditionUsage as ConditionUsage,
      src.ConditionTableNumber as ConditionTableNumber,
      src.Application as Application,
      src.ConditionType as ConditionType,
      src.ValidityStartDate as ValidityStartDate,
      src.ValidityEndDate as ValidityEndDate
}
