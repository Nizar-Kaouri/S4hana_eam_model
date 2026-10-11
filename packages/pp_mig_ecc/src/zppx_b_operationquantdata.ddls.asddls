// ModuPorter PP migration | Release 1.0.0
// Purpose: Read OperationQuantData as source records; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPPX_V005'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'OperationQuantData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPPX_B_OperationQuantData
  as select from afvv as src
{
  key src.aufpl as OperationRoutingNumber,
  key src.aplzl as OperationInternalID,
      src.mgvrg as OperationQuantity,
      src.meinh as Unit,
      src.vgw01 as StandardValue1,
      src.vge01 as StandardValueUnit1
}
