// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SamplingProcMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V018C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SamplingProcMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZQMX_C_SamplingProcMig
  as select from ZQMX_I_SamplingProc as src
{
  key src.SamplingProcedure as SamplingProcedure,
      src.SamplingType as SamplingType,
      src.ValuationMode as ValuationMode
}
