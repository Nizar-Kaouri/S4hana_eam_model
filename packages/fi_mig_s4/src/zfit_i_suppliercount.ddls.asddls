// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SupplierCount as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZFIT_I_SupplierCount
  as select from ZFIT_I_SupplierCompare as src
{
  key src.Supplier as Supplier,
      count( * ) as RecordCount
}
group by src.Supplier
