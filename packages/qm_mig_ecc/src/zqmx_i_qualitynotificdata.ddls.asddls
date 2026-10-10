// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read QualityNotificData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] QMX-006: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZQMX_V006'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'QualityNotificData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZQMX_I_QualityNotificData
  as select from qmel as src
{
  key src.qmnum as QualityNotification,
      src.qmart as NotificationType,
      src.qmtxt as NotificationText,
      src.matnr as Material,
      src.werk as Plant,
      src.objnr as ObjectNumber
}
