// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SpecPropertyCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHT-007: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SpecPropertyCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZEHT_I_SpecPropertyCompare
  as select from zeht_eht007 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as SpecificationID,
  key src.f005 as Version,
  key src.f006 as PropertyID,
  key src.f007 as ValueID,
      src.f008 as ValueText,
      src.f009 as ValueLow,
      src.f010 as ValueHigh,
      src.f011 as QuantityUnit,
      src.f012 as UsageRating,
      src.f013 as RegulatoryArea,
      src.f014 as ValidityStartDate,
      src.f015 as ValidityEndDate
}
