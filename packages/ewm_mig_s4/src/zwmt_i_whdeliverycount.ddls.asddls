// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read WhDeliveryCount as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WhDeliveryCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZWMT_I_WhDeliveryCount
  as select from ZWMT_I_WhDeliveryCompare as src
{
      count( * ) as RecordCount
}
