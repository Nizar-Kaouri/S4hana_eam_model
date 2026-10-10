// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read MeasurementMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V018C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MeasurementMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEHX_C_MeasurementMig
  as select from ZEHX_I_Measurement as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.CollectionID as CollectionID,
  key src.MeasurementID as MeasurementID,
      src.MeasuredAtUTC as MeasuredAtUTC,
      src.Value as Value,
      src.QuantityUnit as QuantityUnit,
      src.MethodID as MethodID,
      src.QualityStatus as QualityStatus
}
