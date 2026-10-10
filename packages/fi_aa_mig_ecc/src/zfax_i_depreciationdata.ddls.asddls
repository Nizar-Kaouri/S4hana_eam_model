// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read DepreciationData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] FAX-003: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZFAX_V003'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DepreciationData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZFAX_I_DepreciationData
  as select from anlb as src
{
  key src.bukrs as CompanyCode,
  key src.anln1 as MasterFixedAsset,
  key src.anln2 as FixedAsset,
  key src.afabe as DepreciationArea,
      src.afasl as DepreciationKey,
      src.ndjar as UsefulLifeYears,
      src.ndper as UsefulLifePeriods,
      src.afabg as DepreciationStartDate
}
