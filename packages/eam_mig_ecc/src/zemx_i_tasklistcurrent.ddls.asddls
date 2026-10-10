// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Current version of each maintenance task list header with the main work center as business key and the deletion flag.
// Example: Read the current task lists of plant 1000.
@AbapCatalog.sqlViewName: 'ZEMX_TLC'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Current maintenance task list'
@ObjectModel.representativeKey: 'TaskListGroupCounter'
@ObjectModel.usageType.dataClass: #MASTER
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #COMPOSITE
define view ZEMX_I_TaskListCurrent
  as select from ZEMX_I_TaskListHeader as hdr
    inner join ZEMX_I_TaskListLatestVersion as latest on latest.TaskListType = hdr.TaskListType and latest.TaskListGroup = hdr.TaskListGroup and latest.TaskListGroupCounter = hdr.TaskListGroupCounter and latest.TaskListVersionCounter = hdr.TaskListVersionCounter
{
  key hdr.TaskListType               as TaskListType,
  key hdr.TaskListGroup              as TaskListGroup,
  key hdr.TaskListGroupCounter       as TaskListGroupCounter,
      hdr.TaskListVersionCounter     as TaskListVersionCounter,
      hdr.ValidityStartDate          as ValidityStartDate,
      hdr.TaskListDesc               as TaskListDesc,
      hdr.Plant                      as Plant,
      hdr.TaskListUsage              as TaskListUsage,
      hdr.TaskListStatus             as TaskListStatus,
      hdr.MaintenancePlannerGroup    as MaintenancePlannerGroup,
      hdr._MainWorkCenter.WorkCenter as MainWorkCenter,
      hdr._MainWorkCenter.Plant      as MainWorkCenterPlant,
      hdr.MaintenanceStrategy        as MaintenanceStrategy,
      hdr.MaintObjectSystemCondition as MaintObjectSystemCondition,
      hdr.MainWorkCenterInternalID   as MainWorkCenterInternalID,
      hdr.IsMarkedForDeletion        as IsMarkedForDeletion,
      hdr.CreationDate               as CreationDate,
      hdr.LastChangeDate             as LastChangeDate
}
