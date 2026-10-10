// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CostElement as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V008R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostElement'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZCOX_I_CostElement
  as select from ZCOX_I_CostElementData as src
{
  key src.ChartOfAccounts as ChartOfAccounts,
  key src.CostElement as CostElement,
      src.CreationDate as CreationDate
}
