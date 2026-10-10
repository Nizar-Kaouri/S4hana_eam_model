// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SalesOrderMigCount as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZSDX_V001N'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesOrderMigCount'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZSDX_C_SalesOrderMigCount
  as select from ZSDX_C_SalesOrderMig as src
{
  key src.SalesDocument as SalesDocument,
      count( * ) as RecordCount
}
group by src.SalesDocument
