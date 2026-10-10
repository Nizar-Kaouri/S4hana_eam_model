// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightAgreeCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMT-008: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightAgreeCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZTMT_I_FreightAgreeCompare
  as select from ztmt_tmt008 as src
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
