// ModuPorter PS migration | Release 1.0.0
// Purpose: Read NetworkHeader as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V005R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NetworkHeader'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPSX_I_NetworkHeader
  as select from ZPSX_I_NetworkHeaderData as src
{
  key src.Network as Network,
      src.NetworkType as NetworkType,
      src.ControllingArea as ControllingArea,
      src.CompanyCode as CompanyCode,
      src.Plant as Plant,
      src.NetworkDescription as NetworkDescription,
      src.ObjectNumber as ObjectNumber
}
