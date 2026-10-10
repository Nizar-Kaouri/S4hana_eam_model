// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read QualityItemMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V007C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'QualityItemMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZQMX_C_QualityItemMig
  as select from ZQMX_I_QualityItem as src
{
  key src.QualityNotification as QualityNotification,
  key src.NotificationItem as NotificationItem,
      src.DefectCodeGroup as DefectCodeGroup,
      src.DefectCode as DefectCode,
      src.DefectText as DefectText
}
