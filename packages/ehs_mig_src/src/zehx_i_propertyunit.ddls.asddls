// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PropertyUnit as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V004R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PropertyUnit'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEHX_I_PropertyUnit
  as select from ZEHX_I_PropertyUnitData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.PropertyID as PropertyID,
  key src.UnitID as UnitID,
      src.ConversionNumerator as ConversionNumerator,
      src.ConversionDenominator as ConversionDenominator
}
