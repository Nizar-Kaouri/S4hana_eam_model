// ModuPorter QM migration | Release 1.0.0
// Purpose: Read QualityItem as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V007R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'QualityItem'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZQMX_I_QualityItem
  as select from ZQMX_I_QualityItemData as src
{
  key src.QualityNotification as QualityNotification,
  key src.NotificationItem as NotificationItem,
      src.DefectCodeGroup as DefectCodeGroup,
      src.DefectCode as DefectCode,
      src.DefectText as DefectText
}
