// ModuPorter CO migration | Release 1.0.0
// Purpose: Read CostElementAreMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V009C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostElementAreMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZCOX_C_CostElementAreMig
  as select from ZCOX_I_CostElementAre as src
{
  key src.ControllingArea as ControllingArea,
  key src.CostElement as CostElement,
  key src.ValidityEndDate as ValidityEndDate,
      src.ValidityStartDate as ValidityStartDate,
      src.CostElementCategory as CostElementCategory
}
