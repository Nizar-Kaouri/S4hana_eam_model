// ModuPorter QM migration | Release 1.0.0
// Purpose: Read SamplingProc as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V018R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SamplingProc'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZQMX_I_SamplingProc
  as select from ZQMX_I_SamplingProcData as src
{
  key src.SamplingProcedure as SamplingProcedure,
      src.SamplingType as SamplingType,
      src.ValuationMode as ValuationMode
}
