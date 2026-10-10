// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read EHSLocHierarchMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZEHX_V002C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'EHSLocHierarchMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZEHX_C_EHSLocHierarchMig
  as select from ZEHX_I_EHSLocHierarch as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.HierarchyID as HierarchyID,
  key src.ParentLocation as ParentLocation,
  key src.ChildLocation as ChildLocation,
  key src.ValidityStartDate as ValidityStartDate,
      src.ValidityEndDate as ValidityEndDate
}
