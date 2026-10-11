// ModuPorter FI migration | Release 1.0.0
// Purpose: Read BankMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V018C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BankMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZFIX_C_BankMig
  as select from ZFIX_I_Bank as src
{
  key src.BankCountry as BankCountry,
  key src.BankKey as BankKey,
      src.BankName as BankName,
      src.City as City,
      src.Street as Street,
      src.SWIFTCode as SWIFTCode,
      src.DeletionFlag as DeletionFlag,
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
      src.AddressLanguage as AddressLanguage,
      src.HasStandardAddress as HasStandardAddress
}
