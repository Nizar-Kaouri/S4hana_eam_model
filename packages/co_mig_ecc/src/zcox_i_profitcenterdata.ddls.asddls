// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ProfitCenterData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] COX-003: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
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
