// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_86N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierWHTData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFIX_B_SupplierWHTData
  as select from lfbw as src
{
  key src.lifnr as Supplier,
  key src.bukrs as CompanyCode,
  key src.witht as WithholdingTaxType,
      src.wt_withcd as WithholdingTaxCode,
      src.wt_wtstcd as WithholdingTaxID,
      src.wt_exnr as ExemptionNumber,
      src.wt_exrt as ExemptionRate,
      src.wt_exdf as ExemptionValidFrom,
      src.wt_exdt as ExemptionValidTo
}
