// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read WarehouseTaskData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMX-009: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZWMX_V009'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WarehouseTaskData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZWMX_I_WarehouseTaskData
  as select from zwmx_wms009 as src
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
