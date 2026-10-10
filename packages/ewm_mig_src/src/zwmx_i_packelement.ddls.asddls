// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PackElement as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V016R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PackElement'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZWMX_I_PackElement
  as select from ZWMX_I_PackElementData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.PackSpecification as PackSpecification,
  key src.Version as Version,
  key src.LevelID as LevelID,
  key src.ElementID as ElementID,
      src.Product as Product,
      src.Quantity as Quantity,
      src.QuantityUnit as QuantityUnit,
      src.ElementType as ElementType
}
