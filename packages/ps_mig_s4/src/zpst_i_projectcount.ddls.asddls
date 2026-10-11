// ModuPorter PS migration | Release 1.0.0
// Purpose: Read ProjectCount as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProjectCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZPST_I_ProjectCount
  as select from ZPST_B_ProjectCompare as src
{
  key src.ProjectInternalID as ProjectInternalID,
      count( * ) as RecordCount
}
group by src.ProjectInternalID
