// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightUnitIteMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V012C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightUnitIteMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZTMX_C_FreightUnitIteMig
  as select from ZTMX_I_FreightUnitIte as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.FreightUnitID as FreightUnitID,
  key src.ItemID as ItemID,
      src.Product as Product,
      src.Quantity as Quantity,
      src.QuantityUnit as QuantityUnit,
      src.GrossWeight as GrossWeight,
      src.WeightUnit as WeightUnit,
      src.ReferenceDocument as ReferenceDocument,
      src.ReferenceItem as ReferenceItem
}
