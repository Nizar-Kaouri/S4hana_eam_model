// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read NetworkHeaderMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V005C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NetworkHeaderMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPSX_C_NetworkHeaderMig
  as select from ZPSX_I_NetworkHeader as src
{
  key src.Network as Network,
      src.NetworkType as NetworkType,
      src.ControllingArea as ControllingArea,
      src.CompanyCode as CompanyCode,
      src.Plant as Plant,
      src.NetworkDescription as NetworkDescription,
      src.ObjectNumber as ObjectNumber
}
