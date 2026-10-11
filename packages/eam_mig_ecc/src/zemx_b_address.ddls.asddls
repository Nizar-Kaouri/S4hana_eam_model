// ModuPorter EAM migration | Release 1.0.0
// Purpose: Postal address records with their complete non-client key; address numbers are source-system references.
// Example: Export the selected equipment population and retain Equipment as the parent key.
@AbapCatalog.sqlViewName: 'ZEMX_ADRC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Technical object postal address'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_B_Address
  as select from adrc as a
{
      @EndUserText.label: 'Address Number'
  key a.addrnumber as AddressNumber,
      @EndUserText.label: 'Address Valid From'
  key a.date_from as AddressValidFrom,
      @EndUserText.label: 'Address Version'
  key a.nation as AddressVersion,
      @EndUserText.label: 'Address Valid To'
      a.date_to as AddressValidTo,
      @EndUserText.label: 'Address Name1'
      a.name1 as AddressName1,
      @EndUserText.label: 'Address Name2'
      a.name2 as AddressName2,
      @EndUserText.label: 'Address Name3'
      a.name3 as AddressName3,
      @EndUserText.label: 'Address Name4'
      a.name4 as AddressName4,
      @EndUserText.label: 'Address Street'
      a.street as AddressStreet,
      @EndUserText.label: 'Address House Number'
      a.house_num1 as AddressHouseNumber,
      @EndUserText.label: 'Address House Number Supplement'
      a.house_num2 as AddressHouseNumberSupplement,
      @EndUserText.label: 'Address City'
      a.city1 as AddressCity,
      @EndUserText.label: 'Address District'
      a.city2 as AddressDistrict,
      @EndUserText.label: 'Address Postal Code'
      a.post_code1 as AddressPostalCode,
      @EndUserText.label: 'Address POBox'
      a.po_box as AddressPOBox,
      @EndUserText.label: 'Address POBox Postal Code'
      a.post_code2 as AddressPOBoxPostalCode,
      @EndUserText.label: 'Address Country'
      a.country as AddressCountry,
      @EndUserText.label: 'Address Region'
      a.region as AddressRegion,
      @Semantics.language: true
      @EndUserText.label: 'Address Language'
      a.langu as AddressLanguage
}
