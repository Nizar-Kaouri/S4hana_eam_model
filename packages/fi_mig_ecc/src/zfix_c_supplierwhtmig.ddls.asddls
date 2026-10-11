// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_88N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'SupplierWHTMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_SupplierWHTMig
  as select from ZFIX_I_SupplierWHT as src
{
  key src.Supplier as Supplier,
  key src.CompanyCode as CompanyCode,
  key src.WithholdingTaxType as WithholdingTaxType,
      src.WithholdingTaxCode as WithholdingTaxCode,
      src.WithholdingTaxID as WithholdingTaxID,
      src.ExemptionNumber as ExemptionNumber,
      src.ExemptionRate as ExemptionRate,
      src.ExemptionValidFrom as ExemptionValidFrom,
      src.ExemptionValidTo as ExemptionValidTo
}
