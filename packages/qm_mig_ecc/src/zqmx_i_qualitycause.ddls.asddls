// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read QualityCause as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V008R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'QualityCause'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZQMX_I_QualityCause
  as select from ZQMX_I_QualityCauseData as src
{
  key src.QualityNotification as QualityNotification,
  key src.NotificationItem as NotificationItem,
  key src.CauseNumber as CauseNumber,
      src.CauseCodeGroup as CauseCodeGroup,
      src.CauseCode as CauseCode,
      src.CauseText as CauseText
}
