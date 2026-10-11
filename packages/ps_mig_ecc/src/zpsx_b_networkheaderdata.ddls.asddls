// ModuPorter PS migration | Release 1.0.0
// Purpose: Read NetworkHeaderData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPSX_V005'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NetworkHeaderData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPSX_B_NetworkHeaderData
  as select from aufk as src
{
  key src.aufnr as Network,
      src.auart as NetworkType,
      src.kokrs as ControllingArea,
      src.bukrs as CompanyCode,
      src.werks as Plant,
      src.ktext as NetworkDescription,
      src.objnr as ObjectNumber
}
