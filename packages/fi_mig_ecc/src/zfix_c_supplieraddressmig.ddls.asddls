// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_71N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'SupplierAddressMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_SupplierAddressMig
  as select from ZFIX_I_SupplierAddress as src
{
key src.Supplier as Supplier,
  key src.AddressValidFrom as AddressValidFrom,
  key src.AddressVersion as AddressVersion,
      src.AddressNumber as AddressNumber,
      src.AddressValidTo as AddressValidTo,
      src.AddressName1 as AddressName1,
      src.AddressName2 as AddressName2,
      src.AddressName3 as AddressName3,
      src.AddressName4 as AddressName4,
      src.AddressStreet as AddressStreet,
      src.AddressHouseNumber as AddressHouseNumber,
      src.AddressHouseNumberSupplement as AddressHouseNumberSupplement,
      src.AddressCity as AddressCity,
      src.AddressDistrict as AddressDistrict,
      src.AddressPostalCode as AddressPostalCode,
      src.AddressPOBox as AddressPOBox,
      src.AddressPOBoxPostalCode as AddressPOBoxPostalCode,
      src.AddressCountry as AddressCountry,
      src.AddressRegion as AddressRegion,
      src.AddressLanguage as AddressLanguage
}
