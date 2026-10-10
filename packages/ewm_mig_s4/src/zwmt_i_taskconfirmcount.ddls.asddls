// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read TaskConfirmCount as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TaskConfirmCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZWMT_I_TaskConfirmCount
  as select from ZWMT_I_TaskConfirmCompare as src
{
  key src.Warehouse as Warehouse,
      count( * ) as RecordCount
}
group by src.Warehouse
