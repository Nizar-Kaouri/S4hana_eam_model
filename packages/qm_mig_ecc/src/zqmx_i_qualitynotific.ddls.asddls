// ModuPorter QM migration | Release 1.0.0
// Purpose: Read QualityNotific as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V006R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'QualityNotific'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZQMX_I_QualityNotific
  as select from ZQMX_I_QualityNotificData as src
{
  key src.QualityNotification as QualityNotification,
      src.NotificationType as NotificationType,
      src.NotificationText as NotificationText,
      src.Material as Material,
      src.Plant as Plant,
      src.ObjectNumber as ObjectNumber
}
