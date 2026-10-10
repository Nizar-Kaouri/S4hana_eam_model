// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read TaskConfirmData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMX-010: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZWMX_V010'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'TaskConfirmData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZWMX_I_TaskConfirmData
  as select from zwmx_wms010 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as Warehouse,
  key src.f005 as WarehouseTask,
  key src.f006 as ConfirmationID,
      src.f007 as ConfirmedQuantity,
      src.f008 as DifferenceQuantity,
      src.f009 as QuantityUnit,
      src.f010 as ConfirmedAtUTC,
      src.f011 as ReversalStatus
}
