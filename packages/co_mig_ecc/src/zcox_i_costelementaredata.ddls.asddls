// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read CostElementAreData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] COX-009: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZCOX_V009'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CostElementAreData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZCOX_I_CostElementAreData
  as select from cskb as src
{
  key src.kokrs as ControllingArea,
  key src.kstar as CostElement,
  key src.datbi as ValidityEndDate,
      src.datab as ValidityStartDate,
      src.katyp as CostElementCategory
}
