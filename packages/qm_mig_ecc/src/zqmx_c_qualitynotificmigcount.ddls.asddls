// ModuPorter QM migration | Release 1.0.0
// Purpose: Read QualityNotificMigCount as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V006N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'QualityNotificMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZQMX_C_QualityNotificMigCount
  as select from ZQMX_C_QualityNotificMig as src
{
  key src.QualityNotification as QualityNotification,
      count( * ) as RecordCount
}
group by src.QualityNotification
