// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CostCenterMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZCOX_V001C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostCenterMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZCOX_C_CostCenterMig
  as select from ZCOX_I_CostCenter as src
{
  key src.ControllingArea as ControllingArea,
  key src.CostCenter as CostCenter,
  key src.ValidityEndDate as ValidityEndDate,
      src.ValidityStartDate as ValidityStartDate,
      src.CompanyCode as CompanyCode,
      src.ProfitCenter as ProfitCenter,
      src.CostCenterCategory as CostCenterCategory,
      src.ResponsiblePerson as ResponsiblePerson
}
