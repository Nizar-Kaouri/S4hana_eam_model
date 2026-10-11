// ModuPorter QM migration | Release 1.0.0
// Purpose: Read SingleResultMig as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V005C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SingleResultMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZQMX_C_SingleResultMig
  as select from ZQMX_I_SingleResult as src
{
  key src.InspectionLot as InspectionLot,
  key src.OperationInternalID as OperationInternalID,
  key src.CharacteristicNumber as CharacteristicNumber,
  key src.SampleNumber as SampleNumber,
  key src.ResultNumber as ResultNumber,
      src.MeasuredValue as MeasuredValue
}
