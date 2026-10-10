// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read DataCollectionMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V017C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DataCollectionMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEHX_C_DataCollectionMig
  as select from ZEHX_I_DataCollection as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.CollectionID as CollectionID,
      src.LocationID as LocationID,
      src.ClassifierID as ClassifierID,
      src.Description as Description,
      src.ScheduleType as ScheduleType,
      src.TimeZone as TimeZone
}
