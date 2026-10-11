// ModuPorter FI migration | Release 1.0.0
// Purpose: Read Supplier as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZFIX_V004R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Supplier'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZFIX_I_Supplier
  as select from ZFIX_B_SupplierData as src
    association [0..1] to ZFIX_B_Address as _Address
      on $projection.AddressNumber = _Address.AddressNumber
      and _Address.AddressValidFrom = '00010101' and _Address.AddressVersion = ''
{
  key src.Supplier as Supplier,
      src.SupplierName as SupplierName,
      src.Country as Country,
      src.Region as Region,
      src.AccountGroup as AccountGroup,
      src.DeletionFlag as DeletionFlag,
      src.AddressNumber as AddressNumber,
      case when _Address.AddressNumber is not null then 'X' else '' end as HasStandardAddress,
      _Address.AddressValidTo as AddressValidTo,
      _Address.AddressName1 as AddressName1,
      _Address.AddressName2 as AddressName2,
      _Address.AddressName3 as AddressName3,
      _Address.AddressName4 as AddressName4,
      _Address.AddressStreet as AddressStreet,
      _Address.AddressHouseNumber as AddressHouseNumber,
      _Address.AddressHouseNumberSupplement as AddressHouseNumberSupplement,
      _Address.AddressCity as AddressCity,
      _Address.AddressDistrict as AddressDistrict,
      _Address.AddressPostalCode as AddressPostalCode,
      _Address.AddressPOBox as AddressPOBox,
      _Address.AddressPOBoxPostalCode as AddressPOBoxPostalCode,
      _Address.AddressCountry as AddressCountry,
      _Address.AddressRegion as AddressRegion,
      _Address.AddressLanguage as AddressLanguage
}
