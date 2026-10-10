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
{
  key plko.plnty as TaskListType,
  key plko.plnnr as TaskListGroup,
  key plko.plnal as TaskListGroupCounter,
      // TODO-VERIFY[H] XTL-003: PLKO-ZAEHL counts the change-number states; the highest counter is the current version
  key plko.zaehl as TaskListVersionCounter,
      plko.datuv as ValidityStartDate,
      plko.ktext as TaskListDesc,
      plko.werks as Plant,
      plko.verwe as TaskListUsage,
      plko.statu as TaskListStatus,
      // TODO-VERIFY[M] XTL-002: PLKO field names VAGRP, STRAT, ANLZU, ANDAT, ANNAM, LOEKZ, ARBID
      plko.vagrp as MaintenancePlannerGroup,
      // TODO-VERIFY[H] XTL-001: PLKO-ARBID and PLPO-ARBID hold the CRHD object ID of the work center
      plko.arbid as MainWorkCenterInternalID,
      plko.strat as MaintenanceStrategy,
      plko.anlzu as MaintObjectSystemCondition,
      plko.loekz as IsMarkedForDeletion,
      plko.andat as CreationDate,
      plko.annam as CreatedByUser,
      plko.aedat as LastChangeDate
}
where plko.plnty = 'A' or plko.plnty = 'E' or plko.plnty = 'T'
