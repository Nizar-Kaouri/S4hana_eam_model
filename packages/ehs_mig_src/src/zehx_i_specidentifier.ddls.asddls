// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SpecIdentifier as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V006R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SpecIdentifier'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZEHX_I_SpecIdentifier
  as select from ZEHX_I_SpecIdentifierData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.SpecificationID as SpecificationID,
  key src.Version as Version,
  key src.IdentifierID as IdentifierID,
      src.IdentifierType as IdentifierType,
      src.IdentifierCategory as IdentifierCategory,
      src.IdentifierValue as IdentifierValue,
      src.Language as Language
}
