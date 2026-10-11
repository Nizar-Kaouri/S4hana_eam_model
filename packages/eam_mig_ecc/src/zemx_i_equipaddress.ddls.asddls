// ModuPorter EAM migration | Release 1.0.0
// Purpose: Equipment address versions linked to an existing non-deleted current equipment master.
// Example: Export the selected equipment population and retain Equipment as the parent key.
@AbapCatalog.sqlViewName: 'ZEMX_EQADDR'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Equipment address versions'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_EquipAddress
  as select from ZEMX_I_Equipment as eq
    inner join ZEMX_B_Address as adr on adr.AddressNumber = eq.AddressNumber
{
      @EndUserText.label: 'Equipment'
  key eq.Equipment as Equipment,
      @EndUserText.label: 'Address Valid From'
  key adr.AddressValidFrom as AddressValidFrom,
      @EndUserText.label: 'Address Version'
  key adr.AddressVersion as AddressVersion,
      @EndUserText.label: 'Address Number'
      adr.AddressNumber as AddressNumber,
      @EndUserText.label: 'Address Valid To'
      adr.AddressValidTo as AddressValidTo,
      @EndUserText.label: 'Address Name1'
      adr.AddressName1 as AddressName1,
      @EndUserText.label: 'Address Name2'
      adr.AddressName2 as AddressName2,
      @EndUserText.label: 'Address Name3'
      adr.AddressName3 as AddressName3,
      @EndUserText.label: 'Address Name4'
      adr.AddressName4 as AddressName4,
      @EndUserText.label: 'Address Street'
      adr.AddressStreet as AddressStreet,
      @EndUserText.label: 'Address House Number'
      adr.AddressHouseNumber as AddressHouseNumber,
      @EndUserText.label: 'Address House Number Supplement'
      adr.AddressHouseNumberSupplement as AddressHouseNumberSupplement,
      @EndUserText.label: 'Address City'
      adr.AddressCity as AddressCity,
      @EndUserText.label: 'Address District'
      adr.AddressDistrict as AddressDistrict,
      @EndUserText.label: 'Address Postal Code'
      adr.AddressPostalCode as AddressPostalCode,
      @EndUserText.label: 'Address POBox'
      adr.AddressPOBox as AddressPOBox,
      @EndUserText.label: 'Address POBox Postal Code'
      adr.AddressPOBoxPostalCode as AddressPOBoxPostalCode,
      @EndUserText.label: 'Address Country'
      adr.AddressCountry as AddressCountry,
      @EndUserText.label: 'Address Region'
      adr.AddressRegion as AddressRegion,
      @Semantics.language: true
      @EndUserText.label: 'Address Language'
      adr.AddressLanguage as AddressLanguage
}
where eq.IsMarkedForDeletion = ''
