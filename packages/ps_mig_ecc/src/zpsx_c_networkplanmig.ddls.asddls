// ModuPorter PS migration | Release 1.0.0
// Purpose: Read NetworkPlanMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V006C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NetworkPlanMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPSX_C_NetworkPlanMig
  as select from ZPSX_I_NetworkPlan as src
{
  key src.Network as Network,
      src.RoutingNumber as RoutingNumber,
      src.BasicStartDate as BasicStartDate,
      src.BasicFinishDate as BasicFinishDate
}
