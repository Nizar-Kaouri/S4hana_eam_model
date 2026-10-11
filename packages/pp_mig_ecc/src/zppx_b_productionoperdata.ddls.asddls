// ModuPorter PP migration | Release 1.0.0
// Purpose: Read ProductionOperData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPPX_V004'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProductionOperData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPPX_B_ProductionOperData
  as select from afvc as src
{
  key src.aufpl as OperationRoutingNumber,
  key src.aplzl as OperationInternalID,
      src.vornr as Operation,
      src.ltxa1 as OperationText,
      src.arbid as WorkCenterInternalID,
      src.werks as Plant
}
