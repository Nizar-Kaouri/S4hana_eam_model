// ModuPorter CO migration | Release 1.0.0
// Purpose: Read ProfitCenterMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V003C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProfitCenterMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZCOX_C_ProfitCenterMig
  as select from ZCOX_I_ProfitCenter as src
{
  key src.ProfitCenter as ProfitCenter,
  key src.ValidityEndDate as ValidityEndDate,
  key src.ControllingArea as ControllingArea,
      src.ValidityStartDate as ValidityStartDate,
      src.ResponsiblePerson as ResponsiblePerson,
      src.Segment as Segment
}
