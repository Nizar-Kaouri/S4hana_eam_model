// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SettleItem as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V019R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SettleItem'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZTMX_I_SettleItem
  as select from ZTMX_I_SettleItemData as src
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
