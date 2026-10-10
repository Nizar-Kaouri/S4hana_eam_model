// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: All versions (change-number states) of maintenance task list headers of type A (general), E (equipment) and T (functional location).
// Example: See every version of task list group 4711: filter TaskListGroup = '00004711'.
@AbapCatalog.sqlViewName: 'ZEMX_PLKO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Task list header'
@ObjectModel.representativeKey: 'TaskListVersionCounter'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEMX_I_TaskListHeader
  as select from plko
  association [0..1] to ZEMX_I_WorkCenterHeader as _MainWorkCenter on $projection.MainWorkCenterInternalID = _MainWorkCenter.WorkCenterInternalID
{
      @EndUserText.label: 'Task List Type'
  key plko.plnty as TaskListType,
      @EndUserText.label: 'Task List Group'
  key plko.plnnr as TaskListGroup,
      @EndUserText.label: 'Task List Group Counter'
  key plko.plnal as TaskListGroupCounter,
      // TODO-VERIFY[H] XTL-003: PLKO-ZAEHL counts the change-number states; the highest counter is the current version
      @EndUserText.label: 'Task List Version Counter'
  key plko.zaehl as TaskListVersionCounter,
      @EndUserText.label: 'Validity Start Date'
      plko.datuv as ValidityStartDate,
      @EndUserText.label: 'Task List Desc'
      plko.ktext as TaskListDesc,
      @EndUserText.label: 'Plant'
      plko.werks as Plant,
      @EndUserText.label: 'Task List Usage'
      plko.verwe as TaskListUsage,
      @EndUserText.label: 'Task List Status'
      plko.statu as TaskListStatus,
      // TODO-VERIFY[M] XTL-002: PLKO field names VAGRP, STRAT, ANLZU, ANDAT, ANNAM, LOEKZ, ARBID
      @EndUserText.label: 'Maintenance Planner Group'
      plko.vagrp as MaintenancePlannerGroup,
      // TODO-VERIFY[H] XTL-001: PLKO-ARBID and PLPO-ARBID hold the CRHD object ID of the work center
      @EndUserText.label: 'Main Work Center Internal ID'
      plko.arbid as MainWorkCenterInternalID,
      @EndUserText.label: 'Maintenance Strategy'
      plko.strat as MaintenanceStrategy,
      @EndUserText.label: 'Maint Object System Condition'
      plko.anlzu as MaintObjectSystemCondition,
      @EndUserText.label: 'Is Marked For Deletion'
      plko.loekz as IsMarkedForDeletion,
      @EndUserText.label: 'Creation Date'
      plko.andat as CreationDate,
      @EndUserText.label: 'Created By User'
      plko.annam as CreatedByUser,
      @EndUserText.label: 'Last Change Date'
      plko.aedat as LastChangeDate,
      _MainWorkCenter
}
where plko.plnty = 'A' or plko.plnty = 'E' or plko.plnty = 'T'
