// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CustomerCount as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZFIT_I_CustomerCount
  as select from ZFIT_I_CustomerCompare as src
{
  key src.Customer as Customer,
      count( * ) as RecordCount
}
group by src.Customer
