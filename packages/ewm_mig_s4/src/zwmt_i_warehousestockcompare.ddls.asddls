// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read WarehouseStockCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMT-005: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WarehouseStockCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZWMT_I_WarehouseStockCompare
  as select from zwmt_wmt005 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as Warehouse,
  key src.f005 as StockIdentity,
      src.f006 as Product,
      src.f007 as StorageBin,
      src.f008 as Batch,
      src.f009 as Owner,
      src.f010 as EntitledParty,
      src.f011 as StockType,
      src.f012 as SpecialStock,
      src.f013 as ReferenceDocument,
      src.f014 as ReferenceItem,
      src.f015 as HandlingUnit,
      src.f016 as Quantity,
      src.f017 as QuantityUnit,
      src.f018 as InventoryDate
}
