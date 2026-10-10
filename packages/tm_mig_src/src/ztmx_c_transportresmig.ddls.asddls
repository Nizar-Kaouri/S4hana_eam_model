// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read TransportResMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V002C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TransportResMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZTMX_C_TransportResMig
  as select from ZTMX_I_TransportRes as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.ResourceID as ResourceID,
      src.ResourceType as ResourceType,
      src.Description as Description,
      src.Carrier as Carrier,
      src.VehicleType as VehicleType,
      src.TimeZone as TimeZone
}
