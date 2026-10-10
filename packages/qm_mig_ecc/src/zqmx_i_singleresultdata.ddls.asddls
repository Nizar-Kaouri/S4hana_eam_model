// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read SingleResultData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] QMX-005: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZQMX_V005'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'SingleResultData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZQMX_I_SingleResultData
  as select from qase as src
{
  key src.prueflos as InspectionLot,
  key src.vorglfnr as OperationInternalID,
  key src.merknr as CharacteristicNumber,
  key src.probenr as SampleNumber,
  key src.detailerg as ResultNumber,
      src.messwert as MeasuredValue
}
