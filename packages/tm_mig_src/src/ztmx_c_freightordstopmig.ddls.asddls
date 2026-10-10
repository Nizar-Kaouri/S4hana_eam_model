// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightOrdStopMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V016C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightOrdStopMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZTMX_C_FreightOrdStopMig
  as select from ZTMX_I_FreightOrdStop as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.FreightOrderID as FreightOrderID,
  key src.StopID as StopID,
      src.LocationID as LocationID,
      src.Sequence as Sequence,
      src.StopRole as StopRole,
      src.PlannedAtUTC as PlannedAtUTC,
      src.ActualAtUTC as ActualAtUTC,
      src.TimeZone as TimeZone
}
