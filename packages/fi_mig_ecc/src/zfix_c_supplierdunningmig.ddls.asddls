// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_91N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'SupplierDunningMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_SupplierDunningMig
  as select from ZFIX_I_SupplierDunning as src
{
  key src.Supplier as Supplier,
  key src.CompanyCode as CompanyCode,
  key src.DunningArea as DunningArea,
      src.DunningProcedure as DunningProcedure,
      src.DunningBlock as DunningBlock,
      src.DunningLevel as DunningLevel,
      src.LastDunnedOn as LastDunnedOn,
      src.DunningMemo as DunningMemo
}
