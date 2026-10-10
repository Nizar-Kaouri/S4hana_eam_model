// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read MasterCharTextMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V017C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MasterCharTextMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZQMX_C_MasterCharTextMig
  as select from ZQMX_I_MasterCharText as src
{
  key src.Plant as Plant,
  key src.MasterInspectionCharacteristic as MasterInspectionCharacteristic,
  key src.CharacteristicVersion as CharacteristicVersion,
  key src.Language as Language,
      src.CharacteristicDescription as CharacteristicDescription
}
