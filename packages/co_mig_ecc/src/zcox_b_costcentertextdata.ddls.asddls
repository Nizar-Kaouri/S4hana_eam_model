// ModuPorter CO migration | Release 1.0.0
// Purpose: Read CostCenterTextData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZCOX_V002'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostCenterTextData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZCOX_B_CostCenterTextData
  as select from cskt as src
{
  key src.spras as Language,
  key src.kokrs as ControllingArea,
  key src.kostl as CostCenter,
  key src.datbi as ValidityEndDate,
      src.ktext as CostCenterName,
      src.ltext as CostCenterDescription
}
