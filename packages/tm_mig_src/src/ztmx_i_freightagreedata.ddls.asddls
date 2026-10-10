// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightAgreeData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMX-008: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZTMX_V008'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightAgreeData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZTMX_I_FreightAgreeData
  as select from ztmx_tms008 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as AgreementID,
  key src.f005 as Version,
      src.f006 as AgreementType,
      src.f007 as Carrier,
      src.f008 as Currency,
      src.f009 as ValidityStartDate,
      src.f010 as ValidityEndDate,
      src.f011 as ReleaseStatus
}
