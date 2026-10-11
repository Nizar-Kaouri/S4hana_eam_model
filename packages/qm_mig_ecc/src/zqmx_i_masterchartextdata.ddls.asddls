// ModuPorter QM migration | Release 1.0.0
// Purpose: Read MasterCharTextData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZQMX_V017'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'MasterCharTextData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZQMX_I_MasterCharTextData
  as select from qpmt as src
{
  key src.werks as Plant,
  key src.mkmnr as MasterInspectionCharacteristic,
  key src.version as CharacteristicVersion,
  key src.sprache as Language,
      src.kurztext as CharacteristicDescription
}
