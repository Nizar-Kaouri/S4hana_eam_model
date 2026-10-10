// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightStage as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V017R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightStage'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZTMX_I_FreightStage
  as select from ZTMX_I_FreightStageData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.FreightOrderID as FreightOrderID,
  key src.StageID as StageID,
      src.FromStop as FromStop,
      src.ToStop as ToStop,
      src.Distance as Distance,
      src.DistanceUnit as DistanceUnit,
      src.TransportMode as TransportMode
}
