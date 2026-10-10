// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read NetworkPlanData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] PSX-006: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPSX_V006'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NetworkPlanData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPSX_I_NetworkPlanData
  as select from afko as src
{
  key src.aufnr as Network,
      src.aufpl as RoutingNumber,
      src.gstrp as BasicStartDate,
      src.gltrp as BasicFinishDate
}
