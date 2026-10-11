// ModuPorter CO migration | Release 1.0.0
// Purpose: Read CostElementAre as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V009R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostElementAre'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZCOX_I_CostElementAre
  as select from ZCOX_I_CostElementAreData as src
{
  key src.ControllingArea as ControllingArea,
  key src.CostElement as CostElement,
  key src.ValidityEndDate as ValidityEndDate,
      src.ValidityStartDate as ValidityStartDate,
      src.CostElementCategory as CostElementCategory
}
