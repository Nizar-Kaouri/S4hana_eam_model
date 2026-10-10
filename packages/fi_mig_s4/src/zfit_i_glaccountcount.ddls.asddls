// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read GLAccountCount as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'GLAccountCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view entity ZFIT_I_GLAccountCount
  as select from ZFIT_I_GLAccountCompare as src
{
  key src.ChartOfAccounts as ChartOfAccounts,
      count( * ) as RecordCount
}
group by src.ChartOfAccounts
