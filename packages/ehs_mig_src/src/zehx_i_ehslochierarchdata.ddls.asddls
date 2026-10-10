// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read EHSLocHierarchData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHX-002: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZEHX_V002'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'EHSLocHierarchData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEHX_I_EHSLocHierarchData
  as select from zehx_ehs002 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as HierarchyID,
  key src.f005 as ParentLocation,
  key src.f006 as ChildLocation,
  key src.f007 as ValidityStartDate,
      src.f008 as ValidityEndDate
}
