// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read LocationStock as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZMMX_V009R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'LocationStock'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZMMX_I_LocationStock
  as select from ZMMX_I_LocationStockData as src
{
  key src.Product as Product,
  key src.Plant as Plant,
  key src.StorageLocation as StorageLocation,
      src.UnrestrictedStock as UnrestrictedStock,
      src.QualityInspectionStock as QualityInspectionStock,
      src.BlockedStock as BlockedStock,
      src.TransferStock as TransferStock
}
