// ModuPorter FI migration | Release 1.0.0
// Purpose: Read CustomerCompare as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZFIT_I_CustomerCompare
  as select from I_Customer as src
{
  key src.Customer as Customer,
      src.CustomerName as CustomerName,
      src.Country as Country,
      src.Region as Region
}
