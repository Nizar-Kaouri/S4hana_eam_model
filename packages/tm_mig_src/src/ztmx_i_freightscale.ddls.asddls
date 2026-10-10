// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read FreightScale as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZTMX_V010R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'FreightScale'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZTMX_I_FreightScale
  as select from ZTMX_I_FreightScaleData as src
{
  key src.SourceSystem as SourceSystem,
  key src.SourceClient as SourceClient,
  key src.ExportBatch as ExportBatch,
  key src.AgreementID as AgreementID,
  key src.Version as Version,
  key src.RateID as RateID,
  key src.ScaleLine as ScaleLine,
      src.FromValue as FromValue,
      src.ToValue as ToValue,
      src.ScaleUnit as ScaleUnit,
      src.ScaleRate as ScaleRate,
      src.Currency as Currency
}
