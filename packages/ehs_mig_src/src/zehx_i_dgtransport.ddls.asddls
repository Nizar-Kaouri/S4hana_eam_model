// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read DGTransport as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V023R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DGTransport'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEHX_I_DGTransport
  as select from ZEHX_I_DGTransportData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.Product as Product,
  key src.RegulationID as RegulationID,
  key src.Version as Version,
  key src.TransportMode as TransportMode,
      src.LimitedQuantity as LimitedQuantity,
      src.QuantityUnit as QuantityUnit,
      src.ExemptionCode as ExemptionCode
}
