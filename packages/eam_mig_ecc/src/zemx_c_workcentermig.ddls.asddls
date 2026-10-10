// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Work centers to migrate (not flagged for deletion) with plant, category and responsible person.
// Example: The load program reads all rows and creates one work center per row; WorkCenter / Plant identify the record.
@AbapCatalog.sqlViewName: 'ZEMX_CWC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'Work center (migration)'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_WorkCenterMig
  as select from ZEMX_I_WorkCenterHeader as src
{
  key src.WorkCenter             as WorkCenter,
  key src.Plant                  as Plant,
      src.WorkCenterCategoryCode as WorkCenterCategoryCode,
      src.WorkCenterResponsible  as WorkCenterResponsible,
      src.TaskListUsage          as TaskListUsage,
      src.ValidityStartDate      as ValidityStartDate,
      src.ValidityEndDate        as ValidityEndDate
}
where src.IsMarkedForDeletion = ''
