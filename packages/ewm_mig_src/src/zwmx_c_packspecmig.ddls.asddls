// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read PackSpecMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZWMX_V014C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'PackSpecMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZWMX_C_PackSpecMig
  as select from ZWMX_I_PackSpec as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.PackSpecification as PackSpecification,
  key src.Version as Version,
      src.Description as Description,
      src.ValidityStartDate as ValidityStartDate,
      src.ValidityEndDate as ValidityEndDate,
      src.ReleaseStatus as ReleaseStatus
}
