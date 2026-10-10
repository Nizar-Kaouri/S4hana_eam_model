// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read WBSMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPSX_V002N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WBSMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPSX_C_WBSMigCount
  as select from ZPSX_C_WBSMig as src
{
  key src.WBSElementInternalID as WBSElementInternalID,
      count( * ) as RecordCount
}
group by src.WBSElementInternalID
