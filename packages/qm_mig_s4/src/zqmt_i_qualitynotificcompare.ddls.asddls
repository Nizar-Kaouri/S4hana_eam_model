// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read QualityNotificCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] QMT-006: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'QualityNotificCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZQMT_I_QualityNotificCompare
  as select from I_QualityNotification as src
{
  key src.QualityNotification as QualityNotification,
      src.QualityNotificationType as NotificationType,
      src.QualityNotificationText as NotificationText,
      src.Material as Material
}
