// ModuPorter EAM migration | Release 1.0.0
// Purpose: Preserve the business key and selected parent population without flattening repeating records.
// Example: Prepare a consistent cutover snapshot with customer/customer-cohort-project.json.
@AbapCatalog.sqlViewName: 'ZEMX_187N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: true
@EndUserText.label: 'MaintNotifUserStatusMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEMX_C_NotifUserStatusMig
  as select from ZEMX_I_MaintNotifUserStatus as src
{
  key src.MaintenanceNotification as MaintenanceNotification,
  key src.StatusCode as StatusCode,
      src.StatusKind as StatusKind,
      src.StatusProfile as StatusProfile,
      src.StatusChangeNumber as StatusChangeNumber
}
