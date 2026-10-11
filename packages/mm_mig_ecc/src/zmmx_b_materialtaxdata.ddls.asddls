// ModuPorter MM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZMMX_88N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialTaxData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_B_MaterialTaxData
  as select from mlan as src
{
  key src.matnr as Product,
  key src.aland as DepartureCountry,
      src.taxm1 as TaxClassification1,
      src.taxm2 as TaxClassification2,
      src.taxm3 as TaxClassification3,
      src.taxm4 as TaxClassification4,
      src.taxm5 as TaxClassification5,
      src.taxm6 as TaxClassification6,
      src.taxm7 as TaxClassification7,
      src.taxm8 as TaxClassification8,
      src.taxm9 as TaxClassification9
}
