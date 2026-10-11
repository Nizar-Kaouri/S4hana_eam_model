// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightOrderCount as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightOrderCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZTMT_I_FreightOrderCount
  as select from ZTMT_B_FreightOrderCompare as src
{
      count( * ) as RecordCount
}
