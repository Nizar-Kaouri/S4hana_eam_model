// ModuPorter MM migration | Release 1.0.0
// Purpose: Read SupplierStockData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V012'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SupplierStockData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_I_SupplierStockData
  as select from mslb as src
{
  key src.matnr as Product,
  key src.werks as Plant,
  key src.charg as Batch,
  key src.sobkz as SpecialStock,
  key src.lifnr as Supplier,
      src.lblab as UnrestrictedStock,
      src.lbins as QualityInspectionStock
}
