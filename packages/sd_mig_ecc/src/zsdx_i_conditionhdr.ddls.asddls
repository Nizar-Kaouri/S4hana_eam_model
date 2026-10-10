// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ConditionHdr as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V013R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ConditionHdr'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZSDX_I_ConditionHdr
  as select from ZSDX_I_ConditionHdrData as src
{
  key src.ConditionRecord as ConditionRecord,
      src.ConditionUsage as ConditionUsage,
      src.ConditionTableNumber as ConditionTableNumber,
      src.Application as Application,
      src.ConditionType as ConditionType,
      src.ValidityStartDate as ValidityStartDate,
      src.ValidityEndDate as ValidityEndDate
}
