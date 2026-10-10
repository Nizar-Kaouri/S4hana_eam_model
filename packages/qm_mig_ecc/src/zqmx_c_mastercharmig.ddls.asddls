// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read MasterCharMig as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZQMX_V016C'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MasterCharMig'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #CONSUMPTION
define view ZQMX_C_MasterCharMig
  as select from ZQMX_I_MasterChar as src
{
  key src.Plant as Plant,
  key src.MasterInspectionCharacteristic as MasterInspectionCharacteristic,
  key src.CharacteristicVersion as CharacteristicVersion,
      src.ValidityStartDate as ValidityStartDate,
      src.DeletionFlag as DeletionFlag,
      src.ControlIndicators as ControlIndicators
}
