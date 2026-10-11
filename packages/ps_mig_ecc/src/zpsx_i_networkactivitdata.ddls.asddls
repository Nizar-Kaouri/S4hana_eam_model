// ModuPorter PS migration | Release 1.0.0
// Purpose: Read NetworkActivitData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPSX_V007'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NetworkActivitData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPSX_I_NetworkActivitData
  as select from afvc as src
{
  key src.aufpl as RoutingNumber,
  key src.aplzl as OperationInternalID,
      src.vornr as Activity,
      src.plnfl as Sequence,
      src.arbid as WorkCenterInternalID,
      src.steus as ControlKey,
      src.ltxa1 as ActivityDescription,
      src.projn as WBSElementInternalID
}
