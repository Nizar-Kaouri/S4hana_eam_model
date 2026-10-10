// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read TransportLoc as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V001R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TransportLoc'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZTMX_I_TransportLoc
  as select from ZTMX_I_TransportLocData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.LocationID as LocationID,
      src.LocationType as LocationType,
      src.Description as Description,
      src.BusinessPartner as BusinessPartner,
      src.Country as Country,
      src.PostalCode as PostalCode,
      src.City as City,
      src.TimeZone as TimeZone,
      src.Latitude as Latitude,
      src.Longitude as Longitude
}
