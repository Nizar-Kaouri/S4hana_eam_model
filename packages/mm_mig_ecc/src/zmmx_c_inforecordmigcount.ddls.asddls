// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read InfoRecordMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V022N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InfoRecordMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_InfoRecordMigCount
  as select from ZMMX_C_InfoRecordMig as src
{
  key src.PurchasingInfoRecord as PurchasingInfoRecord,
      count( * ) as RecordCount
}
group by src.PurchasingInfoRecord
