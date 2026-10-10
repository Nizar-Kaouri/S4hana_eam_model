// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read HUContentMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V008C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'HUContentMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZWMX_C_HUContentMig
  as select from ZWMX_I_HUContent as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.Warehouse as Warehouse,
  key src.HandlingUnit as HandlingUnit,
  key src.ContentItem as ContentItem,
      src.Product as Product,
      src.Batch as Batch,
      src.StockIdentity as StockIdentity,
      src.Quantity as Quantity,
      src.QuantityUnit as QuantityUnit,
      src.Owner as Owner,
      src.EntitledParty as EntitledParty
}
