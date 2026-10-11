// ModuPorter QM migration | Release 1.0.0
// Purpose: Read QualityNotificCount as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'QualityNotificCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZQMT_I_QualityNotificCount
  as select from ZQMT_B_QualityNotificCompare as src
{
  key src.QualityNotification as QualityNotification,
      count( * ) as RecordCount
}
group by src.QualityNotification
