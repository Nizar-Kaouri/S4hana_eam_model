// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read DangerousGoodsCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHT-022: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DangerousGoodsCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZEHT_I_DangerousGoodsCompare
  as select from zeht_eht022 as src
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
