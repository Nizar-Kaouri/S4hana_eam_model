// ModuPorter PS migration | Release 1.0.0
// Purpose: Read NetworkQuantit as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V008R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NetworkQuantit'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_NetworkQuantit
  as select from ZPSX_I_NetworkQuantitData as src
{
  key src.RoutingNumber as RoutingNumber,
  key src.OperationInternalID as OperationInternalID,
      src.WorkQuantity as WorkQuantity,
      src.WorkUnit as WorkUnit,
      src.Duration as Duration,
      src.DurationUnit as DurationUnit
}
