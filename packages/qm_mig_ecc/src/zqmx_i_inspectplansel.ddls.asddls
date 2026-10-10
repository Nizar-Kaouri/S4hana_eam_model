// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read InspectPlanSel as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V013R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InspectPlanSel'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZQMX_I_InspectPlanSel
  as select from ZQMX_I_InspectPlanSelData as src
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
