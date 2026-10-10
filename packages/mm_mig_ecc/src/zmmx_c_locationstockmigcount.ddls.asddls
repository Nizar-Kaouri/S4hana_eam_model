// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read LocationStockMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V009N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'LocationStockMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_LocationStockMigCount
  as select from ZMMX_C_LocationStockMig as src
{
  key src.Product as Product,
      count( * ) as RecordCount
}
group by src.Product
