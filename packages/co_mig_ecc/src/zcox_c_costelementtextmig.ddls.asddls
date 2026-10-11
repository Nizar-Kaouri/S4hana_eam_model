// ModuPorter CO migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZCOX_57N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'CostElementTextMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZCOX_C_CostElementTextMig
  as select from ZCOX_I_CostElementText as src
{
  key src.Language as Language,
  key src.ChartOfAccounts as ChartOfAccounts,
  key src.CostElement as CostElement,
      src.CostElementName as CostElementName,
      src.CostElementDescription as CostElementDescription
}
