// ModuPorter PS migration | Release 1.0.0
// Purpose: Read WBSCount as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WBSCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZPST_I_WBSCount
  as select from ZPST_B_WBSCompare as src
{
  key src.WBSElementInternalID as WBSElementInternalID,
      count( * ) as RecordCount
}
group by src.WBSElementInternalID
