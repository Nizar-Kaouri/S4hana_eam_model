// ModuPorter CO migration | Release 1.0.0
// Purpose: Read ProfitCenter as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V003R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProfitCenter'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZCOX_I_ProfitCenter
  as select from ZCOX_I_ProfitCenterData as src
{
  key src.ProfitCenter as ProfitCenter,
  key src.ValidityEndDate as ValidityEndDate,
  key src.ControllingArea as ControllingArea,
      src.ValidityStartDate as ValidityStartDate,
      src.ResponsiblePerson as ResponsiblePerson,
      src.Segment as Segment
}
