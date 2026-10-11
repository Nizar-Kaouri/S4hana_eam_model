// ModuPorter CO migration | Release 1.0.0
// Purpose: Read ProfitCenterTeData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZCOX_V004'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProfitCenterTeData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZCOX_B_ProfitCenterTeData
  as select from cepct as src
{
  key src.spras as Language,
  key src.prctr as ProfitCenter,
  key src.datbi as ValidityEndDate,
  key src.kokrs as ControllingArea,
      src.ktext as ProfitCenterName,
      src.ltext as ProfitCenterDescription
}
