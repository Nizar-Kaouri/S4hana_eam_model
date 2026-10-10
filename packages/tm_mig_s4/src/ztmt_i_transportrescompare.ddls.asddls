// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read TransportResCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMT-002: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TransportResCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZTMT_I_TransportResCompare
  as select from ztmt_tmt002 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as ResourceID,
      src.f005 as ResourceType,
      src.f006 as Description,
      src.f007 as Carrier,
      src.f008 as VehicleType,
      src.f009 as TimeZone
}
