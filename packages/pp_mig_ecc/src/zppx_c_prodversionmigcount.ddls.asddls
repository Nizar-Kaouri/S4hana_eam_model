// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ProdVersionMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V016N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProdVersionMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZPPX_C_ProdVersionMigCount
  as select from ZPPX_C_ProdVersionMig as src
{
  key src.Product as Product,
      count( * ) as RecordCount
}
group by src.Product
