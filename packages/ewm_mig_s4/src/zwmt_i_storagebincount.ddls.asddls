// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read StorageBinCount as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'StorageBinCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZWMT_I_StorageBinCount
  as select from ZWMT_B_StorageBinCompare as src
{
  key src.Warehouse as Warehouse,
      count( * ) as RecordCount
}
group by src.Warehouse
