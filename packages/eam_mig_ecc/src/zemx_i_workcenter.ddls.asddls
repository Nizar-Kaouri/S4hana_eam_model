// ModuPorter EAM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZEMX_237N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WorkCenter'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_WorkCenter
  as select from ZEMX_B_WorkCenterHeader as src
{
  key src.WorkCenter as WorkCenter,
  key src.Plant as Plant,
      src.WorkCenterCategoryCode as WorkCenterCategoryCode,
      src.WorkCenterResponsible as WorkCenterResponsible,
      src.TaskListUsage as TaskListUsage,
      src.ValidityStartDate as ValidityStartDate,
      src.ValidityEndDate as ValidityEndDate,
      src.IsMarkedForDeletion as IsMarkedForDeletion
}
