// ModuPorter QM migration | Release 1.0.0
// Purpose: Read InspectCharactData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZQMX_V003'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'InspectCharactData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZQMX_I_InspectCharactData
  as select from qamv as src
{
  key src.prueflos as InspectionLot,
  key src.vorglfnr as OperationInternalID,
  key src.merknr as CharacteristicNumber,
      src.kurztext as CharacteristicDescription
}
