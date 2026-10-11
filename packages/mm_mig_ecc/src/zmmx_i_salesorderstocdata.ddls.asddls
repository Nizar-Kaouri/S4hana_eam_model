// ModuPorter MM migration | Release 1.0.0
// Purpose: Read SalesOrderStocData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V011'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SalesOrderStocData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_I_SalesOrderStocData
  as select from mska as src
{
  key src.matnr as Product,
  key src.werks as Plant,
  key src.lgort as StorageLocation,
  key src.charg as Batch,
  key src.sobkz as SpecialStock,
  key src.vbeln as SalesOrder,
  key src.posnr as SalesOrderItem,
      src.kalab as UnrestrictedStock,
      src.kains as QualityInspectionStock
}
