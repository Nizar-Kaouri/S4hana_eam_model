// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CostElementMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V008C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostElementMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZCOX_C_CostElementMig
  as select from ZCOX_I_CostElement as src
{
  key src.ChartOfAccounts as ChartOfAccounts,
  key src.CostElement as CostElement,
      src.CreationDate as CreationDate
}
