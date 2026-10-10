// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read GLAccountCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FIT-001: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'GLAccountCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZFIT_I_GLAccountCompare
  as select from I_GLAccountInChartOfAccounts as src
{
  key src.ChartOfAccounts as ChartOfAccounts,
  key src.GLAccount as GLAccount
}
