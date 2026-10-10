// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SalesOrderStocMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V011C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesOrderStocMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_SalesOrderStocMig
  as select from ZMMX_I_SalesOrderStoc as src
{
  key src.Product as Product,
  key src.Plant as Plant,
  key src.StorageLocation as StorageLocation,
  key src.Batch as Batch,
  key src.SpecialStock as SpecialStock,
  key src.SalesOrder as SalesOrder,
  key src.SalesOrderItem as SalesOrderItem,
      src.UnrestrictedStock as UnrestrictedStock,
      src.QualityInspectionStock as QualityInspectionStock
}
