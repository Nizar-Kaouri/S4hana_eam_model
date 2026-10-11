// ModuPorter SD migration | Release 1.0.0
// Purpose: Read SalesOrderCount as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesOrderCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZSDT_I_SalesOrderCount
  as select from ZSDT_B_SalesOrderCompare as src
{
  key src.SalesDocument as SalesDocument,
      count( * ) as RecordCount
}
group by src.SalesDocument
