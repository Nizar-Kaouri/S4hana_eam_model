// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightSettleData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMX-018: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZTMX_V018'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightSettleData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZTMX_I_FreightSettleData
  as select from ztmx_tms018 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as SettlementID,
      src.f005 as FreightOrderID,
      src.f006 as Carrier,
      src.f007 as CompanyCode,
      src.f008 as Currency,
      src.f009 as TotalAmount,
      src.f010 as SettlementStatus,
      src.f011 as AccountingDocument
}
