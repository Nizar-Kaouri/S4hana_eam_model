// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ChemicalProp as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V003R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ChemicalProp'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEHX_I_ChemicalProp
  as select from ZEHX_I_ChemicalPropData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.PropertyID as PropertyID,
      src.Description as Description,
      src.PropertyType as PropertyType,
      src.DefaultUnit as DefaultUnit,
      src.Dimension as Dimension
}
