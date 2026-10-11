// ModuPorter PS migration | Release 1.0.0
// Purpose: Read NetworkPlan as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V006R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NetworkPlan'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_NetworkPlan
  as select from ZPSX_B_NetworkPlanData as src
{
  key src.Network as Network,
      src.RoutingNumber as RoutingNumber,
      src.BasicStartDate as BasicStartDate,
      src.BasicFinishDate as BasicFinishDate
}
