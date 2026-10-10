// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read MaterialCount as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZMMT_I_MaterialCount
  as select from ZMMT_I_MaterialCompare as src
{
  key src.Product as Product,
      count( * ) as RecordCount
}
group by src.Product
