// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_80N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerDunningData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_B_CustomerDunningData
  as select from knb5 as src
{
  key src.kunnr as Customer,
  key src.bukrs as CompanyCode,
  key src.maber as DunningArea,
      src.mahna as DunningProcedure,
      src.mansp as DunningBlock,
      src.mahns as DunningLevel,
      src.madat as LastDunnedOn,
      src.kverm as DunningMemo
}
