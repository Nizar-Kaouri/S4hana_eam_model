// ModuPorter CO migration | Release 1.0.0
// Purpose: Read CostCenter as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V001R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostCenter'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZCOX_I_CostCenter
  as select from ZCOX_B_CostCenterData as src
{
  key src.ControllingArea as ControllingArea,
  key src.CostCenter as CostCenter,
  key src.ValidityEndDate as ValidityEndDate,
      src.ValidityStartDate as ValidityStartDate,
      src.CompanyCode as CompanyCode,
      src.ProfitCenter as ProfitCenter,
      src.CostCenterCategory as CostCenterCategory,
      src.ResponsiblePerson as ResponsiblePerson,
      src.AddressStreet as AddressStreet,
      src.AddressCity as AddressCity,
      src.AddressDistrict as AddressDistrict,
      src.AddressPostalCode as AddressPostalCode,
      src.AddressCountry as AddressCountry,
      src.AddressRegion as AddressRegion,
      src.AddressPOBox as AddressPOBox,
      src.AddressPOBoxPostalCode as AddressPOBoxPostalCode,
      src.AddressLanguage as AddressLanguage,
      src.PhoneNumber1 as PhoneNumber1,
      src.PhoneNumber2 as PhoneNumber2,
      src.FaxNumber as FaxNumber
}
