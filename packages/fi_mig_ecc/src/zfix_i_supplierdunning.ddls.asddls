// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_90N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierDunning'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_SupplierDunning
  as select from ZFIX_B_SupplierDunningData as ch
    inner join ZFIX_I_SupplierCompan as obj on ch.Supplier = obj.Supplier and ch.CompanyCode = obj.CompanyCode
{
  key ch.Supplier as Supplier,
  key ch.CompanyCode as CompanyCode,
  key ch.DunningArea as DunningArea,
      ch.DunningProcedure as DunningProcedure,
      ch.DunningBlock as DunningBlock,
      ch.DunningLevel as DunningLevel,
      ch.LastDunnedOn as LastDunnedOn,
      ch.DunningMemo as DunningMemo
}
