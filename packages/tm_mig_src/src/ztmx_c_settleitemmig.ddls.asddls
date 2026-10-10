// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SettleItemMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V019C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SettleItemMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZTMX_C_SettleItemMig
  as select from ZTMX_I_SettleItem as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.SettlementID as SettlementID,
  key src.SettlementItem as SettlementItem,
      src.ChargeType as ChargeType,
      src.Amount as Amount,
      src.Currency as Currency,
      src.TaxCode as TaxCode,
      src.ReferenceItem as ReferenceItem
}
