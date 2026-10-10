// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read DeliveryCount as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DeliveryCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZSDT_I_DeliveryCount
  as select from ZSDT_I_DeliveryCompare as src
{
  key src.DeliveryDocument as DeliveryDocument,
      count( * ) as RecordCount
}
group by src.DeliveryDocument
