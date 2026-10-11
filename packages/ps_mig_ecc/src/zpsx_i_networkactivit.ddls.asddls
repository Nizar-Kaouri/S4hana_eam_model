// ModuPorter PS migration | Release 1.0.0
// Purpose: Read NetworkActivit as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V007R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NetworkActivit'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_NetworkActivit
  as select from ZPSX_B_NetworkActivitData as src
{
  key src.RoutingNumber as RoutingNumber,
  key src.OperationInternalID as OperationInternalID,
      src.Activity as Activity,
      src.Sequence as Sequence,
      src.WorkCenterInternalID as WorkCenterInternalID,
      src.ControlKey as ControlKey,
      src.ActivityDescription as ActivityDescription,
      src.WBSElementInternalID as WBSElementInternalID,
      src.Plant as Plant
}
