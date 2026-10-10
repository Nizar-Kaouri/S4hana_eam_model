// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read NetworkHeaderMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V005N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'NetworkHeaderMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPSX_C_NetworkHeaderMigCount
  as select from ZPSX_C_NetworkHeaderMig as src
{
  key src.Network as Network,
      count( * ) as RecordCount
}
group by src.Network
