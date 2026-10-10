// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read EHSLocationData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHX-001: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZEHX_V001'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'EHSLocationData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEHX_I_EHSLocationData
  as select from zehx_ehs001 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as LocationID,
      src.f005 as LocationType,
      src.f006 as Description,
      src.f007 as Plant,
      src.f008 as Country,
      src.f009 as TimeZone,
      src.f010 as ValidityStartDate,
      src.f011 as ValidityEndDate
}
