// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightOrderData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMX-014: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZTMX_V014'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightOrderData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZTMX_I_FreightOrderData
  as select from ztmx_tms014 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as FreightOrderID,
      src.f005 as NativeGUID,
      src.f006 as DocumentCategory,
      src.f007 as OrderType,
      src.f008 as Carrier,
      src.f009 as ResourceID,
      src.f010 as ExecutionStatus,
      src.f011 as SettlementStatus
}
