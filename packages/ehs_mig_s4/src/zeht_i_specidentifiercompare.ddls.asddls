// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SpecIdentifierCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHT-006: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SpecIdentifierCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZEHT_I_SpecIdentifierCompare
  as select from zeht_eht006 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as SpecificationID,
  key src.f005 as Version,
  key src.f006 as IdentifierID,
      src.f007 as IdentifierType,
      src.f008 as IdentifierCategory,
      src.f009 as IdentifierValue,
      src.f010 as Language
}
