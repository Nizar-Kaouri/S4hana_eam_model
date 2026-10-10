// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read TransportLocCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMT-001: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TransportLocCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZTMT_I_TransportLocCompare
  as select from ztmt_tmt001 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as LocationID,
      src.f005 as LocationType,
      src.f006 as Description,
      src.f007 as BusinessPartner,
      src.f008 as Country,
      src.f009 as PostalCode,
      src.f010 as City,
      src.f011 as TimeZone,
      src.f012 as Latitude,
      src.f013 as Longitude
}
