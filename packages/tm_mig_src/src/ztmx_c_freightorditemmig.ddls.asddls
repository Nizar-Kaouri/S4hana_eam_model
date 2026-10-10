// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightOrdItemMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V015C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightOrdItemMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZTMX_C_FreightOrdItemMig
  as select from ZTMX_I_FreightOrdItem as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.FreightOrderID as FreightOrderID,
  key src.ItemID as ItemID,
      src.FreightUnitID as FreightUnitID,
      src.Product as Product,
      src.Quantity as Quantity,
      src.QuantityUnit as QuantityUnit
}
