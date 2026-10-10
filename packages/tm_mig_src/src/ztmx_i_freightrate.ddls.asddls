// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightRate as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V009R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightRate'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZTMX_I_FreightRate
  as select from ZTMX_I_FreightRateData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.AgreementID as AgreementID,
  key src.Version as Version,
  key src.RateID as RateID,
      src.ChargeType as ChargeType,
      src.CalculationBasis as CalculationBasis,
      src.Rate as Rate,
      src.Currency as Currency,
      src.PricingUnit as PricingUnit,
      src.QuantityUnit as QuantityUnit
}
