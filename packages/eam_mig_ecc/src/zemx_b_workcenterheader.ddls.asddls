// ModuPorter EAM migration | Release 1.0.0
// Purpose: Work centers of object type 'A' (CRHD) with plant, category, responsible person, validity and deletion flag.
// Example: Read the work centers of plant 1000: filter Plant = '1000'.
@AbapCatalog.sqlViewName: 'ZEMX_CRHD'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Work center header'
@ObjectModel.representativeKey: 'WorkCenterInternalID'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #BASIC
define view ZEMX_B_WorkCenterHeader
  as select from crhd
{
      @EndUserText.label: 'Work Center Internal ID'
  key crhd.objid      as WorkCenterInternalID,
      @EndUserText.label: 'Work Center'
      crhd.arbpl      as WorkCenter,
      @EndUserText.label: 'Plant'
      crhd.werks      as Plant,
      // Compatibility note: CRHD-VERWE is the work center category (e.g. 0005 plant maintenance)
      @EndUserText.label: 'Work Center Category Code'
      crhd.verwe      as WorkCenterCategoryCode,
      @EndUserText.label: 'Work Center Responsible'
      crhd.veran      as WorkCenterResponsible,
      // Compatibility note: CRHD-PLANV is the task list usage of the work center
      @EndUserText.label: 'Task List Usage'
      crhd.planv      as TaskListUsage,
      @EndUserText.label: 'Validity Start Date'
      crhd.begda      as ValidityStartDate,
      @EndUserText.label: 'Validity End Date'
      crhd.endda      as ValidityEndDate,
      @EndUserText.label: 'Is Marked For Deletion'
      crhd.lvorm      as IsMarkedForDeletion,
      // Compatibility note: the change date of the work center basic data is CRHD-AEDAT_GRND
      @EndUserText.label: 'Last Change Date'
      crhd.aedat_grnd as LastChangeDate
}
where crhd.objty = 'A'
