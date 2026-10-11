// ModuPorter EAM migration | Release 1.0.0
// Purpose: Record count of the measuring points delivered by ZEMX_C_MeasuringPointMig per MeasuringPointCategory, MeasuringPointIsCounter.
// Example: Export this source count view to record the selected extraction population by its dimensions.
@AbapCatalog.sqlViewName: 'ZEMX_CMPN'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Measuring point count (migration)'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #S
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MeasPointMigCount
  as select from ZEMX_C_MeasuringPointMig
{
      @EndUserText.label: 'Measuring Point Category'
  key MeasuringPointCategory  as MeasuringPointCategory,
      @EndUserText.label: 'Measuring Point Is Counter'
  key MeasuringPointIsCounter as MeasuringPointIsCounter,
      @EndUserText.label: 'Record Count'
      count( * )              as RecordCount
}
group by MeasuringPointCategory, MeasuringPointIsCounter
