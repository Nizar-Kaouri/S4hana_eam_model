// ModuPorter MM migration | Release 1.0.0
// Purpose: Read BatchStockMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V010C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'BatchStockMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_BatchStockMig
  as select from ZMMX_I_BatchStock as src
{
  key src.Product as Product,
  key src.Plant as Plant,
  key src.StorageLocation as StorageLocation,
  key src.Batch as Batch,
      src.UnrestrictedStock as UnrestrictedStock,
      src.QualityInspectionStock as QualityInspectionStock,
      src.BlockedStock as BlockedStock
}
