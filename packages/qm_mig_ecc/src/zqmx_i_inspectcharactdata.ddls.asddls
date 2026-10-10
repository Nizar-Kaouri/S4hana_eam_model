// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read InspectCharactData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] QMX-003: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
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
