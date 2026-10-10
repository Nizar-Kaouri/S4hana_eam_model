// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightOrder as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V014R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightOrder'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZTMX_I_FreightOrder
  as select from ZTMX_I_FreightOrderData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.FreightOrderID as FreightOrderID,
      src.NativeGUID as NativeGUID,
      src.DocumentCategory as DocumentCategory,
      src.OrderType as OrderType,
      src.Carrier as Carrier,
      src.ResourceID as ResourceID,
      src.ExecutionStatus as ExecutionStatus,
      src.SettlementStatus as SettlementStatus
}
