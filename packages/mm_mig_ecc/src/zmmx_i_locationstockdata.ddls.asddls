// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read LocationStockData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] MMX-009: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZMMX_V009'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'LocationStockData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZMMX_I_LocationStockData
  as select from mard as src
{
  key src.matnr as Product,
  key src.werks as Plant,
  key src.lgort as StorageLocation,
      src.labst as UnrestrictedStock,
      src.insme as QualityInspectionStock,
      src.speme as BlockedStock,
      src.umlme as TransferStock
}
