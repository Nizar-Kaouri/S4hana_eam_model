// ModuPorter EAM migration | Release 1.0.0
// Purpose: Record count of the long texts delivered by ZEMX_C_LongTextIndexMig per TextObject, TextID.
// Example: Export this source count view to record the selected extraction population by its dimensions.
@AbapCatalog.sqlViewName: 'ZEMX_CLTN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Long text count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_LongTextMigCount
  as select from ZEMX_C_LongTextIndexMig
{
      @EndUserText.label: 'Text Object'
  key TextObject as TextObject,
      @EndUserText.label: 'Text ID'
  key TextID     as TextID,
      @EndUserText.label: 'Record Count'
      count( * ) as RecordCount
}
group by TextObject, TextID
