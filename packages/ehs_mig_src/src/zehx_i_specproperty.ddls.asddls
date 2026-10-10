// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SpecProperty as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V007R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SpecProperty'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEHX_I_SpecProperty
  as select from ZEHX_I_SpecPropertyData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.SpecificationID as SpecificationID,
  key src.Version as Version,
  key src.PropertyID as PropertyID,
  key src.ValueID as ValueID,
      src.ValueText as ValueText,
      src.ValueLow as ValueLow,
      src.ValueHigh as ValueHigh,
      src.QuantityUnit as QuantityUnit,
      src.UsageRating as UsageRating,
      src.RegulatoryArea as RegulatoryArea,
      src.ValidityStartDate as ValidityStartDate,
      src.ValidityEndDate as ValidityEndDate
}
