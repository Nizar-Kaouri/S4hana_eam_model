// ModuPorter FI migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZFIX_70N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierAddress'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_SupplierAddress
  as select from ZFIX_I_Supplier as obj
    inner join ZFIX_B_Address as adr on adr.AddressNumber = obj.AddressNumber
{
key obj.Supplier as Supplier,
  key adr.AddressValidFrom as AddressValidFrom,
  key adr.AddressVersion as AddressVersion,
      adr.AddressNumber as AddressNumber,
      adr.AddressValidTo as AddressValidTo,
      adr.AddressName1 as AddressName1,
      adr.AddressName2 as AddressName2,
      adr.AddressName3 as AddressName3,
      adr.AddressName4 as AddressName4,
      adr.AddressStreet as AddressStreet,
      adr.AddressHouseNumber as AddressHouseNumber,
      adr.AddressHouseNumberSupplement as AddressHouseNumberSupplement,
      adr.AddressCity as AddressCity,
      adr.AddressDistrict as AddressDistrict,
      adr.AddressPostalCode as AddressPostalCode,
      adr.AddressPOBox as AddressPOBox,
      adr.AddressPOBoxPostalCode as AddressPOBoxPostalCode,
      adr.AddressCountry as AddressCountry,
      adr.AddressRegion as AddressRegion,
      adr.AddressLanguage as AddressLanguage
}
