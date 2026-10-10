// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read HUContentData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] WMX-008: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZWMX_V008'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'HUContentData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZWMX_I_HUContentData
  as select from zwmx_wms008 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as Warehouse,
  key src.f005 as HandlingUnit,
  key src.f006 as ContentItem,
      src.f007 as Product,
      src.f008 as Batch,
      src.f009 as StockIdentity,
      src.f010 as Quantity,
      src.f011 as QuantityUnit,
      src.f012 as Owner,
      src.f013 as EntitledParty
}
