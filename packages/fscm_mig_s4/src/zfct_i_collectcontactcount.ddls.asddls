// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CollectContactCount as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CollectContactCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZFCT_I_CollectContactCount
  as select from ZFCT_I_CollectContactCompare as src
{
      count( * ) as RecordCount
}
