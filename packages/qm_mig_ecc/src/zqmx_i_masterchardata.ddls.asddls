// ModuPorter QM migration | Release 1.0.0
// Purpose: Read MasterCharData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZQMX_V016'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MasterCharData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZQMX_I_MasterCharData
  as select from qpmk as src
{
  key src.werks as Plant,
  key src.mkmnr as MasterInspectionCharacteristic,
  key src.version as CharacteristicVersion,
      src.gueltigab as ValidityStartDate,
      src.loekz as DeletionFlag,
      src.steuerkz as ControlIndicators
}
