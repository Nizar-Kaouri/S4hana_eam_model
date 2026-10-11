// ModuPorter SD migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZSDX_55N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DeliveryPartner'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZSDX_I_DeliveryPartner
  as select from ZSDX_B_SalesPartnerData as pa
    inner join ZSDX_I_Delivery as obj on obj.DeliveryDocument = pa.SalesDocument
    association [0..1] to ZSDX_B_Address as _Address
      on $projection.AddressNumber = _Address.AddressNumber
      and _Address.AddressValidFrom = '00010101' and _Address.AddressVersion = ''
{
key pa.SalesDocument as DeliveryDocument,
  key pa.SalesDocumentItem as DeliveryDocumentItem,
  key pa.PartnerFunction as PartnerFunction,
      pa.Customer as Customer,
      pa.Supplier as Supplier,
      pa.PersonnelNumber as PersonnelNumber,
      pa.AddressNumber as AddressNumber,
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
