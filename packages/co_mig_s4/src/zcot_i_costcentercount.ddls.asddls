// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CostCenterCount as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostCenterCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZCOT_I_CostCenterCount
  as select from ZCOT_I_CostCenterCompare as src
{
  key src.ControllingArea as ControllingArea,
      count( * ) as RecordCount
}
group by src.ControllingArea
