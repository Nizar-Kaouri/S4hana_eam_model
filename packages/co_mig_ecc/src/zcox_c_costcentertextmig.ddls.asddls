// ModuPorter CO migration | Release 1.0.0
// Purpose: Read CostCenterTextMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V002C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostCenterTextMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZCOX_C_CostCenterTextMig
  as select from ZCOX_I_CostCenterText as src
{
  key src.Language as Language,
  key src.ControllingArea as ControllingArea,
  key src.CostCenter as CostCenter,
  key src.ValidityEndDate as ValidityEndDate,
      src.CostCenterName as CostCenterName,
      src.CostCenterDescription as CostCenterDescription
}
