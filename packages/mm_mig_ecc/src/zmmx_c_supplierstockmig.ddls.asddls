// ModuPorter MM migration | Release 1.0.0
// Purpose: Read SupplierStockMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V012C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierStockMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZMMX_C_SupplierStockMig
  as select from ZMMX_I_SupplierStock as src
{
  key src.Product as Product,
  key src.Plant as Plant,
  key src.Batch as Batch,
  key src.SpecialStock as SpecialStock,
  key src.Supplier as Supplier,
      src.UnrestrictedStock as UnrestrictedStock,
      src.QualityInspectionStock as QualityInspectionStock
}
