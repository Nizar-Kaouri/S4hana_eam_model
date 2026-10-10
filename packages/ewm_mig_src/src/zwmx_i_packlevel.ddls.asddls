// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PackLevel as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V015R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PackLevel'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZWMX_I_PackLevel
  as select from ZWMX_I_PackLevelData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.PackSpecification as PackSpecification,
  key src.Version as Version,
  key src.LevelID as LevelID,
      src.ParentLevel as ParentLevel,
      src.PackagingProduct as PackagingProduct,
      src.TargetQuantity as TargetQuantity,
      src.QuantityUnit as QuantityUnit
}
