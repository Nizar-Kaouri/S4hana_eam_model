// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightOrdStopData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMX-016: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZTMX_V016'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightOrdStopData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZTMX_I_FreightOrdStopData
  as select from ztmx_tms016 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as FreightOrderID,
  key src.f005 as StopID,
      src.f006 as LocationID,
      src.f007 as Sequence,
      src.f008 as StopRole,
      src.f009 as PlannedAtUTC,
      src.f010 as ActualAtUTC,
      src.f011 as TimeZone
}
