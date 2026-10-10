// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SingleResult as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V005R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SingleResult'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZQMX_I_SingleResult
  as select from ZQMX_I_SingleResultData as src
{
  key src.InspectionLot as InspectionLot,
  key src.OperationInternalID as OperationInternalID,
  key src.CharacteristicNumber as CharacteristicNumber,
  key src.SampleNumber as SampleNumber,
  key src.ResultNumber as ResultNumber,
      src.MeasuredValue as MeasuredValue
}
