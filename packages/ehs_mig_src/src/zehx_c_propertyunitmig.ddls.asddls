// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PropertyUnitMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V004C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PropertyUnitMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEHX_C_PropertyUnitMig
  as select from ZEHX_I_PropertyUnit as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.PropertyID as PropertyID,
  key src.UnitID as UnitID,
      src.ConversionNumerator as ConversionNumerator,
      src.ConversionDenominator as ConversionDenominator
}
