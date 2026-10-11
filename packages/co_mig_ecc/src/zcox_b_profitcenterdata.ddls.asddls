// ModuPorter CO migration | Release 1.0.0
// Purpose: Read ProfitCenterData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZCOX_V003'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProfitCenterData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZCOX_B_ProfitCenterData
  as select from cepc as src
{
  key src.prctr as ProfitCenter,
  key src.datbi as ValidityEndDate,
  key src.kokrs as ControllingArea,
      src.datab as ValidityStartDate,
      src.verak as ResponsiblePerson,
      src.segment as Segment,
      src.stras as AddressStreet,
      src.ort01 as AddressCity,
      src.ort02 as AddressDistrict,
      src.pstlz as AddressPostalCode,
      src.land1 as AddressCountry,
      src.regio as AddressRegion,
      src.pfach as AddressPOBox,
      src.pstl2 as AddressPOBoxPostalCode,
      src.spras as AddressLanguage,
      src.telf1 as PhoneNumber1,
      src.telf2 as PhoneNumber2,
      src.telfx as FaxNumber
}
