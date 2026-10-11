// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_96N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CustomerTax'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_CustomerTax
  as select from ZFIX_B_CustomerTaxData as ch
    inner join ZFIX_I_Customer as obj on ch.Customer = obj.Customer
{
  key ch.Customer as Customer,
  key ch.DepartureCountry as DepartureCountry,
  key ch.TaxCategory as TaxCategory,
      ch.TaxClassification as TaxClassification
}
