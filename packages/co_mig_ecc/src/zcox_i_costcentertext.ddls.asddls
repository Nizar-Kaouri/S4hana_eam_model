// ModuPorter CO migration | Release 1.0.0
// Purpose: Read CostCenterText as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V002R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostCenterText'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZCOX_I_CostCenterText
  as select from ZCOX_I_CostCenterTextData as src
{
  key src.Language as Language,
  key src.ControllingArea as ControllingArea,
  key src.CostCenter as CostCenter,
  key src.ValidityEndDate as ValidityEndDate,
      src.CostCenterName as CostCenterName,
      src.CostCenterDescription as CostCenterDescription
}
