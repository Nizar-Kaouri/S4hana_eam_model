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
      pm._LocAcctAssignment.FunctionalLocation as FunctionalLocation,
      pm.MaintenancePlanningPlant    as MaintenancePlanningPlant,
      pm.MaintenancePlannerGroup     as MaintenancePlannerGroup,
      hdr._MainWorkCenter.WorkCenter as MainWorkCenter,
      hdr._MainWorkCenter.Plant      as MainWorkCenterPlant,
      pm._LocAcctAssignment.MaintenancePlant as MaintenancePlant,
      pm._LocAcctAssignment.PlantSection as PlantSection,
      pm.MaintenanceObjectIsDown     as MaintenanceObjectIsDown,
      pm.MalfunctionStartDate        as MalfunctionStartDate,
      pm.MalfunctionStartTime        as MalfunctionStartTime,
      pm.MalfunctionEndDate          as MalfunctionEndDate,
      pm.MalfunctionEndTime          as MalfunctionEndTime,
      hdr.ObjectNumber               as ObjectNumber,
      case hdr._CompletedFlag.StatusCode when 'I0072' then 'X' else '' end as IsCompleted,
      case hdr._DeletionFlag.StatusCode when 'I0076' then 'X' else '' end as IsMarkedForDeletion,
      hdr.CreationDate               as CreationDate,
      hdr.CreatedByUser              as CreatedByUser,
      hdr.LastChangeDate             as LastChangeDate
}
