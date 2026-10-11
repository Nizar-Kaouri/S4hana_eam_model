// ModuPorter QM migration | Release 1.0.0
// Purpose: Read QualityNotificMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V006C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'QualityNotificMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZQMX_C_QualityNotificMig
  as select from ZQMX_I_QualityNotific as src
{
  key src.QualityNotification as QualityNotification,
      src.NotificationType as NotificationType,
      src.NotificationText as NotificationText,
      src.Material as Material,
      src.Plant as Plant,
      src.ObjectNumber as ObjectNumber
}
