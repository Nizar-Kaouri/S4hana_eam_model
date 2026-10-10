// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightScaleCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMT-010: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightScaleCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZTMT_I_FreightScaleCompare
  as select from ztmt_tmt010 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as AgreementID,
  key src.f005 as Version,
  key src.f006 as RateID,
  key src.f007 as ScaleLine,
      src.f008 as FromValue,
      src.f009 as ToValue,
      src.f010 as ScaleUnit,
      src.f011 as ScaleRate,
      src.f012 as Currency
}
