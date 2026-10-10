// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: PM notification with maintenance data, reference object, location, main work center (business key) and completion / deletion flags.
// Example: Read the open notifications: filter IsCompleted = '' and IsMarkedForDeletion = ''.
@AbapCatalog.sqlViewName: 'ZEMX_NO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #FACT
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Maintenance notification'
@ObjectModel.representativeKey: 'MaintenanceNotification'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEMX_I_MaintNotification
  as select from ZEMX_I_NotificationHeader as hdr
    inner join ZEMX_I_NotificationMaintData as pm on pm.MaintenanceNotification = hdr.MaintenanceNotification
    left outer join ZEMX_I_LocAcctAssignment as loc on loc.LocAcctAssignment = pm.LocAcctAssignment
    left outer join ZEMX_I_WorkCenterHeader as wc on wc.WorkCenterInternalID = hdr.MainWorkCenterInternalID
    left outer join ZEMX_I_StatusNotifCompleted as noco on noco.ObjectNumber = hdr.ObjectNumber
    left outer join ZEMX_I_StatusDeletionFlag as dlfl on dlfl.ObjectNumber = hdr.ObjectNumber
{
  key hdr.MaintenanceNotification    as MaintenanceNotification,
      hdr.NotificationType           as NotificationType,
      hdr.NotificationText           as NotificationText,
      hdr.MaintPriority              as MaintPriority,
      hdr.MaintPriorityType          as MaintPriorityType,
      hdr.NotificationDate           as NotificationDate,
      hdr.NotificationTime           as NotificationTime,
      hdr.ReportedByUser             as ReportedByUser,
      hdr.RequiredStartDate          as RequiredStartDate,
      hdr.RequiredEndDate            as RequiredEndDate,
      hdr.NotificationCatalog        as NotificationCatalog,
      hdr.NotificationCodeGroup      as NotificationCodeGroup,
      hdr.NotificationCode           as NotificationCode,
      hdr.MaintenanceOrder           as MaintenanceOrder,
      pm.Equipment                   as Equipment,
      loc.FunctionalLocation         as FunctionalLocation,
      pm.MaintenancePlanningPlant    as MaintenancePlanningPlant,
      pm.MaintenancePlannerGroup     as MaintenancePlannerGroup,
      wc.WorkCenter                  as MainWorkCenter,
      wc.Plant                       as MainWorkCenterPlant,
      loc.MaintenancePlant           as MaintenancePlant,
      loc.PlantSection               as PlantSection,
      pm.MaintenanceObjectIsDown     as MaintenanceObjectIsDown,
      pm.MalfunctionStartDate        as MalfunctionStartDate,
      pm.MalfunctionStartTime        as MalfunctionStartTime,
      pm.MalfunctionEndDate          as MalfunctionEndDate,
      pm.MalfunctionEndTime          as MalfunctionEndTime,
      hdr.ObjectNumber               as ObjectNumber,
      case noco.StatusCode when 'I0072' then 'X' else '' end as IsCompleted,
      case dlfl.StatusCode when 'I0076' then 'X' else '' end as IsMarkedForDeletion,
      hdr.CreationDate               as CreationDate,
      hdr.CreatedByUser              as CreatedByUser,
      hdr.LastChangeDate             as LastChangeDate
}
