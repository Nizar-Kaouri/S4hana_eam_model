// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
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
  key src.MaintenanceNotification  as MaintenanceNotification,
      src.NotificationType         as NotificationType,
      src.NotificationText         as NotificationText,
      src.MaintPriority            as MaintPriority,
      src.MaintPriorityType        as MaintPriorityType,
      src.NotificationDate         as NotificationDate,
      src.NotificationTime         as NotificationTime,
      src.ReportedByUser           as ReportedByUser,
      src.RequiredStartDate        as RequiredStartDate,
      src.RequiredEndDate          as RequiredEndDate,
      src.NotificationCatalog      as NotificationCatalog,
      src.NotificationCodeGroup    as NotificationCodeGroup,
      src.NotificationCode         as NotificationCode,
      src.Equipment                as Equipment,
      src.FunctionalLocation       as FunctionalLocation,
      src.MaintenancePlanningPlant as MaintenancePlanningPlant,
      src.MaintenancePlannerGroup  as MaintenancePlannerGroup,
      src.MainWorkCenter           as MainWorkCenter,
      src.MainWorkCenterPlant      as MainWorkCenterPlant,
      src.MaintenancePlant         as MaintenancePlant,
      src.PlantSection             as PlantSection,
      src.MaintenanceObjectIsDown  as MaintenanceObjectIsDown,
      src.MalfunctionStartDate     as MalfunctionStartDate,
      src.MalfunctionStartTime     as MalfunctionStartTime,
      src.MalfunctionEndDate       as MalfunctionEndDate,
      src.MalfunctionEndTime       as MalfunctionEndTime,
      src.LastChangeDate           as LastChangeDate
}
where src.IsCompleted = '' and src.IsMarkedForDeletion = ''
