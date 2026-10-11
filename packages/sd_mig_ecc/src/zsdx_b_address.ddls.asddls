// ModuPorter SD migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZSDX_52N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Address'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZSDX_B_Address
  as select from adrc as src
{
key src.addrnumber as AddressNumber,
  key src.date_from as AddressValidFrom,
  key src.nation as AddressVersion,
      src.date_to as AddressValidTo,
      src.name1 as AddressName1,
      src.name2 as AddressName2,
      src.name3 as AddressName3,
      src.name4 as AddressName4,
      src.street as AddressStreet,
      src.house_num1 as AddressHouseNumber,
      src.house_num2 as AddressHouseNumberSupplement,
      src.city1 as AddressCity,
      src.city2 as AddressDistrict,
      src.post_code1 as AddressPostalCode,
      src.po_box as AddressPOBox,
      src.post_code2 as AddressPOBoxPostalCode,
      src.country as AddressCountry,
      src.region as AddressRegion,
      src.langu as AddressLanguage
}
