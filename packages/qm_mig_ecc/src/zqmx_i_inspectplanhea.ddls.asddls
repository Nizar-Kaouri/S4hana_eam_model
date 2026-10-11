// ModuPorter QM migration | Release 1.0.0
// Purpose: Read InspectPlanHea as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V011R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InspectPlanHea'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZQMX_I_InspectPlanHea
  as select from ZQMX_I_InspectPlanHeaData as src
{
  key src.TaskListType as TaskListType,
  key src.TaskListGroup as TaskListGroup,
  key src.TaskListGroupCounter as TaskListGroupCounter,
  key src.InternalCounter as InternalCounter,
      src.ValidFromDate as ValidFromDate,
      src.ChangeNumber as ChangeNumber,
      src.DeletionFlag as DeletionFlag,
      src.TaskListDescription as TaskListDescription
}
