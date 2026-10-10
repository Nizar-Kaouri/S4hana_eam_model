// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightUnitStoMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V013C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightUnitStoMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZTMX_C_FreightUnitStoMig
  as select from ZTMX_I_FreightUnitSto as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.FreightUnitID as FreightUnitID,
  key src.StopID as StopID,
      src.LocationID as LocationID,
      src.Sequence as Sequence,
      src.StopRole as StopRole,
      src.PlannedAtUTC as PlannedAtUTC,
      src.TimeZone as TimeZone
}
