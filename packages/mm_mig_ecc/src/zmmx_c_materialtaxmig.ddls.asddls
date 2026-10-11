// ModuPorter MM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZMMX_90N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'MaterialTaxMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_MaterialTaxMig
  as select from ZMMX_I_MaterialTax as src
{
  key src.Product as Product,
  key src.DepartureCountry as DepartureCountry,
      src.TaxClassification1 as TaxClassification1,
      src.TaxClassification2 as TaxClassification2,
      src.TaxClassification3 as TaxClassification3,
      src.TaxClassification4 as TaxClassification4,
      src.TaxClassification5 as TaxClassification5,
      src.TaxClassification6 as TaxClassification6,
      src.TaxClassification7 as TaxClassification7,
      src.TaxClassification8 as TaxClassification8,
      src.TaxClassification9 as TaxClassification9
}
