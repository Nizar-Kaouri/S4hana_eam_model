// ModuPorter CO migration | Release 1.0.0
// Purpose: Read CostCenterCount as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostCenterCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZCOT_I_CostCenterCount
  as select from ZCOT_B_CostCenterCompare as src
{
  key src.ControllingArea as ControllingArea,
      count( * ) as RecordCount
}
group by src.ControllingArea
