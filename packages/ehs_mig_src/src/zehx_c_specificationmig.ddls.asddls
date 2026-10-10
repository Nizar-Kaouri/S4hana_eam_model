// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SpecificationMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V005C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SpecificationMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEHX_C_SpecificationMig
  as select from ZEHX_I_Specification as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.SpecificationID as SpecificationID,
  key src.Version as Version,
      src.SpecificationType as SpecificationType,
      src.Description as Description,
      src.AuthorizationGroup as AuthorizationGroup,
      src.ValidityStartDate as ValidityStartDate,
      src.ValidityEndDate as ValidityEndDate
}
