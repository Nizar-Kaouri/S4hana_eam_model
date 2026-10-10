// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read WarehouseTaskCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMT-009: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WarehouseTaskCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZWMT_I_WarehouseTaskCompare
  as select from zwmt_wmt009 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as Warehouse,
  key src.f005 as WarehouseTask,
      src.f006 as WarehouseOrder,
      src.f007 as Product,
      src.f008 as SourceBin,
      src.f009 as DestinationBin,
      src.f010 as HandlingUnit,
      src.f011 as PlannedQuantity,
      src.f012 as QuantityUnit,
      src.f013 as ProcessType,
      src.f014 as TaskStatus
}
