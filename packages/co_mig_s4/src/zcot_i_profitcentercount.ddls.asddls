// ModuPorter CO migration | Release 1.0.0
// Purpose: Read ProfitCenterCount as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProfitCenterCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZCOT_I_ProfitCenterCount
  as select from ZCOT_I_ProfitCenterCompare as src
{
  key src.ProfitCenter as ProfitCenter,
      count( * ) as RecordCount
}
group by src.ProfitCenter
