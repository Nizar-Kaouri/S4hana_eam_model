// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read OperationQuant as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V005R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'OperationQuant'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPPX_I_OperationQuant
  as select from ZPPX_I_OperationQuantData as src
{
  key src.OperationRoutingNumber as OperationRoutingNumber,
  key src.OperationInternalID as OperationInternalID,
      src.OperationQuantity as OperationQuantity,
      src.Unit as Unit,
      src.StandardValue1 as StandardValue1,
      src.StandardValueUnit1 as StandardValueUnit1
}
