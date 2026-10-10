// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read DGTransportCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] EHT-023: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'DGTransportCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZEHT_I_DGTransportCompare
  as select from zeht_eht023 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as Product,
  key src.f005 as RegulationID,
  key src.f006 as Version,
  key src.f007 as TransportMode,
      src.f008 as LimitedQuantity,
      src.f009 as QuantityUnit,
      src.f010 as ExemptionCode
}
