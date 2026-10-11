// ModuPorter SD migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZSDX_62N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'BillingPartnerAddrMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_BillingPartnerAddrMig
  as select from ZSDX_I_BillingPartnerAddr as src
{
key src.BillingDocument as BillingDocument,
  key src.BillingDocumentItem as BillingDocumentItem,
  key src.PartnerFunction as PartnerFunction,
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
