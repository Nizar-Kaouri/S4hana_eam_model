// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightRateData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] TMX-009: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZTMX_V009'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightRateData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZTMX_I_FreightRateData
  as select from ztmx_tms009 as src
{
  key src.f001 as SourceSystem,
  key src.f002 as SourceClient,
  key src.f003 as ExportBatch,
  key src.f004 as AgreementID,
  key src.f005 as Version,
  key src.f006 as RateID,
      src.f007 as ChargeType,
      src.f008 as CalculationBasis,
      src.f009 as Rate,
      src.f010 as Currency,
      src.f011 as PricingUnit,
      src.f012 as QuantityUnit
}
