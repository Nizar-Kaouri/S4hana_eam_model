// ModuPorter FI migration | Release 1.0.0
// Purpose: Read SupplierCompare as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZFIT_I_SupplierCompare
  as select from I_Supplier as src
{
  key src.Supplier as Supplier,
      src.SupplierName as SupplierName,
      src.Country as Country,
      src.Region as Region
}
