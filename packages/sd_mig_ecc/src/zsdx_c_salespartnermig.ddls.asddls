// ModuPorter SD migration | Release 1.0.0
// Purpose: Read SalesPartnerMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V005C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesPartnerMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_SalesPartnerMig
  as select from ZSDX_I_SalesPartner as src
{
  key src.SalesDocument as SalesDocument,
  key src.SalesDocumentItem as SalesDocumentItem,
  key src.PartnerFunction as PartnerFunction,
      src.Customer as Customer,
      src.Supplier as Supplier,
      src.PersonnelNumber as PersonnelNumber,
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
