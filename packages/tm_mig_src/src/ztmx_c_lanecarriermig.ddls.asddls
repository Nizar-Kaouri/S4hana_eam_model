// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read LaneCarrierMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V005C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'LaneCarrierMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZTMX_C_LaneCarrierMig
  as select from ZTMX_I_LaneCarrier as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.LaneID as LaneID,
  key src.CarrierID as CarrierID,
      src.Priority as Priority,
      src.ValidityStartDate as ValidityStartDate,
      src.ValidityEndDate as ValidityEndDate
}
