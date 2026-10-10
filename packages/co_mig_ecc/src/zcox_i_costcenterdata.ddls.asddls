// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CostCenterData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] COX-001: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZCOX_V001'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostCenterData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZCOX_I_CostCenterData
  as select from csks as src
{
  key src.kokrs as ControllingArea,
  key src.kostl as CostCenter,
  key src.datbi as ValidityEndDate,
      src.datab as ValidityStartDate,
      src.bukrs as CompanyCode,
      src.prctr as ProfitCenter,
      src.kosar as CostCenterCategory,
      src.verak as ResponsiblePerson
}
