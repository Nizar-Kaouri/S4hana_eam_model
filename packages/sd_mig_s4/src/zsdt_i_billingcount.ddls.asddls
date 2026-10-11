// ModuPorter SD migration | Release 1.0.0
// Purpose: Read BillingCount as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BillingCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZSDT_I_BillingCount
  as select from ZSDT_I_BillingCompare as src
{
  key src.BillingDocument as BillingDocument,
      count( * ) as RecordCount
}
group by src.BillingDocument
