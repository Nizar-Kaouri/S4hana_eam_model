// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ProductionOper as source candidates; approve the key-date population before posting.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
@AbapCatalog.sqlViewName: 'ZPPX_V004R'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProductionOper'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #COMPOSITE
define view ZPPX_I_ProductionOper
  as select from ZPPX_I_ProductionOperData as src
{
  key src.OperationRoutingNumber as OperationRoutingNumber,
  key src.OperationInternalID as OperationInternalID,
      src.Operation as Operation,
      src.OperationText as OperationText,
      src.WorkCenterInternalID as WorkCenterInternalID,
      src.Plant as Plant
}
