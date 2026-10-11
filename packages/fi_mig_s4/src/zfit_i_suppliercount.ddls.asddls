// ModuPorter FI migration | Release 1.0.0
// Purpose: Read SupplierCount as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZFIT_I_SupplierCount
  as select from ZFIT_B_SupplierCompare as src
{
  key src.Supplier as Supplier,
      count( * ) as RecordCount
}
group by src.Supplier
