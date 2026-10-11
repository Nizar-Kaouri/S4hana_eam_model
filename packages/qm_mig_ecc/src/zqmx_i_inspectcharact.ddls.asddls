// ModuPorter QM migration | Release 1.0.0
// Purpose: Read InspectCharact as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V003R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InspectCharact'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZQMX_I_InspectCharact
  as select from ZQMX_I_InspectCharactData as src
{
  key src.InspectionLot as InspectionLot,
  key src.OperationInternalID as OperationInternalID,
  key src.CharacteristicNumber as CharacteristicNumber,
      src.CharacteristicDescription as CharacteristicDescription
}
