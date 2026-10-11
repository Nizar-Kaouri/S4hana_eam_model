// ModuPorter SD migration | Release 1.0.0
// Purpose: Read DeliveryCount as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DeliveryCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZSDT_I_DeliveryCount
  as select from ZSDT_B_DeliveryCompare as src
{
  key src.DeliveryDocument as DeliveryDocument,
      count( * ) as RecordCount
}
group by src.DeliveryDocument
