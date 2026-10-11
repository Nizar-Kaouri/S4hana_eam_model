// ModuPorter EAM migration | Release 1.0.0
// Purpose: Record count of the last readings delivered by ZEMX_C_MeasReadingMig per MsmtEntryUnit.
// Example: Export this source count view to record the selected extraction population by its dimensions.
@AbapCatalog.sqlViewName: 'ZEMX_CMRN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Last reading count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MeasReadingMigCount
  as select from ZEMX_C_MeasReadingMig
{
      @EndUserText.label: 'Msmt Entry Unit'
  key MsmtEntryUnit as MsmtEntryUnit,
      @EndUserText.label: 'Record Count'
      count( * )    as RecordCount
}
group by MsmtEntryUnit
