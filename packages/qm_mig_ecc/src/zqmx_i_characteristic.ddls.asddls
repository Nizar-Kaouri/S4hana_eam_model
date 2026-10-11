// ModuPorter QM migration | Release 1.0.0
// Purpose: Read Characteristic as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V004R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Characteristic'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZQMX_I_Characteristic
  as select from ZQMX_I_CharacteristicData as src
{
  key src.InspectionLot as InspectionLot,
  key src.OperationInternalID as OperationInternalID,
  key src.CharacteristicNumber as CharacteristicNumber,
      src.MeanValue as MeanValue,
      src.MinimumValue as MinimumValue,
      src.MaximumValue as MaximumValue
}
