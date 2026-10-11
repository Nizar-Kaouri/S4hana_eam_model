// ModuPorter QM migration | Release 1.0.0
// Purpose: Read CharacteristicData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZQMX_V004'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'CharacteristicData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZQMX_B_CharacteristicData
  as select from qamr as src
{
  key src.prueflos as InspectionLot,
  key src.vorglfnr as OperationInternalID,
  key src.merknr as CharacteristicNumber,
      src.mittelwert as MeanValue,
      src.min as MinimumValue,
      src.max as MaximumValue
}
