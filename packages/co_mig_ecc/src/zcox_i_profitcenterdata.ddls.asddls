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
define view ZCOX_I_ProfitCenterData
  as select from cepc as src
{
  key src.prctr as ProfitCenter,
  key src.datbi as ValidityEndDate,
  key src.kokrs as ControllingArea,
      src.datab as ValidityStartDate,
      src.verak as ResponsiblePerson,
      src.segment as Segment
}
