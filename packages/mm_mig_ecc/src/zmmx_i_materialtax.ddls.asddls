// ModuPorter MM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZMMX_89N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MaterialTax'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_MaterialTax
  as select from ZMMX_B_MaterialTaxData as ch
    inner join ZMMX_I_Material as obj on ch.Product = obj.Product
{
  key ch.Product as Product,
  key ch.DepartureCountry as DepartureCountry,
      ch.TaxClassification1 as TaxClassification1,
      ch.TaxClassification2 as TaxClassification2,
      ch.TaxClassification3 as TaxClassification3,
      ch.TaxClassification4 as TaxClassification4,
      ch.TaxClassification5 as TaxClassification5,
      ch.TaxClassification6 as TaxClassification6,
      ch.TaxClassification7 as TaxClassification7,
      ch.TaxClassification8 as TaxClassification8,
      ch.TaxClassification9 as TaxClassification9
}
