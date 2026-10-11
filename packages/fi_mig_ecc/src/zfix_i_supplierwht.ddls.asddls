// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_87N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierWHT'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_SupplierWHT
  as select from ZFIX_B_SupplierWHTData as ch
    inner join ZFIX_I_SupplierCompan as obj on ch.Supplier = obj.Supplier and ch.CompanyCode = obj.CompanyCode
{
  key ch.Supplier as Supplier,
  key ch.CompanyCode as CompanyCode,
  key ch.WithholdingTaxType as WithholdingTaxType,
      ch.WithholdingTaxCode as WithholdingTaxCode,
      ch.WithholdingTaxID as WithholdingTaxID,
      ch.ExemptionNumber as ExemptionNumber,
      ch.ExemptionRate as ExemptionRate,
      ch.ExemptionValidFrom as ExemptionValidFrom,
      ch.ExemptionValidTo as ExemptionValidTo
}
