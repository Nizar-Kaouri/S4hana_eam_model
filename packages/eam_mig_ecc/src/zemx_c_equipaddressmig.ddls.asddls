// ModuPorter EAM migration | Release 1.0.0
// Purpose: Equipment child records in the same master scope; preserve their full keys.
// Example: Export the selected equipment population and retain Equipment as the parent key.
@AbapCatalog.sqlViewName: 'ZEMX_CEQAD'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'EquipAddressMig'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_EquipAddressMig
  as select from ZEMX_I_EquipAddress as src
{
      @EndUserText.label: 'Equipment'
  key src.Equipment as Equipment,
      @EndUserText.label: 'Address Valid From'
  key src.AddressValidFrom as AddressValidFrom,
      @EndUserText.label: 'Address Version'
  key src.AddressVersion as AddressVersion,
      @EndUserText.label: 'Address Number'
      src.AddressNumber as AddressNumber,
      @EndUserText.label: 'Address Valid To'
      src.AddressValidTo as AddressValidTo,
      @EndUserText.label: 'Address Name1'
      src.AddressName1 as AddressName1,
      @EndUserText.label: 'Address Name2'
      src.AddressName2 as AddressName2,
      @EndUserText.label: 'Address Name3'
      src.AddressName3 as AddressName3,
      @EndUserText.label: 'Address Name4'
      src.AddressName4 as AddressName4,
      @EndUserText.label: 'Address Street'
      src.AddressStreet as AddressStreet,
      @EndUserText.label: 'Address House Number'
      src.AddressHouseNumber as AddressHouseNumber,
      @EndUserText.label: 'Address House Number Supplement'
      src.AddressHouseNumberSupplement as AddressHouseNumberSupplement,
      @EndUserText.label: 'Address City'
      src.AddressCity as AddressCity,
      @EndUserText.label: 'Address District'
      src.AddressDistrict as AddressDistrict,
      @EndUserText.label: 'Address Postal Code'
      src.AddressPostalCode as AddressPostalCode,
      @EndUserText.label: 'Address POBox'
      src.AddressPOBox as AddressPOBox,
      @EndUserText.label: 'Address POBox Postal Code'
      src.AddressPOBoxPostalCode as AddressPOBoxPostalCode,
      @EndUserText.label: 'Address Country'
      src.AddressCountry as AddressCountry,
      @EndUserText.label: 'Address Region'
      src.AddressRegion as AddressRegion,
      @Semantics.language: true
      @EndUserText.label: 'Address Language'
      src.AddressLanguage as AddressLanguage
}
