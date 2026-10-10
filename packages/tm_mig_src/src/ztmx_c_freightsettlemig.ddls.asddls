// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightSettleMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V018C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightSettleMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZTMX_C_FreightSettleMig
  as select from ZTMX_I_FreightSettle as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.SettlementID as SettlementID,
      src.FreightOrderID as FreightOrderID,
      src.Carrier as Carrier,
      src.CompanyCode as CompanyCode,
      src.Currency as Currency,
      src.TotalAmount as TotalAmount,
      src.SettlementStatus as SettlementStatus,
      src.AccountingDocument as AccountingDocument
}
