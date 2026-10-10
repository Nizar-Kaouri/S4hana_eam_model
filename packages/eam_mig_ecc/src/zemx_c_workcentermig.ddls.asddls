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
      @EndUserText.label: 'Work Center'
  key src.WorkCenter             as WorkCenter,
      @EndUserText.label: 'Plant'
  key src.Plant                  as Plant,
      @EndUserText.label: 'Work Center Category Code'
      src.WorkCenterCategoryCode as WorkCenterCategoryCode,
      @EndUserText.label: 'Work Center Responsible'
      src.WorkCenterResponsible  as WorkCenterResponsible,
      @EndUserText.label: 'Task List Usage'
      src.TaskListUsage          as TaskListUsage,
      @EndUserText.label: 'Validity Start Date'
      src.ValidityStartDate      as ValidityStartDate,
      @EndUserText.label: 'Validity End Date'
      src.ValidityEndDate        as ValidityEndDate
}
where src.IsMarkedForDeletion = ''
