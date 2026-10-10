// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read NetworkQuantitData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] PSX-008: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPSX_V008'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NetworkQuantitData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPSX_I_NetworkQuantitData
  as select from afvv as src
{
  key src.aufpl as RoutingNumber,
  key src.aplzl as OperationInternalID,
      src.arbei as WorkQuantity,
      src.arbeh as WorkUnit,
      src.dauno as Duration,
      src.daune as DurationUnit
}
