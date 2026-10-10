// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read OperationQuantData as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] PPX-005: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AbapCatalog.sqlViewName: 'ZPPX_V005'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'OperationQuantData'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view ZPPX_I_OperationQuantData
  as select from afvv as src
{
  key src.aufpl as OperationRoutingNumber,
  key src.aplzl as OperationInternalID,
      src.mgvrg as OperationQuantity,
      src.meinh as Unit,
      src.vgw01 as StandardValue1,
      src.vge01 as StandardValueUnit1
}
