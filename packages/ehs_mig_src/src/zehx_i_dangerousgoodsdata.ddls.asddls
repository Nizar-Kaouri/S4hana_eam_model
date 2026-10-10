// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read DangerousGoodsData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHX-022: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZEHX_V022'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DangerousGoodsData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZEHX_I_DangerousGoodsData
  as select from zehx_ehs022 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as Product,
  key src.f005 as RegulationID,
  key src.f006 as Version,
      src.f007 as UNNumber,
      src.f008 as ProperShippingName,
      src.f009 as HazardClass,
      src.f010 as PackingGroup,
      src.f011 as ValidityStartDate,
      src.f012 as ValidityEndDate
}
