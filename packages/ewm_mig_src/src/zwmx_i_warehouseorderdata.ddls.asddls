// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read WarehouseOrderData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMX-011: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZWMX_V011'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'WarehouseOrderData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZWMX_I_WarehouseOrderData
  as select from zwmx_wms011 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as Warehouse,
  key src.f005 as WarehouseOrder,
      src.f006 as ActivityArea,
      src.f007 as Queue,
      src.f008 as Resource,
      src.f009 as OrderStatus,
      src.f010 as CreatedAtUTC
}
