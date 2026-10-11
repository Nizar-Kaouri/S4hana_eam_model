// ModuPorter PS migration | Release 1.0.0
// Purpose: Read NetworkQuantitData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPSX_V008'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NetworkQuantitData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPSX_B_NetworkQuantitData
  as select from afvv as src
{
  key src.aufpl as RoutingNumber,
  key src.aplzl as OperationInternalID,
      src.arbei as WorkQuantity,
      src.arbeh as WorkUnit,
      src.dauno as Duration,
      src.daune as DurationUnit
}
