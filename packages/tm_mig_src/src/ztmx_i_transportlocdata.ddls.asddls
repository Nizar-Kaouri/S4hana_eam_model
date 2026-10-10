// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Native scope: Internal location UUID is preserved. Address, location type and time zone payload remain pending.
// Purpose: Read TransportLocData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMX-001: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZTMX_V001'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TransportLocData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZTMX_I_TransportLocData
  as select from /sapapo/loc as src
{
  key src.locid as LocationUUID,
      src.locno as LocationID,
      src.lvorm as DeletionFlag,
      src.xpos as Longitude,
      src.ypos as Latitude
}
