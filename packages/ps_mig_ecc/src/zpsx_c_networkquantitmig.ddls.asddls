// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read NetworkQuantitMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V008C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NetworkQuantitMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPSX_C_NetworkQuantitMig
  as select from ZPSX_I_NetworkQuantit as src
{
  key src.RoutingNumber as RoutingNumber,
  key src.OperationInternalID as OperationInternalID,
      src.WorkQuantity as WorkQuantity,
      src.WorkUnit as WorkUnit,
      src.Duration as Duration,
      src.DurationUnit as DurationUnit
}
