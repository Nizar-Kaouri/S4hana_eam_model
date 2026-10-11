// ModuPorter EAM migration | Release 1.0.0
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
      @EndUserText.label: 'Maintenance Notification'
  key hdr.MaintenanceNotification    as MaintenanceNotification,
      @EndUserText.label: 'Notification Type'
      hdr.NotificationType           as NotificationType,
      @EndUserText.label: 'Notification Text'
      hdr.NotificationText           as NotificationText,
      @EndUserText.label: 'Maint Priority'
      hdr.MaintPriority              as MaintPriority,
      @EndUserText.label: 'Maint Priority Type'
      hdr.MaintPriorityType          as MaintPriorityType,
      @EndUserText.label: 'Notification Date'
      hdr.NotificationDate           as NotificationDate,
      @EndUserText.label: 'Notification Time'
      hdr.NotificationTime           as NotificationTime,
      @EndUserText.label: 'Reported By User'
      hdr.ReportedByUser             as ReportedByUser,
      @EndUserText.label: 'Required Start Date'
      hdr.RequiredStartDate          as RequiredStartDate,
      @EndUserText.label: 'Required End Date'
      hdr.RequiredEndDate            as RequiredEndDate,
      @EndUserText.label: 'Notification Catalog'
      hdr.NotificationCatalog        as NotificationCatalog,
      @EndUserText.label: 'Notification Code Group'
      hdr.NotificationCodeGroup      as NotificationCodeGroup,
      @EndUserText.label: 'Notification Code'
      hdr.NotificationCode           as NotificationCode,
      @EndUserText.label: 'Maintenance Order'
      hdr.MaintenanceOrder           as MaintenanceOrder,
      @EndUserText.label: 'Equipment'
      pm.Equipment                   as Equipment,
      @EndUserText.label: 'Functional Location'
      pm._LocAcctAssignment.FunctionalLocation as FunctionalLocation,
      @EndUserText.label: 'Maintenance Planning Plant'
      pm.MaintenancePlanningPlant    as MaintenancePlanningPlant,
      @EndUserText.label: 'Maintenance Planner Group'
      pm.MaintenancePlannerGroup     as MaintenancePlannerGroup,
      @EndUserText.label: 'Main Work Center'
      hdr._MainWorkCenter.WorkCenter as MainWorkCenter,
      @EndUserText.label: 'Main Work Center Plant'
      hdr._MainWorkCenter.Plant      as MainWorkCenterPlant,
      @EndUserText.label: 'Maintenance Plant'
      pm._LocAcctAssignment.MaintenancePlant as MaintenancePlant,
      @EndUserText.label: 'Plant Section'
      pm._LocAcctAssignment.PlantSection as PlantSection,
      @EndUserText.label: 'Maintenance Object Is Down'
      pm.MaintenanceObjectIsDown     as MaintenanceObjectIsDown,
      @EndUserText.label: 'Malfunction Start Date'
      pm.MalfunctionStartDate        as MalfunctionStartDate,
      @EndUserText.label: 'Malfunction Start Time'
      pm.MalfunctionStartTime        as MalfunctionStartTime,
      @EndUserText.label: 'Malfunction End Date'
      pm.MalfunctionEndDate          as MalfunctionEndDate,
      @EndUserText.label: 'Malfunction End Time'
      pm.MalfunctionEndTime          as MalfunctionEndTime,
      @EndUserText.label: 'Object Number'
      hdr.ObjectNumber               as ObjectNumber,
      @EndUserText.label: 'Is Completed'
      case hdr._CompletedFlag.StatusCode when 'I0072' then 'X' else '' end as IsCompleted,
      @EndUserText.label: 'Is Marked For Deletion'
      case hdr._DeletionFlag.StatusCode when 'I0076' then 'X' else '' end as IsMarkedForDeletion,
      @EndUserText.label: 'Creation Date'
      hdr.CreationDate               as CreationDate,
      @EndUserText.label: 'Created By User'
      hdr.CreatedByUser              as CreatedByUser,
      @EndUserText.label: 'Last Change Date'
      hdr.LastChangeDate             as LastChangeDate
}
