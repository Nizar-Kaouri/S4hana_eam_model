// ModuPorter CO migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZCOX_56N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostElementText'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZCOX_I_CostElementText
  as select from ZCOX_B_CostElementTextData as ch
    inner join ZCOX_I_CostElement as obj on ch.ChartOfAccounts = obj.ChartOfAccounts and ch.CostElement = obj.CostElement
{
  key ch.Language as Language,
  key ch.ChartOfAccounts as ChartOfAccounts,
  key ch.CostElement as CostElement,
      ch.CostElementName as CostElementName,
      ch.CostElementDescription as CostElementDescription
}
