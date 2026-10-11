// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Internal location UUID is preserved. Address, location type and time zone payload remain pending.
// Purpose: Read TransportLocMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V001C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TransportLocMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZTMX_C_TransportLocMig
  as select from ZTMX_I_TransportLoc as src
{
  key src.LocationUUID as LocationUUID,
      src.LocationID as LocationID,
      src.DeletionFlag as DeletionFlag,
      src.Longitude as Longitude,
      src.Latitude as Latitude
}
