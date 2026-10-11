// ModuPorter EAM migration | Release 1.0.0
// Purpose: Open notifications (not completed, not deleted).
// Example: The load program creates one notification per row.
@AbapCatalog.sqlViewName: 'ZEMX_CNO'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@Analytics.dataExtraction.delta.byElement.name: 'LastChangeDate'
@EndUserText.label: 'Maintenance notification (migration)'
@ObjectModel.usageType.dataClass: #TRANSACTIONAL
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_MaintNotificationMig
  as select from ZEMX_I_MaintNotification as src
{
      @EndUserText.label: 'Maintenance Notification'
  key src.MaintenanceNotification  as MaintenanceNotification,
      @EndUserText.label: 'Notification Type'
      src.NotificationType         as NotificationType,
      @EndUserText.label: 'Notification Text'
      src.NotificationText         as NotificationText,
      @EndUserText.label: 'Maint Priority'
      src.MaintPriority            as MaintPriority,
      @EndUserText.label: 'Maint Priority Type'
      src.MaintPriorityType        as MaintPriorityType,
      @EndUserText.label: 'Notification Date'
      src.NotificationDate         as NotificationDate,
      @EndUserText.label: 'Notification Time'
      src.NotificationTime         as NotificationTime,
      @EndUserText.label: 'Reported By User'
      src.ReportedByUser           as ReportedByUser,
      @EndUserText.label: 'Required Start Date'
      src.RequiredStartDate        as RequiredStartDate,
      @EndUserText.label: 'Required End Date'
      src.RequiredEndDate          as RequiredEndDate,
      @EndUserText.label: 'Notification Catalog'
      src.NotificationCatalog      as NotificationCatalog,
      @EndUserText.label: 'Notification Code Group'
      src.NotificationCodeGroup    as NotificationCodeGroup,
      @EndUserText.label: 'Notification Code'
      src.NotificationCode         as NotificationCode,
      @EndUserText.label: 'Equipment'
      src.Equipment                as Equipment,
      @EndUserText.label: 'Functional Location'
      src.FunctionalLocation       as FunctionalLocation,
      @EndUserText.label: 'Maintenance Planning Plant'
      src.MaintenancePlanningPlant as MaintenancePlanningPlant,
      @EndUserText.label: 'Maintenance Planner Group'
      src.MaintenancePlannerGroup  as MaintenancePlannerGroup,
      @EndUserText.label: 'Main Work Center'
      src.MainWorkCenter           as MainWorkCenter,
      @EndUserText.label: 'Main Work Center Plant'
      src.MainWorkCenterPlant      as MainWorkCenterPlant,
      @EndUserText.label: 'Maintenance Plant'
      src.MaintenancePlant         as MaintenancePlant,
      @EndUserText.label: 'Plant Section'
      src.PlantSection             as PlantSection,
      @EndUserText.label: 'Maintenance Object Is Down'
      src.MaintenanceObjectIsDown  as MaintenanceObjectIsDown,
      @EndUserText.label: 'Malfunction Start Date'
      src.MalfunctionStartDate     as MalfunctionStartDate,
      @EndUserText.label: 'Malfunction Start Time'
      src.MalfunctionStartTime     as MalfunctionStartTime,
      @EndUserText.label: 'Malfunction End Date'
      src.MalfunctionEndDate       as MalfunctionEndDate,
      @EndUserText.label: 'Malfunction End Time'
      src.MalfunctionEndTime       as MalfunctionEndTime,
      @EndUserText.label: 'Last Change Date'
      src.LastChangeDate           as LastChangeDate
}
where src.IsCompleted = '' and src.IsMarkedForDeletion = ''
