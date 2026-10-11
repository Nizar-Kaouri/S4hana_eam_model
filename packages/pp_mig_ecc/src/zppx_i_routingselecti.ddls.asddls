// ModuPorter PP migration | Release 1.0.0
// Purpose: Read RoutingSelecti as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V013R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'RoutingSelecti'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPPX_I_RoutingSelecti
  as select from ZPPX_I_RoutingSelectiData as src
{
  key src.TaskListType as TaskListType,
  key src.TaskListGroup as TaskListGroup,
  key src.TaskListGroupCounter as TaskListGroupCounter,
  key src.Sequence as Sequence,
  key src.TaskListNode as TaskListNode,
  key src.InternalCounter as InternalCounter,
      src.ValidFromDate as ValidFromDate,
      src.DeletionFlag as DeletionFlag
}
