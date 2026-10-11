// ModuPorter CO migration | Release 1.0.0
// Purpose: Read InternalOrderCount as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InternalOrderCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZCOT_I_InternalOrderCount
  as select from ZCOT_I_InternalOrderCompare as src
{
  key src.InternalOrder as InternalOrder,
      count( * ) as RecordCount
}
group by src.InternalOrder
